from django.db import models
from django.contrib.auth.models import User


class Todos(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    task= models.CharField(max_length=100)
    date=models.DateField(auto_now_add=True)


    def __str__ (self):
        return f"{self.user},{self.task},{self.date}"