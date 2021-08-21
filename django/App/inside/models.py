from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here. db_model
class USER(AbstractUser):
    username = models.CharField(db_index=True, unique=True, max_length=255)
    email = models.EmailField(max_length=200, unique=True)
    password = models.CharField(max_length=200)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
    
    def __str__(self):
        return self.email

class RASPBERRY(models.Model):
    email = models.CharField(max_length=200)
    rb_id = models.CharField(max_length=200)
    rb_password = models.CharField(max_length=200)

    def __str__(self):
        return self.rb_id

class REPORT(models.Model):
    email = models.EmailField(max_length=200)
    key = models.CharField(max_length=200)
    username = models.CharField(max_length=200)
    telno = models.CharField(max_length=200)
    content = models.CharField(max_length=200)
    citizengroup = models.CharField(max_length=200)
    pointX = models.CharField(max_length=200)
    pointY = models.CharField(max_length=200)
    rtn_addr = models.CharField(max_length=200)
    upfile = models.CharField(max_length=200)
    upfile2 = models.CharField(max_length=200, null = True, blank = True)
    upfile3 = models.CharField(max_length=200, null = True, blank = True)
    citizen_img_wdate = models.CharField(max_length=200)
    citizen_img_wdate2 = models.CharField(max_length=200, null = True, blank = True)
    citizen_img_wdate3 = models.CharField(max_length=200, null = True, blank = True)
    device = models.CharField(max_length=200)

    def __str__(self):
        return self.email