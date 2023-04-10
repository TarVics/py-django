from django_filters import rest_framework as filters

from apps.cars.models import CarModel


class CarFilter(filters.FilterSet):
    year_gt = filters.NumberFilter(field_name='year', lookup_expr='gt')
    year_lt = filters.NumberFilter(field_name='year', lookup_expr='lt')

    brand_start = filters.CharFilter(field_name='brand', lookup_expr='istartswith')
    brand_end = filters.CharFilter(field_name='brand', lookup_expr='iendswith')
    brand_contains = filters.CharFilter(field_name='brand', lookup_expr='icontains')

    price_lt = filters.NumberFilter(field_name='price', lookup_expr='lt')
    price_gt = filters.NumberFilter(field_name='price', lookup_expr='gt')
    price_gte = filters.NumberFilter(field_name='price', lookup_expr='gte')

    class Meta:
        # model = CarModel.objects.filter(brand__=) --> search lookup field
        model = CarModel
        fields = ('year_gt', 'year_lt',
                  'brand_start', 'brand_end', 'brand_contains',
                  'price_lt', 'price_gt', 'price_gte',)
