from django.urls import path
from gratitude_server_app import views

urlpatterns = [
    path("", views.home, name="home"),
]