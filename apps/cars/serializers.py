from rest_framework import serializers

from apps.cars.models import CarModel


class CarSerializer(serializers.ModelSerializer):
    class Meta:
        model = CarModel
        fields = '__all__'
        # fields = ('id', 'car_model', 'product_year', 'place_count', 'body_type', 'engine_volume')


class CarSerializerForList(serializers.ModelSerializer):
    class Meta:
        model = CarModel
        # fields = '__all__'
        # fields = ('id', 'car_model', 'product_year', 'place_count', 'body_type', 'engine_volume')
        fields = ('id', 'car_model', 'product_year')
