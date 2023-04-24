from django.contrib.auth import get_user_model
from django.db import models

UserModel = get_user_model()


class AutoParkModel(models.Model):
    class Meta:
        db_table = 'auto_parks'

    name = models.CharField(max_length=20)
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE, related_name='auto_parks')

    def __str__(self):
        return str(self.name)


class ChatModel(models.Model):
    class Meta:
        db_table = 'chat'

    message = models.CharField(max_length=255)
    owner = models.ForeignKey(UserModel, on_delete=models.CASCADE)
