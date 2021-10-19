import os
from difflib import get_close_matches
from .subtitleGen import generate_subtitles

def getSubTimeStamp(fname,search_term):
    resp=""
    occurence_number = 0
    mult_occurences = list()
    sentence_list=list()
    word_list=set()
    found=True
    isint=1
    num=0
    sub_name = fname[0:len(fname)-fname[::-1].find('.')] + 'srt'

    #search
    while found:
        subs_file = open(sub_name, "r")
        search_term = search_term.lower()
        while subs_file.readline():
            flag = 0
            time_stamp = subs_file.readline()
            line = subs_file.readline().lower()
            para=''
            while line and line != '\n':
                para+=line
                word_list=word_list|set(line.strip('.\n').split())
                if search_term in line.strip().split() or (search_term in line.strip() and ' ' in search_term):
                    num+=1
                    if time_stamp[0:8] not in mult_occurences:
                        mult_occurences.append(time_stamp[:8])
                    flag = 1
                    found=False
                line = subs_file.readline().lower()
            if(flag==1):
                sentence_list.append(para)
        if not flag:
            if len(get_close_matches(search_term, list(word_list))) > 0 and num==0:
                print('Not found try searching one of these:')
                print(', '.join(get_close_matches(search_term, list(word_list))))
                resp+='Not found try searching one of these:'+', '.join(get_close_matches(search_term, list(word_list)))
            elif num==0:
                print("No matches or words close to the entered term found")
                resp+="No matches"

    if len(mult_occurences) > 1:
        print("More than one occurence found:")
        resp+="More than one occurence found:\n"
        for i in range(0, len(mult_occurences)):
            print(i+1, ") ",sentence_list[i]," at ", mult_occurences[i],sep='')
            resp+=str(i+1) + ") " + sentence_list[i] + " at " + mult_occurences[i] +"\n"
        # while isint:
        #     #Check if not a number
        #     try:
        #         occurence_number = int(input("Enter your choice to play at: "))-1
        #         #choice constraint
        #         if occurence_number<len(mult_occurences) and occurence_number>=0:
        #             isint=0
        #         else:
        #             print("Invalid choice")
        #     except:
        #         print("Invalid choice")
    else:
        print("Found at ",mult_occurences[0])
        resp+="Found at "+mult_occurences[0]
    # t = mult_occurences[occurence_number]
    # time = int(t[0:2])*3600 + int(t[3:5])*60 + int(t[6:])
    # time_command = 'vlc --start-time={} {} 2> /dev/null'.format(time,fname)
    # os.system(time_command)
    return resp
