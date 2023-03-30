# Generated by Django 4.1.7 on 2023-03-30 12:11

from django.db import migrations, models

import core.services.uppload_profile_service


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_alter_profilemodel_age_alter_profilemodel_name_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='profilemodel',
            name='photo',
            field=models.ImageField(blank=True, upload_to=core.services.uppload_profile_service.upload_to),
        ),
    ]
