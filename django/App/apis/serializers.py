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

class ReportSerializer(serializers.ModelSerializer):
    class Meta:
        fields = (
            "key",
            "username",
            "telno",
            "content",
            "citizengroup",
            "pointX",
            "pointY",
            "rtn_addr",
            "upfile",
            "upfile2",
            "upfile3",
            "citizen_img_wdate",
            "citizen_img_wdate2",
            "citizen_img_wdate3",
            "device"
        )
        model = models.REPORT