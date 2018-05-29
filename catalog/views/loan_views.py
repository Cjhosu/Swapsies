from ..forms import UpdateBorrowerForm
from ..models import Item_status, Item_request, Request_message, User
from datetime import datetime
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404

def MarkReturned(request, pk):
    item = get_object_or_404(Item_status, pk=pk)
    if request.method == 'POST':
        item.borrower = None
        item.save()
        return HttpResponseRedirect('/catalog/mybooks')
    else:
        return HttpResponseRedirect('/catalog/mybooks/')

def AcceptRequest(request, pk):
    req = get_object_or_404(Item_request, pk=pk)
    if request.method == 'POST':
        req.is_accepted = True
        req.save()
        mes = Request_message()
        mes.request = Item_request.objects.get(pk=pk)
        mes.message = 'Your request for '+str(req.item)+' has been accepted'
        mes.save()
        return HttpResponseRedirect('/catalog/')
    else:
        return HttpResponseRedirect('/catalog/')


def PassBorrower(request, pk):
    item = get_object_or_404(Item_status, pk=pk)
    if request.method == 'POST':
        request.session['pk']=pk
        return HttpResponseRedirect('/catalog/update_borrower')
    else:
        return HttpResponseRedirect('/catalog/mybooks/')

def UpdateBorrower(request):
    if request.method == 'POST':
        form = UpdateBorrowerForm(request.user.id, request.POST)
        if form.is_valid():
            pk= request.session['pk']
            userid = form.cleaned_data['user']
            try:
                user = User.objects.get(pk=userid)
            except:
                return HttpResponseRedirect('/catalog/inactive_user/'+pk)
            this = Item_status.objects.get(pk=pk)
            this.borrower = user
            this.save()
            obj, created = Item_request.objects.update_or_create(
                item_id = this.item_id,
                requester = this.borrower,
                filled_at = None,
              defaults = {'requested_at': datetime.now()}
            )
            fillreq = Item_request.objects.get(item_id = this.item_id,requester = this.borrower, filled_at = None)
            if fillreq.filled_at == None:
                fillreq.filled_at = datetime.now()
                fillreq.save()
            return HttpResponseRedirect('/catalog/mybooks/')
    elif request.method == 'GET':
        pk= request.session['pk']
        form = UpdateBorrowerForm(request.user.id)
        return render(request,'catalog/update_borrower.html', {'form':form})
