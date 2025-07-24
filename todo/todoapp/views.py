from django.shortcuts import render,redirect,HttpResponse
from .form import Signup
from django.contrib.auth import authenticate, login as auth_login
from django.contrib import messages
from .models import Todos


def signup(request):
    if request.method=='POST':
        form = Signup(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
        return render(request,'signup.html',{'form':form})
    else:
        form = Signup(request.POST)
        return render(request,'signup.html',{'form':form})
    

def login(request):
    if request.method=='POST':
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)
        if user is not None:
            auth_login(request, user)
            return redirect('home')
        else:
            return redirect('login')
    else:
        return render(request,'login.html')
    

def home(request):
    if request.method =='POST':
        task = request.POST.get('task')
        if task:
            Todos.objects.create(user=request.user,task=task)
            return redirect('home')
        
    todos = Todos.objects.filter(user=request.user)
    return render(request,'home.html',{'todos':todos})


def delete(request,id):
    if request.method == 'POST':
        Todos.objects.get(id=id).delete()
        return redirect('home')
    return redirect('home')
   