from django.db import models

class Todos(models.Model):
    task= models.CharField(max_length=100)
    date=models.DateField(auto_now_add=True)


    def __str__ (self):
        return f"{self.task},{self.date}"