from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import FilePost
import os
from django.views.generic import DetailView, ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.conf import settings
from django.http import HttpResponseRedirect
from django.contrib.auth.models import User
from .vindex import getSubTimeStamp
from django.http import JsonResponse
# Create your views here.


class Posts(ListView):
    model = FilePost
    template_name = 'notes/index.html'
    context_object_name = 'filepost'
    ordering = ["-date_posted"]





def about(request):
    return render(request, "notes/about.html")




class filefullpost(DetailView):
    model = FilePost






class FilePostCreateView(LoginRequiredMixin, CreateView):  # LoginRequiredMixin,
    model = FilePost
    fields = [

        "title",
       
        "file0",
        # "file1",
        # "file2",
        # "file3",
        # "file4",
        # "file5",
        # "file6",
    ]
    
    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)





class materiallistview(ListView):
    model = FilePost
    template_name = 'notes/filepost_all.html'
    context_object_name = 'filepost'
    ordering = ["-date_posted"]
    paginate_by = 6




# LoginRequiredMixin,
class FilePostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = FilePost
    fields = [

        "title", 
        "file0",
        # "file1",
        # "file2",
        # "file3",
        # "file4",
        # "file5",
        # "file6",


    ]

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False




class FilePostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = FilePost
    success_url = "/notes"

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False

class SemesterMaterialListView(ListView):
    model = FilePost
    template_name = "notes/filter.html"  # app/model_viewtype.html
    context_object_name = "posts"
    # ordering = ["-date_posted"]

    def get_queryset(self):

        return FilePost.objects.filter(semester=self.kwargs.get('semester')).order_by('-date_posted')


class BranchMaterialListView(ListView):
    model = FilePost
    template_name = "notes/filter.html"  # app/model_viewtype.html
    context_object_name = "posts"
    # ordering = ["-date_posted"]

    def get_queryset(self):

        return FilePost.objects.filter(stream=self.kwargs.get('branch').upper()).order_by('-date_posted')



def getTimestamp(request):

    fileName = ".."+request.GET.get('fileName', None)
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, fileName)

    searchTerm = request.GET.get('searchTerm', None)

    resp=getSubTimeStamp(filename,searchTerm)
    data = {
        'result': getSubTimeStamp(filename,searchTerm)
    }
    return JsonResponse(data)