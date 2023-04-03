from typing import Type

from django.contrib.auth import get_user_model

from rest_framework.generics import get_object_or_404

from rest_framework_simplejwt.tokens import BlacklistMixin, Token

from core.enums.action_token_enum import ActionEnum
from core.exceptions import JWTException

from apps.users.models import UserModel as User

UserModel: User = get_user_model()


ActivateTokenClassType = Type[BlacklistMixin | Token]


class ActionToken(BlacklistMixin, Token):
    pass


class ActivateToken(ActionToken):
    token_type = ActionEnum.ACTIVATE.token_type
    lifetime = ActionEnum.ACTIVATE.exp_time


class JWTService:

    @staticmethod
    def create_token(user, token_class: ActivateTokenClassType):
        return token_class.for_user(user)

    @staticmethod
    def validate_token(token, token_class: ActivateTokenClassType):
        try:
            token_res = token_class(token)
            token_res.check_blacklist()
        except (Exception,):
            raise JWTException

        token_res.blacklist()
        user_id = token_res.payload.get('user_id')

        return get_object_or_404(UserModel, pk=user_id)
        