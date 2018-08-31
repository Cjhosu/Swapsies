from ..forms import InactiveUserForm, SignUpForm
from ..models import Item_status, User
from django.http import HttpResponseRedirect
from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect

def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            adduser = User.objects.get(username=username)
            adduser.email = form.cleaned_data['email']
            adduser.first_name = form.cleaned_data['first_name']
            adduser.last_name = form.cleaned_data['last_name']
            adduser.save()
            login(request, user)
            return redirect('index')
    else:
        form = SignUpForm()
    return render(request, 'signup.html', {'form': form})

def CreateInactiveUser(request, pk):
    if request.method == 'POST':
        form = InactiveUserForm(request.POST)
        if form.is_valid():
            this = User()
            this.username = form.cleaned_data['display_name']
            this.first_name = form.cleaned_data['first_name']
            this.last_name = form.cleaned_data['last_name']
            this.is_active = 'f'
            this.save()
            brw = Item_status.objects.get(pk=pk)
            brw.borrower = this
            brw.save()
            return HttpResponseRedirect('/catalog/mybooks')
    else:
        form = InactiveUserForm()
        return render(request, 'catalog/inactive_user.html', {'form': form})
