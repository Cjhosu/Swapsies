from datetime import datetime
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views import generic
from ..models import Item, Item_status
from ..forms import AddItemForm

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

def AddNewItem(request):
    if request.method == 'POST':
        form = AddItemForm(request.POST)
        if form.is_valid():
            itemtype = form.cleaned_data['item_type']
            if itemtype.type == 'Book':
                return HttpResponseRedirect('/catalog/books/add')
            if itemtype.type == 'Comic':
                return HttpResponseRedirect('/catalog/comics/add')
            else:
                return HttpResponseRedirect('/catalog/books/')
    else:
        form = AddItemForm()
        return render(request, 'catalog/add_item.html', {'form':form})

def CreateItem(request, form, type_id):
    if request.POST:
        additem = Item()
        additem.item_name = form.cleaned_data['item_name']
        additem.item_type_id = type_id
        additem.owned_by = request.user
        additem.added_at = datetime.now()
        additem.updated_at = datetime.now()
        additem.save()
        return additem.id

def AddStatus(request,obj_id):
    if request.POST:
        addstatus = Item_status()
        addstatus.item_id = obj_id
        addstatus.save()

