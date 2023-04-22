from django.urls import path

from rest_framework_simplejwt.views import TokenRefreshView

from apps.auth.views import (
    ActivateUserView,
    AuthMeView,
    AuthRegisterView,
    RecoveryPasswordRequestView,
    RecoveryPasswordView,
    SocketTokenView,
    TokenPairView,
)

urlpatterns = [
    path('', TokenPairView.as_view(), name='auth_login'),
    path('/me', AuthMeView.as_view(), name='auth_me'),
    path('/socket', SocketTokenView.as_view(), name='auth_get_soket_token'),
    path('/refresh', TokenRefreshView.as_view(), name='auth_refresh'),
    path('/register', AuthRegisterView.as_view(), name='auth_register'),
    path('/activate/<str:token>', ActivateUserView.as_view(), name='auth_activate_user'),

    path('/recovery_password', RecoveryPasswordRequestView.as_view(), name='auth_recovery_password_request'),
    path('/recovery_password/<str:token>', RecoveryPasswordView.as_view(), name='auth_recovery_password'),
]