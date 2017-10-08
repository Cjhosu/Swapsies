from django.contrib import admin

# Register your models here.
from .models import Book, Item, Item_request, Comic, Item_type, Item_status

admin.site.register(Book)
admin.site.register(Item)
admin.site.register(Comic)
admin.site.register(Item_type)
admin.site.register(Item_request)
class Item_statusAdmin(admin.ModelAdmin):
    list_display = ('itemname', 'borrower', 'due_back', 'id')
    list_filter = ('borrower', 'due_back')
    fieldset = (
        (None, {
            'fields': ('borrower', 'due_back')
        })
    )
admin.site.register(Item_status, Item_statusAdmin)
