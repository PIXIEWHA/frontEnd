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
            'email',
            'rb_id',
            'rb_password'
        )
        model = models.RASPBERRY