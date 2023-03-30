from datetime import datetime

from django.core import validators as V
from django.db import models

from core.enums.regex_enum import RegEx
from core.services.uppload_car_service import upload_to

from apps.auto_parks.models import AutoParkModel


class CarModel(models.Model):
    class Meta:
        db_table = 'cars'

    brand = models.CharField(max_length=50, validators=[V.RegexValidator(RegEx.BRAND.regex, RegEx.BRAND.message)])
    year = models.IntegerField(validators=[V.MinValueValidator(1990), V.MaxValueValidator(datetime.now().year)])
    price = models.IntegerField(validators=[V.MinValueValidator(0), V.MaxValueValidator(1000000)])
    auto_park = models.ForeignKey(AutoParkModel, on_delete=models.CASCADE, related_name='cars')
    # photo = models.ImageField(upload_to='car_photo', blank=True)
    # photo = models.ImageField(upload_to=upload_to, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __repr__(self):
        return str(self.__dict__)


class CarPhotoModel(models.Model):
    class Meta:
        db_table = 'car_photos'

    photo = models.ImageField(upload_to=upload_to, blank=True)
    car = models.ForeignKey(CarModel, on_delete=models.CASCADE, related_name='photos')
