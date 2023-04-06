from django_filters import rest_framework as filters

from apps.cars.models import AutoParkModel


class AutoParkFilter(filters.FilterSet):
    cars_year_lt = filters.NumberFilter(field_name='cars', lookup_expr='year__lt', distinct=True)

    class Meta:
        # model = AutoParkModel.objects.filter(cars__year__lt=) --> search lookup field
        model = AutoParkModel
        fields = ('cars_year_lt',)
