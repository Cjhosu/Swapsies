from django import forms
from django.forms import ModelForm
from .models import Book, Comic, Item_type , Item_status, Item_request, Request_message, User
from django.contrib.auth.forms import UserCreationForm

class BookFilterForm(forms.Form):
    def __int__(self, *args, request_data=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['filter'].initial = request_data.GET.get('filter','')

class IssueBookRequestForm(forms.ModelForm):
    class Meta:
        model = Item_request
        fields = '__all__'

class IssueComicRequestForm(forms.ModelForm):
    class Meta:
        model = Item_request
        fields = '__all__'

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

class UpdateBookForm(forms.ModelForm):
    item_id = forms.IntegerField
    title = forms.CharField(max_length=255)
    author_first = forms.CharField(max_length=100)
    author_last = forms.CharField(max_length=100)
    isbn = forms.CharField(max_length=15)
    publisher = forms.CharField(max_length=30)
    year = forms.CharField(max_length=4)
    description = forms.CharField(widget=forms.Textarea)
    class Meta:
        model = Book
        fields = '__all__'

class AddComicForm(forms.Form):
    item_id = forms.IntegerField
    item_name = forms.CharField(max_length=100)
    title = forms.CharField(max_length=255)
    publisher = forms.CharField(max_length=30)
    series = forms.CharField(max_length=50)
    number = forms.IntegerField(required=False, initial=None )
    year = forms.CharField(max_length=4)
    month = forms.CharField(max_length=10, required=False)
    description = forms.CharField(widget=forms.Textarea)

class UpdateComicForm(forms.ModelForm):
    item_id = forms.IntegerField
    title = forms.CharField(max_length=255)
    publisher = forms.CharField(max_length=30)
    series = forms.CharField(max_length=50)
    number = forms.IntegerField(required=False, initial=None )
    year = forms.CharField(max_length=4)
    month = forms.CharField(max_length=10, required=False)
    description = forms.CharField(widget=forms.Textarea)
    class Meta:
        model = Comic
        fields = '__all__'

class AddItemForm(forms.Form):
    item_type = forms.ModelChoiceField(queryset=Item_type.objects.all())

class UpdateBorrowerForm(forms.Form):
    user = forms.ChoiceField(choices = [ ])
    def __init__(self,uid, *args, **kwargs):
        super().__init__(*args, **kwargs)
        choices = [ ]
        for options in User.objects.filter(is_active='t').exclude(id=uid):
            choices.append((options.id , options.username))
        choices.append((-1, 'other'))
        self.fields['user'].choices = choices

class InactiveUserForm(forms.Form):
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)
    display_name = forms.CharField(max_length=30)
    class Meta:
        model = User
        fields= '__all__'
        default_data = {'is_superuser':'f', 'is_staff':'f', 'password': 'nothing_will_hash_to_this', 'is_active':'f', 'email':'nomail'}

class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)

        for fieldname in ['username', 'password1', 'password2']:
            self.fields[fieldname].help_text = None

class CustMesForm(forms.Form):
    message = forms.CharField(widget=forms.Textarea)
    class Meta:
        model = Request_message
        fields = '__all__'
