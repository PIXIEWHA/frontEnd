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
    rb_id = models.CharField(max_length=200)
    rb_password = models.CharField(max_length=200)

    def __str__(self):
        return self.rb_id

class VIDEO(models.Model):
    video_id = models.CharField(max_length=200)
    video_file = models.FileField()
    video_date = models.DateField()

    def __str__(self):
        return self.video_id

class CHECK(models.Model):
    location_x = models.FloatField()
    location_y = models.FloatField()
    trash_dumping_date = models.DateField()

    def __str__(self):
        return self.person_id

class WIFI(models.Model):
    wifi_id = models.CharField(max_length=200)
    wifi_password = models.CharField(max_length=200)
    wifi_connect = models.BooleanField()

    def __str__(self):
        return self.wifi_id

class PERSON(models.Model):
    person_id = models.CharField(max_length=200)

    def __str__(self):
        return self.wifi_id

class TRANSRECIEVER(models.Model):
    send_status = models.CharField(max_length=200)
    receive_status = models.CharField(max_length=200)

    def __str__(self):
        return self.wifi_id