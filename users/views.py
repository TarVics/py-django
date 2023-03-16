from rest_framework.views import APIView
from rest_framework.response import Response
import json

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


class FileStorage:

    def __init__(self, file_name) -> None:
        print('**** init ****', __class__.__name__)
        self.__file_name: str = file_name
        self.__users: list[dict] = []
        self._read_users()
        next_id: int = max(self.__users, key=lambda user: user['id'])['id'] + 1 if self.__users else 1
        self.__id = self.__genid(next_id)

    @staticmethod
    def __genid(init: int = 1):
        current = init
        while True:
            yield current
            current += 1

    @property
    def users(self) -> list[dict]:
        return self.__users

    def _read_users(self) -> None:
        try:
            with open(self.__file_name) as file:
                self.__users = json.load(file)
        except (Exception,):
            self.__users = []

    def _write_users(self) -> None:
        try:
            with open(self.__file_name, 'w') as file:
                json.dump(self.__users, file)
        except Exception as ex:
            print(ex)

    def add_user(self, name: str, age: int) -> dict:
        user = {
            'id': next(self.__id),
            'name': name,
            'age': age,
        }

        self.__users.append(user)
        self._write_users()

        return user

    def get_user(self, id: int) -> dict | None:
        return next((u for u in self.__users if u['id'] == id), None)

    def set_user(self, id: int, name: str, age: int) -> dict | None:
        user = self.get_user(id)

        if user:
            user['name'] = name
            user['age'] = age
            self._write_users()

        return user

    def del_user(self, id: int) -> int:
        index = next((i for i, u in enumerate(self.__users) if u['id'] == id), -1)

        if index >= 0:
            del self.__users[index]
            self._write_users()

        return index


class UsersFileStorage:
    db = FileStorage('users.json')


class UserListCreateView(APIView, UsersFileStorage):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        print('**** init ****', __class__.__name__)

    def get(self, *args, **kwargs):
        return Response(self.db.users)

    def post(self, *args, **kwargs):
        data = self.request.data
        user = self.db.add_user(data['name'], data['age'])

        return Response(user)


class UserRetrieveUpdateDestroy(APIView, UsersFileStorage):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        print('**** init ****', __class__.__name__)

    def get(self, *args, **kwargs):
        pk = kwargs.get('pk')

        user = self.db.get_user(pk)

        if not user:
            return Response('Not found')

        return Response(user)

    def put(self, *args, **kwargs):
        data = self.request.data
        pk = kwargs.get('pk')

        user = self.db.set_user(pk, data['name'], data['age'])

        if not user:
            return Response('Not found')

        return Response(user)

    def delete(self, *args, **kwargs):
        pk = kwargs.get('pk')

        index = self.db.del_user(pk)

        if index < 0:
            return Response('Not found')

        return Response('deleted')
