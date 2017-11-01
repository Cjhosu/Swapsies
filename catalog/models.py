import datetime
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
# Create your models here.

@property
def is_overdue(self):
    if self.due_back and date.today() > self.due_back:
        return True
    return False

class Item_type(models.Model):
    type = models.CharField(max_length=50)
    def __str__(self):
      return self.type

class Item(models.Model):
    item_name = models.CharField(max_length=100)
    item_type = models.ForeignKey(Item_type, on_delete=models.SET_NULL, null=True)
    owned_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    added_at = models.DateTimeField('date item added')
    updated_at = models.DateTimeField('last update')
    def __str__(self):
      return self.item_name

class Book(models.Model):
    item = models.ForeignKey(Item, on_delete=models.SET_NULL, null=True, related_name = 'bookit',)
    title = models.CharField(max_length=255)
    author_first = models.CharField(max_length=100)
    author_last = models.CharField(max_length=100)
    isbn = models.CharField(max_length=15)
    publisher = models.CharField(max_length=30)
    year = models.CharField(max_length=4)
    description = models.TextField(default=None, blank=True, null=True)
    def __str__(self):
      return self.title
    def item_book(self):
      return self.item

class Comic(models.Model):
    item = models.ForeignKey(Item, on_delete=models.SET_NULL, null=True, related_name = 'comicit')
    publisher = models.CharField(max_length=30)
    series = models.CharField(max_length=50)
    title = models.CharField(max_length=255)
    number = models.IntegerField(default=None, blank=True, null=True)
    year = models.CharField(max_length=4)
    month = models.CharField(max_length=10, default=None, blank=True, null=True)
    description = models.CharField(max_length=500, default=None, blank=True, null=True)
    def __str__(self):
      return (self.series)


class Request_type(models.Model):
    type = models.CharField(max_length=25)
    def __str__(self):
        return (self.type)


class Item_request(models.Model):
    item = models.ForeignKey(Item, on_delete=models.SET_NULL, null=True)
    requester = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    requested_at = models.DateTimeField(default=None, blank=True, null=True)
    filled_at = models.DateTimeField(default=None, blank=True, null=True)
    is_accepted = models.NullBooleanField(default=None, blank=True, null=True)
    request_type = models.ForeignKey(Request_type, on_delete=models.SET_NULL, null=True)
    def __str__(self):
      return str(self.item)
    def reqown(self):
      return self.objects.filter(filled_at=None).item.owned_by


class Request_message(models.Model):
    request =  models.ForeignKey(Item_request, on_delete=models.SET_NULL, null=True)
    message = models.TextField(default=None, blank=True, null=True)
    is_viewed = models.NullBooleanField(default=None, blank=True, null=True)

class Item_status(models.Model):
    item = models.ForeignKey(Item, on_delete=models.SET_NULL, null=True)
    borrower = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    loaned_at = models.DateTimeField(default=None, blank=True, null=True)
    due_back = models.DateTimeField(default=None, blank=True, null=True)
    def __str__(self):
        if not self.borrower:
          return"?"
        return str(self.borrower)
    def __time__(self):
     return self.loaned_at
    def itemname(self):
      return self.item.item_name
