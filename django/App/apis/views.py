from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from inside import models
from .serializers import UserSerializer
from .serializers import RbSerializer

class ListUser(generics.ListCreateAPIView):
    queryset = models.USER.objects.all()
    serializer_class = UserSerializer

class ListRb(generics.ListCreateAPIView):
    queryset = models.RASPBERRY.objects.all()
    serializer_class = RbSerializer