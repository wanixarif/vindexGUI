"""textbin URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
from .views import *
from django.conf.urls import url

urlpatterns = [
    path('', Posts.as_view(), name='index'),
    path('about/', views.about, name="about"),

    path('materials/', materiallistview.as_view(), name="materials"),

    path('material/<int:pk>', filefullpost.as_view(), name='material'),

    path('materialpost/', FilePostCreateView.as_view(), name="materialpost"),


    path("notes/material/<int:pk>/update",
         FilePostUpdateView.as_view(), name="material_update"),

    url(r'^ajax/getTimestamp/$', getTimestamp, name='getTimestamp'),

    path("notes/material/<int:pk>/delete",
         FilePostDeleteView.as_view(), name="material_delete"),

]
