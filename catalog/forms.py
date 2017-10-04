from django import forms
from django.forms import ModelForm
from .models import Item_type , Item_status, User
from django.contrib.auth.forms import UserCreationForm

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

class AddComicForm(forms.Form):
    item_id = forms.IntegerField
    item_name = forms.CharField(max_length=100)
    title = forms.CharField(max_length=255)
    publisher = forms.CharField(max_length=30)
    series = forms.CharField(max_length=50)
    number = forms.CharField(max_length=4)
    year = forms.CharField(max_length=4)
    month = forms.CharField(max_length=10)
    description = forms.CharField(widget=forms.Textarea)

class AddItemForm(forms.Form):
    item_type = forms.ModelChoiceField(queryset=Item_type.objects.all())

class UpdateBorrowerForm(forms.Form):
    user = forms.ModelChoiceField(queryset=User.objects.all())
  #  def __str__(self):
   #  return User.name


class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)

        for fieldname in ['username', 'password1', 'password2']:
            self.fields[fieldname].help_text = None
