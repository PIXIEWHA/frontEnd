from rest_framework import serializers
from inside import models

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'username',
            'email',
            'password'
        )
        model = models.USER

class RbSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'rb_id',
            'rb_password'
        )
        model = models.RASPBERRY

class VideoSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            'video_id',
            'video_file',
            'video_date'
        )
        model = models.VIDEO