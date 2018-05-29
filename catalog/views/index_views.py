from django.contrib.auth.decorators import login_required
from ..models import Book, Comic, Item_request, Request_message
from django.shortcuts import render

@login_required
def index(request):
    num_books=Book.objects.all().count()
    num_comics=Comic.objects.all().count()
    reqitem=Item_request.objects.filter(filled_at= None, is_accepted=None)
    reqown=Item_request.objects.filter(item__owned_by=request.user, filled_at=None, is_accepted=None)
    reqcount = reqown.count()
    mymes=Request_message.objects.filter(request__requester=request.user, is_viewed = None)
    mescount=mymes.count()
    pendloan=Item_request.objects.filter(item__owned_by=request.user, filled_at=None, is_accepted=True)
    return render(
        request,
        'index.html',
        context={'reqown':reqown, 'num_books':num_books, 'num_comics':num_comics, 'reqitem':reqitem, 'reqcount':reqcount,'mescount':mescount,  'mymes':mymes ,'pendloan':pendloan},
)
