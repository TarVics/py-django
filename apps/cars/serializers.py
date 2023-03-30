from rest_framework.serializers import ModelSerializer, RelatedField, StringRelatedField, ValidationError

from core.dataclasses.auto_park_dataclass import AutoPark

from .models import CarModel, CarPhotoModel


class AutoParkRelatedFieldSerializer(RelatedField):

    def to_internal_value(self, data):
        pass

    def to_representation(self, value: AutoPark):
        return {'id': value.id, 'name': value.name}


class CarPhotoSerializer(ModelSerializer):
    class Meta:
        model = CarPhotoModel
        fields = ('id', 'photo')

    def to_representation(self, instance):
        return instance.photo.url


class CarSerializer(ModelSerializer):
    # auto_park = StringRelatedField()
    auto_park = AutoParkRelatedFieldSerializer(read_only=True)
    photos = CarPhotoSerializer(many=True, read_only=True)

    class Meta:
        model = CarModel
        # fields = '__all__'
        fields = ('id', 'brand', 'year', 'price', 'photos', 'auto_park')
        # depth = 1

    # def validate(self, attrs):
    #     if attrs['year'] == attrs['price']:
    #         raise ValidationError({'details': 'year==price'})
    #     return attrs
    #
    # def validate_year(self, value):
    #     if value == 2001:
    #         raise ValidationError('year==2001')
    #     return value
