from django import forms
from django.forms import ModelForm
from .models import Item_type , Item_status, User

class AddBookForm(forms.Form):
    item_id = forms.IntegerField
    item_name = forms.CharField(max_length=100)
    title = forms.CharField(max_length=255)
    author_first = forms.CharField(max_length=100)
    author_last = forms.CharField(max_length=100)
    isbn = forms.CharField(max_length=15)
    publisher = forms.CharField(max_length=30)
    year = forms.CharField(max_length=4)
    description = forms.CharField(widget=forms.Textarea)

class AddItemForm(forms.Form):
    item_type = forms.ModelChoiceField(queryset=Item_type.objects.all())

class UpdateBorrowerForm(forms.Form):
    user = forms.ModelChoiceField(queryset=User.objects.all())
  #  def __str__(self):
   #  return User.name

