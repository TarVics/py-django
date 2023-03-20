from django.forms import model_to_dict

from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

from .models import UserModel
from .serializers import UserSerializer


# class UserListCreateView(APIView):
#     def get(self, *args, **kwargs):
#         users = UserModel.objects.all()
#         users = [model_to_dict(user) for user in users]
#         return Response(users)
#
#     def post(self, *args, **kwargs):
#         data = self.request.data
#
#         # model = UserModel(name=data['name'], age=data['age'])
#         # user = UserModel(**data)
#         # user.save()
#         user = UserModel.objects.create(**data)
#         return Response(model_to_dict(user))
#
#
# class UserRetrieveUpdateDestroyView(APIView):
#     def get(self, *args, **kwargs):
#         pk = kwargs.get('pk')
#
#         try:
#             user = UserModel.objects.get(pk=pk)
#         except UserModel.DoesNotExist:
#             return Response('Not Found')
#
#         return Response(model_to_dict(user))
#
#     def put(self, *args, **kwargs):
#         pk = kwargs.get('pk')
#         data: dict = self.request.data
#
#         try:
#             user = UserModel.objects.get(pk=pk)
#         except UserModel.DoesNotExist:
#             return Response('Not Found')
#
#         for k, v in data.items():
#             setattr(user, k, v)
#
#         user.save()
#         return Response(model_to_dict(user))
#
#     def delete(self, *args, **kwargs):
#         pk = kwargs.get('pk')
#
#         try:
#             user = UserModel.objects.get(pk=pk)
#         except UserModel.DoesNotExist:
#             return Response('Not Found')
#
#         user.delete()
#         return Response('deleted')

class UserListCreateView(APIView):
    def get(self, *args, **kwargs):
        users = UserModel.objects.all()
        serializer = UserSerializer(instance=users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, *args, **kwargs):
        data = self.request.data
        serializer = UserSerializer(data=data)

        # if not serializer.is_valid():
        #     return Response(serializer.errors)
        serializer.is_valid(raise_exception=True)

        serializer.save()
        return Response(serializer.data, status.HTTP_201_CREATED)


class UserRetrieveUpdateDestroyView(APIView):
    def get(self, *args, **kwargs):
        pk = kwargs.get('pk')

        try:
            user = UserModel.objects.get(pk=pk)
        except UserModel.DoesNotExist:
            return Response('Not Found', status.HTTP_404_NOT_FOUND)

        serializer = UserSerializer(user)
        return Response(serializer.data, status.HTTP_200_OK)

    def put(self, *args, **kwargs):
        pk = kwargs.get('pk')
        data = self.request.data

        try:
            user = UserModel.objects.get(pk=pk)
        except UserModel.DoesNotExist:
            return Response('Not Found', status.HTTP_404_NOT_FOUND)
        serializer = UserSerializer(user, data)

        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_200_OK)

    def patch(self, *args, **kwargs):
        pk = kwargs.get('pk')
        data = self.request.data

        try:
            user = UserModel.objects.get(pk=pk)
        except UserModel.DoesNotExist:
            return Response('Not Found', status.HTTP_404_NOT_FOUND)
        serializer = UserSerializer(user, data, partial=True)

        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status.HTTP_200_OK)

    def delete(self, *args, **kwargs):
        pk = kwargs.get('pk')

        try:
            user = UserModel.objects.get(pk=pk)
        except UserModel.DoesNotExist:
            return Response('Not Found', status.HTTP_404_NOT_FOUND)

        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
