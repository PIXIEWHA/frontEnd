from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from inside import models
from .serializers import UserSerializer
from .serializers import RbSerializer
from .serializers import ReportSerializer

class ListUser(generics.ListCreateAPIView):
    queryset = models.USER.objects.all()
    serializer_class = UserSerializer

class ListRb(generics.ListCreateAPIView):
    queryset = models.RASPBERRY.objects.all()
    serializer_class = RbSerializer

class ListReport(generics.ListCreateAPIView):
    queryset = models.REPORT.objects.all()
    serializer_class = ReportSerializer