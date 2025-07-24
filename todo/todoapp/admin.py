from django.contrib import admin
from .models import Todos

class TodosAdmin(admin.ModelAdmin):
  list_display = ("user","task", "date")
  
admin.site.register(Todos, TodosAdmin)