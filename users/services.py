import json


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
