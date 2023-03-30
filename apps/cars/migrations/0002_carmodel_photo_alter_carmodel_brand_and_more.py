# Generated by Django 4.1.7 on 2023-03-30 10:29

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cars', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='carmodel',
            name='photo',
            field=models.ImageField(blank=True, upload_to='car_photo'),
        ),
        migrations.AlterField(
            model_name='carmodel',
            name='brand',
            field=models.CharField(max_length=50, validators=[django.core.validators.RegexValidator('^[a-zA-Z]{2,50}$', 'min2 max 50')]),
        ),
        migrations.AlterField(
            model_name='carmodel',
            name='price',
            field=models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1000000)]),
        ),
        migrations.AlterField(
            model_name='carmodel',
            name='year',
            field=models.IntegerField(validators=[django.core.validators.MinValueValidator(1990), django.core.validators.MaxValueValidator(2023)]),
        ),
    ]
