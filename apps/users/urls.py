from django.urls import path

from .views import UserListCreateView, UserListCreateAutoParksView

urlpatterns = [
    path('', UserListCreateView.as_view(), name='user_list_create'),
    path('/auto_parks', UserListCreateAutoParksView.as_view(), name='user_auto_parks_list_create')
]
