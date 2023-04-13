from django.contrib.auth import get_user_model

from rest_framework import status
from rest_framework.generics import GenericAPIView, ListCreateAPIView, UpdateAPIView
from rest_framework.permissions import IsAdminUser, IsAuthenticated
from rest_framework.response import Response

from drf_yasg.utils import swagger_auto_schema

from core.permissions.block_unblock import BlockUnblockUserPermission
from core.permissions.is_superuser import IsSuperuser

from apps.auto_parks.serializers import AutoParkSerializer
from apps.users.models import ProfileModel
from apps.users.models import UserModel as User
from apps.users.serializers import ProfileSerializer, UserSerializer

from ..auth.swagger.serializers import SwaggerUserSerializer
from .serializers import ProfileSerializer, UserSerializer

# from core.services.email_service import EmailService


"""
from django.contrib.auth import get_user_model
from apps.users.models import UserModel as User
UserModel: User = get_user_model()
"""
UserModel: User = get_user_model()


class UserToAdminView(GenericAPIView):
    permission_classes = (IsSuperuser,)

    def get_queryset(self):
        return UserModel.objects.exclude(pk=self.request.user.pk)

    def patch(self, *args, **kwargs):
        user = self.get_object()

        if user.is_staff:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        user.is_staff = True
        user.save()
        serializer = UserSerializer(user)
        return Response(serializer.data, status.HTTP_200_OK)


class AdminToUserView(GenericAPIView):
    permission_classes = (IsSuperuser,)

    def get_queryset(self):
        return UserModel.objects.exclude(pk=self.request.user.pk)

    def patch(self, *args, **kwargs):
        user = self.get_object()

        if not user.is_staff or user.is_superuser:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        user.is_staff = False
        user.save()
        serializer = UserSerializer(user)
        return Response(serializer.data, status.HTTP_200_OK)


class UserListCreateView(ListCreateAPIView):
    serializer_class = UserSerializer
    permission_classes = (IsAdminUser,)

    def get_queryset(self):
        return UserModel.objects.exclude(pk=self.request.user.id)


class UserListCreateAutoParksView(ListCreateAPIView):
    serializer_class = AutoParkSerializer
    queryset = UserModel.objects.all()
    permission_classes = (IsAuthenticated,)

    def get(self, request, *args, **kwargs):
        print(self.request.user.is_active)
        user = self.request.user
        serializer = self.serializer_class(user.auto_parks, many=True)
        return Response(serializer.data, status.HTTP_200_OK)

    def perform_create(self, serializer):
        user = self.request.user
        serializer.save(user=user)


class UserProfileUpdateView(UpdateAPIView):
    serializer_class = ProfileSerializer
    queryset = ProfileModel.objects.all()

    def get_object(self):
        return self.request.user.profile


class UserBlockView(GenericAPIView):
    # permission_classes = (IsAdminUser,)
    permission_classes = (BlockUnblockUserPermission,)

    def get_queryset(self):
        return UserModel.objects.exclude(pk=self.request.user.pk)

    def patch(self, *args, **kwargs):
        user = self.get_object()

        # if not self.request.user.is_staff or user.is_staff and not self.request.user.is_superuser:
        #     return Response('Permission denied', status.HTTP_403_FORBIDDEN)

        if not user.is_active:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        user.is_active = False
        user.save()
        serializer = UserSerializer(user)
        return Response(serializer.data, status.HTTP_200_OK)


class UserUnblockView(GenericAPIView):
    """
    UnBlockUserById
    """

    # permission_classes = (IsAdminUser,)
    permission_classes = (BlockUnblockUserPermission,)

    def get_serializer(self, *args, **kwargs):
        pass

    def get_queryset(self):
        return UserModel.objects.exclude(pk=self.request.user.pk)

    @swagger_auto_schema(responses={status.HTTP_200_OK: SwaggerUserSerializer()})
    def patch(self, *args, **kwargs):
        user = self.get_object()

        # if not self.request.user.is_staff or user.is_staff and not self.request.user.is_superuser:
        #     return Response('Permission denied', status.HTTP_403_FORBIDDEN)

        if user.is_active:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        user.is_active = True
        user.save()
        serializer = UserSerializer(user)
        return Response(serializer.data, status.HTTP_200_OK)


# class TestSendEmailView(GenericAPIView):
#
#     def get(self, *args, **kwargs):
#         EmailService.send_email({'user': 'Max'})
#         return Response(status=status.HTTP_200_OK)
