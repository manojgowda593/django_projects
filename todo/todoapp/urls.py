from django.contrib import admin
from django.urls import path
from . import views


urlpatterns = [
    path('signup/',views.signup,name='signup'),
    path('',views.login,name='login'),
    path('home',views.home,name='home'),
    path('delete/<int:id>',views.delete,name='delete'),
    path('logout/',views.logoutk_view,name="logout"),
    path('health/', views.health_check)
]
