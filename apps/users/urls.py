from django.urls import path

from .views import (
    AdminToUserView,
    TestSendEmailView,
    UserBlockView,
    UserListCreateAutoParksView,
    UserListCreateView,
    UserProfileUpdateView,
    UserToAdminView,
    UserUnblockView,
)

urlpatterns = [
    path('', UserListCreateView.as_view(), name='user_list_create'),
    path('/test', TestSendEmailView.as_view(), name='test_send_email'),
    
    path('/auto_parks', UserListCreateAutoParksView.as_view(), name='user_auto_parks_list_create'),
    path('/profile', UserProfileUpdateView.as_view(), name='users_profile_update'),
    path('/<int:pk>/to_admin', UserToAdminView.as_view(), name='users_to_admin'),
    path('/<int:pk>/to_user', AdminToUserView.as_view(), name='users_to_user'),

    path('/<int:pk>/block', UserBlockView.as_view(), name='users_block'),
    path('/<int:pk>/unblock', UserUnblockView.as_view(), name='users_unblock'),
]
