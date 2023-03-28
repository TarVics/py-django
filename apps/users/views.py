from rest_framework import status
from rest_framework.response import Response
from rest_framework.generics import ListCreateAPIView
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly

from django.contrib.auth import get_user_model

from apps.users.serializers import UserSerializer
from apps.auto_parks.serializers import AutoParkSerializer

UserModel = get_user_model()


class UserListCreateView(ListCreateAPIView):
    serializer_class = UserSerializer
    queryset = UserModel.objects.all()
    permission_classes = (IsAuthenticatedOrReadOnly,)


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
