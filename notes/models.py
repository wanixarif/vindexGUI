from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.urls import reverse
from django.core.files import File

class FilePost(models.Model):
    title = models.CharField(max_length=100)
    file0 = models.FileField(null=True, upload_to='filepost/', blank=True)
    file1 = models.FileField(null=True, upload_to='filepost/', blank=True)
    file2 = models.FileField(null=True, upload_to='filepost/', blank=True)
    file3 = models.FileField(null=True, upload_to='filepost/', blank=True)
    file4 = models.FileField(null=True, upload_to='filepost/', blank=True)
    file5 = models.FileField(null=True, upload_to='filepost/', blank=True)
    file6 = models.FileField(null=True, upload_to='filepost/', blank=True)

    author = models.ForeignKey(User, on_delete=models.CASCADE)
    date_posted = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('material', kwargs={'pk': self.pk})
