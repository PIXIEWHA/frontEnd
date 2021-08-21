from django.urls import path

from .views import ListUser, ListRb, ListReport

urlpatterns = [
    path('user/', ListUser.as_view()),
    path('rbpi/', ListRb.as_view()),
    path('report/', ListReport.as_view()),
]