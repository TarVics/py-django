from django.urls import path

from .views import AutoParkListCreateCarsView, AutoParkListCreateView

urlpatterns = [
    path('', AutoParkListCreateView.as_view(), name='auto_park_list_create'),
    path('/<int:pk>/cars', AutoParkListCreateCarsView.as_view(), name='auto_park_cars_list_create')
]