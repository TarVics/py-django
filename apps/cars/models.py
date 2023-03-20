from django.db import models

"""
#ДЗ 

Створити модель CarModel з такими полями:
- марка машини
- рік випуску
- кількість місць
- тип кузову
- об'єм двигуна (float)

реалізувати всі CRUD операції

***при виведені всіх машин показувати тільки (id, марку машини та рік)

"""


class CarModel(models.Model):
    class Meta:
        db_table = 'cars'

    car_model = models.CharField(max_length=20)
    product_year = models.IntegerField()
    place_count = models.IntegerField()
    body_type = models.CharField(max_length=20)
    engine_volume = models.FloatField()

    def __str__(self):
        return str(self.__dict__)
