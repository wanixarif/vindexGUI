import os
from difflib import get_close_matches
from .subtitleGen import generate_subtitles

def getSubTimeStamp(fname,search_term):
    responseArray=[]
    occurence_number = 0
    mult_occurences = list()
    sentence_list=list()
    word_list=set()
    found=True
    num=0
    sub_name = fname[0:len(fname)-fname[::-1].find('.')] + 'srt'

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
                responseArray.append([-1,', '.join(get_close_matches(search_term, list(word_list)))])
            elif num==0:
                responseArray.append([-2,""])

    if len(mult_occurences) > 1:
        for i in range(0, len(mult_occurences)):
            responseArray.append([int(mult_occurences[i][0:2])*3600 + int(mult_occurences[i][3:5])*60 + int(mult_occurences[i][6:]),sentence_list[i]])
    else:
        responseArray.append([int(mult_occurences[0][0:2])*3600 + int(mult_occurences[0][3:5])*60 + int(mult_occurences[0][6:]),""])
    return responseArray
