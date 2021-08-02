from django.urls import path

from .views import ListUser, ListRb, ListVideo

urlpatterns = [
    path('user/', ListUser.as_view()),
    path('rbpi/', ListRb.as_view()),
    path('video/', ListVideo.as_view()),
]