from rest_framework.views import APIView
from rest_framework.response import Response

from users.services import FileStorage

# class TestAPIView(APIView):
#     def get(self, *args, **kwargs):
#         params_dict = self.request.query_params.dict()
#         print(self.request.META.get('HTTP_ASD'))
#         print(params_dict)
#         return Response('hello from get')
#
#     def post(self, *args, **kwargs):
#         data = self.request.data
#         print(data)
#         return Response('hello from post')
#
#     def put(self, *args, **kwargs):
#         return Response('hello from put')
#
#     def patch(self, *args, **kwargs):
#         return Response('hello from patch')
#
#     def delete(self, *args, **kwargs):
#         return Response('hello from delete')
#
#
# class Test2View(APIView):
#     def get(self, *args, **kwargs):
#         print(kwargs)
#         return Response('ok')

users = [
    {"name": "Max", "age": 15},
    {"name": "Kira", "age": 20},
    {"name": "Karina", "age": 30},
    {"name": "Olha", "age": 12},
    {"name": "Nataly", "age": 25}
]

"""
#ДЗ

Інсталювати якщо в вас ще немає MySQL server & Postman

Реалізовуємо ось такі EndPoints:

GET http://localhost:8000/users           // витягнути всіх юзерів з файлу
POST http://localhost:8000/users          // записати нового юзера в файл (не забудьте про id, він має бути унікальним)

GET http://localhost:8000/users/<ID>      // витягти юзера по ID
PUT http://localhost:8000/users/<ID>      // змінити юзера по ID
DELETE  http://localhost:8000/users/<ID>  // видалити юзера по ID

список юзерів зберігаємо в файлі users.json
в кожного юзера повинна бути id`ка

"""


def throwable(func):
    def inner(*args, **kwargs):
        try:
            func(*args, **kwargs)
        except Exception as ex:
            print(ex)
            Response(str(ex))

    return inner


class UsersFileStorage:
    db = FileStorage('users.json')


class UserListCreateView(APIView, UsersFileStorage):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        print('**** init ****', __class__.__name__)

    @throwable
    def get(self, *args, **kwargs):
        return Response(self.db.users)

    @throwable
    def post(self, *args, **kwargs):
        data = self.request.data
        user = self.db.add_user(data['name'], data['age'])

        return Response(user)


class UserRetrieveUpdateDestroy(APIView, UsersFileStorage):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        print('**** init ****', __class__.__name__)

    @throwable
    def get(self, *args, **kwargs):
        pk = kwargs.get('pk')

        user = self.db.get_user(pk)

        if not user:
            return Response('Not found')

        return Response(user)

    @throwable
    def put(self, *args, **kwargs):
        data = self.request.data
        pk = kwargs.get('pk')

        user = self.db.set_user(pk, data['name'], data['age'])

        if not user:
            return Response('Not found')

        return Response(user)

    @throwable
    def delete(self, *args, **kwargs):
        pk = kwargs.get('pk')

        index = self.db.del_user(pk)

        if index < 0:
            return Response('Not found')

        return Response('deleted')
