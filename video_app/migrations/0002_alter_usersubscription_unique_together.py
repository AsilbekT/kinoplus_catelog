# Generated by Django 4.2.4 on 2024-03-30 13:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('video_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='usersubscription',
            unique_together={('username', 'subscription_plan_name')},
        ),
    ]
