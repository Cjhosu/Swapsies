from ..forms import AddBookForm, UpdateBookForm
from ..models import Book, Item, Item_request, Item_status, Item_type
from .item_views import CreateItem, AddStatus
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from datetime import datetime
from django.db.models import Q
from django.views import generic, View
from django.shortcuts import render,redirect, get_object_or_404
from django.http import HttpResponseRedirect

class BookListView(LoginRequiredMixin,generic.ListView):
    model = Book
    paginate_by = 10
    ordering = ('title', )

    def get_queryset(self,**kwargs):
        filter_val = self.request.GET.get('search', '')
        return Book.objects.filter(Q(title__icontains = filter_val) | Q(author_last__icontains = filter_val)).order_by('title')

class BookDetailView(LoginRequiredMixin,generic.DetailView):
    model = Book

def AddNewBook(request):
    if request.POST:
        form = AddBookForm(request.POST)
        item_type = Item_type.objects.get(type = 'Book')
        type_id = item_type.id
        if form.is_valid():
            obj_id = CreateItem(request, form, type_id)
            CreateBookRecord(request, form, obj_id)
            AddStatus(request, obj_id)
            return HttpResponseRedirect('/catalog/books/')
    else:
        form = AddBookForm()
    return render(request, 'catalog/add_book_form.html', {'form': form})

def CreateBookRecord(request, form, obj_id):
    newbook = Book()
    newbook.item_id = obj_id
    newbook.title = form.cleaned_data['title']
    newbook.author_first = form.cleaned_data['author_first']
    newbook.author_last = form.cleaned_data['author_last']
    newbook.isbn = form.cleaned_data['isbn']
    newbook.publisher = form.cleaned_data['publisher']
    newbook.year = form.cleaned_data['year']
    newbook.description  = form.cleaned_data['description']
    newbook.save()

class BookUpdateView(LoginRequiredMixin,View):
    model = Book

    def get(self, request, pk):
        bkinstance = get_object_or_404(Book, pk=pk)
        form = UpdateBookForm(instance=bkinstance)
        return render(request, 'catalog/book_form.html', {'form': form})

    def post(self, request, pk):
        bkinstance = get_object_or_404(Book, pk=pk)
        form = UpdateBookForm(request.POST , instance=bkinstance)
        if form.is_valid():
            form.save()
            return redirect('/catalog/books/')

def IssueBookRequest(request,pk):
    bookreq = get_object_or_404(Book, pk=pk)
    if request.method == 'POST':
        bookitem = Book.objects.get(pk=pk)
        obj, created = Item_request.objects.update_or_create(
            item_id = bookitem.item_id,
            requester = request.user,
            filled_at = None,
          defaults = {'requested_at': datetime.now()}
        )
        messages.info(request, 'Your request has been received!')
        return HttpResponseRedirect('/catalog/books/'+pk)
    else:
        return HttpResponseRedirect('/catalog/')

def IssueBookRequest(request,pk):
    bookreq = get_object_or_404(Book, pk=pk)
    if request.method == 'POST':
        bookitem = Book.objects.get(pk=pk)
        obj, created = Item_request.objects.update_or_create(
            item_id = bookitem.item_id,
            requester = request.user,
            filled_at = None,
          defaults = {'is_accepted':None, 'requested_at': datetime.now()}
        )
        messages.info(request, 'Your request has been received!')
        return HttpResponseRedirect('/catalog/books/'+pk)
    else:
        return HttpResponseRedirect('/catalog/')
