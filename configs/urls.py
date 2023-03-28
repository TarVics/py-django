from django.urls import path, include

urlpatterns = [
    path('cars', include('apps.cars.urls')),
    path('auto_parks', include('apps.auto_parks.urls')),
    path('auth', include('apps.auth.urls')),
    path('users', include('apps.users.urls')),
]
