from .. forms import AddComicForm, UpdateComicForm
from ..models import Comic, Item, Item_request, Item_status
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from datetime import datetime
from django.db.models import Q
from django.views import generic, View
from django.shortcuts import render,redirect, get_object_or_404
from django.http import HttpResponseRedirect

class ComicListView(LoginRequiredMixin,generic.ListView):
    model = Comic
    paginate_by = 10
    ordering = ('title', )

    def get_queryset(self,**kwargs):
        filter_val = self.request.GET.get('search', '')
        return Comic.objects.filter(Q(title__icontains = filter_val) | Q(series__icontains = filter_val)).order_by('title')

class ComicUpdateView(LoginRequiredMixin, View):
    model = Comic

    def get(self, request, pk):
      cminstance= get_object_or_404(Comic, pk=pk)
      form = UpdateComicForm(instance=cminstance)
      return render(request, 'catalog/comic_form.html', {'form': form})

    def post(self, request, pk):
      cminstance = get_object_or_404(Comic, pk=pk)
      form = UpdateComicForm(request.POST, instance=cminstance)
      if form.is_valid():
        form.save()
        return redirect('/catalog/comics/')

class ComicDetailView(LoginRequiredMixin,generic.DetailView):
    model = Comic

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

def IssueComicRequest(request,pk):
    comicreq = get_object_or_404(Comic, pk=pk)
    if request.method == 'POST':
        comicitem = Comic.objects.get(pk=pk)
        obj, created = Item_request.objects.update_or_create(
            item_id = comicitem.item_id,
            requester = request.user,
            filled_at = None,
          defaults = {'is_accepted':None, 'requested_at':datetime.now()}
        )
        messages.info(request, 'Your request has been received!')
        return HttpResponseRedirect('/catalog/comics/'+pk)
    else:
        return HttpResponseRedirect('/catalog/')
