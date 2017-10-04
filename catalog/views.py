
# Create your views here.
from django.shortcuts import render, get_object_or_404, redirect
from .forms import AddBookForm, AddComicForm, UpdateBorrowerForm, AddItemForm, SignUpForm
from django.http import HttpResponseRedirect
from datetime import datetime
from .models import Item, User, Item_type, Book, Comic, Item_status
from django.views import generic
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.db.models import F

def index(request):
    num_books=Book.objects.all().count()
    num_comics=Comic.objects.all().count()
    num_visits=request.session.get('num_visits', 0)
    request.session['num_visits'] = num_visits+1

    return render(
        request,
        'index.html',
        context={'num_books':num_books, 'num_comics':num_comics, 'num_visits':num_visits},
)


class BookListView(LoginRequiredMixin,generic.ListView):
    model = Book
    paginate_by = 10


class ComicListView(LoginRequiredMixin,generic.ListView):
    model = Comic
    paginate_by = 10

class BookDetailView(LoginRequiredMixin,generic.DetailView):
    model = Book


class ComicDetailView(LoginRequiredMixin,generic.DetailView):
    model = Comic

class LoanedItemsByUserListView(LoginRequiredMixin,generic.ListView):
    model = Item_status
    template_name ='catalog/item_status_list_borrowed_user.html'
    paginate_by = 10

    def get_queryset(self):
        return Item_status.objects.filter(borrower=self.request.user).order_by('due_back')

    def get_context_data(self, **kwargs):
        context = super(LoanedItemsByUserListView, self).get_context_data(**kwargs)
        context['Owned_list'] = Item.objects.filter(owned_by=self.request.user, item_type = 1)
        context['Loaned_list'] = Item_status.objects.filter(item__owned_by=self.request.user).exclude(borrower=self.request.user).exclude(borrower__isnull=True)
        context['Other_list'] = Item_status.objects.filter(item__owned_by=self.request.user).exclude(borrower=self.request.user).filter(borrower__isnull=True)
        return context


def AddNewBook(request):
    if request.POST:
        form = AddBookForm(request.POST)
        if form.is_valid():
            additem = Item()
            additem.item_name = form.cleaned_data['item_name']
            additem.item_type_id = 1
            additem.owned_by = request.user
            additem.added_at = datetime.now()
            additem.updated_at = datetime.now()
            additem.save()

            obj_id = additem.id

            addbook = Book()
            addbook.item_id = additem.id
            addbook.title = form.cleaned_data['title']
            addbook.author_first = form.cleaned_data['author_first']
            addbook.author_last = form.cleaned_data['author_last']
            addbook.isbn = form.cleaned_data['isbn']
            addbook.publisher = form.cleaned_data['publisher']
            addbook.year = form.cleaned_data['year']
            addbook.description  = form.cleaned_data['description']
            addbook.save()

            addstatus = Item_status()
            addstatus.item_id = additem.id

            addstatus.save()

            return HttpResponseRedirect('/catalog/books/')
    else:
        form = AddBookForm()
    return render(request, 'catalog/add_book_form.html', {'form': form})


def AddNewComic(request):
    if request.POST:
        form = AddComicForm(request.POST)
        if form.is_valid():
            additem = Item()
            additem.item_name = form.cleaned_data['item_name']
            additem.item_type_id = 2
            additem.owned_by = request.user
            additem.added_at = datetime.now()
            additem.updated_at = datetime.now()
            additem.save()

            obj_id = additem.id

            addcomic = Comic()
            addcomic.item_id = additem.id
            addcomic.publisher = form.cleaned_data['publisher']
            addcomic.series = form.cleaned_data['series']
            addcomic.title = form.cleaned_data['title']
            addcomic.number = form.cleaned_data['number']
            addcomic.year = form.cleaned_data['year']
            addcomic.month = form.cleaned_data['month']
            addcomic.description  = form.cleaned_data['description']
            addcomic.save()

            addstatus = Item_status()
            addstatus.item_id = additem.id

            addstatus.save()

            return HttpResponseRedirect('/catalog/comics/')
    else:
        form = AddComicForm()
    return render(request, 'catalog/add_comic_form.html', {'form': form})

def AddNewItem(request):
    if request.method == 'POST':
        form = AddItemForm(request.POST)
        if form.is_valid():
            itemtype = form.cleaned_data['item_type']
            print(itemtype.type)
            if itemtype.type == 'Book':
                return HttpResponseRedirect('/catalog/books/add')
            if itemtype.type == 'Comic':
                return HttpResponseRedirect('/catalog/comics/add')
            else:
                return HttpResponseRedirect('/catalog/books/')
    else:
        form = AddItemForm()
        return render(request, 'catalog/add_item.html', {'form':form})

def MarkReturned(request, pk):
    item = get_object_or_404(Item_status, pk=pk)
    if request.method == 'POST':
        item.borrower = None
        item.save()
        return HttpResponseRedirect('/catalog/mybooks')
    else:
        return HttpResponseRedirect('/catalog/mybooks/')

def PassBorrower(request, pk):
    item = get_object_or_404(Item_status, pk=pk)
    if request.method == 'POST':
        request.session['pk']=pk
        return HttpResponseRedirect('/catalog/update_borrower')
    else:
        return HttpResponseRedirect('/catalog/mybooks/')


def UpdateBorrower(request):
    if request.method == 'POST':
        form = UpdateBorrowerForm(request.POST)
        if form.is_valid():
            pk= request.session['pk']
            user = form.cleaned_data['user']
            this = Item_status.objects.get(pk=pk)
            this.borrower = user
            this.save()
            return HttpResponseRedirect('/catalog/mybooks/')
    elif request.method == 'GET':
        pk= request.session['pk']
        form = UpdateBorrowerForm()
        return render(request,'catalog/update_borrower.html', {'form':form})

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
