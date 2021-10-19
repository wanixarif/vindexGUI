from django import template

register = template.Library()

@register.filter
def vid_url(value):
    return value.replace("mp4","srt")