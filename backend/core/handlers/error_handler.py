from rest_framework.response import Response
from rest_framework.views import exception_handler

from core.enums.error_enum import ErrorEnum
from core.exceptions import JWTException


def custom_error_exception(ex: Exception, context: dict) -> Response:
    handlers = {
        'JWTException': _jwt_validate_error
    }

    response = exception_handler(ex, context)

    ex_name = ex.__class__.__name__

    if ex_name in handlers:
        return handlers[ex_name](ex, context)

    return response


def _jwt_validate_error(ex: JWTException, context: dict) -> Response:
    return Response(ErrorEnum.JWT.message, ErrorEnum.JWT.code)