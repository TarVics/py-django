from django.db.models import QuerySet

# from apps.cars.models import CarModel


class CarManager(QuerySet):
    def get_cars_by_auto_park_id(self, id):
        # CarModel.objects.filter(auto_park_id=id)
        return self.filter(auto_park_id=id)
