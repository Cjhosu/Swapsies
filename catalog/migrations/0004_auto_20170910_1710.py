# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-10 21:10
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0003_auto_20170909_0909'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='description',
            field=models.TextField(blank=True, default=None, null=True),
        ),
    ]