from django.urls import path

from .views import ListUser, ListRb

urlpatterns = [
    path('user/', ListUser.as_view()),
    path('rbpi/', ListRb.as_view()),
]