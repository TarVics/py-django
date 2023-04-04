import os

from django.core.mail import EmailMultiAlternatives
from django.template.loader import get_template

from core.services.gwt_service import ActivateToken, JWTService, RecoveryPasswordToken


class EmailService:
    @classmethod
    def __send_email(cls, to: str, template_name: str, context: dict, subject=''):
        template = get_template(template_name)
        html_content = template.render(context)
        msg = EmailMultiAlternatives(subject, from_email=os.environ.get('EMAIL_HOST_USER'), to=[to])
        msg.attach_alternative(html_content, 'text/html')
        msg.send()

    @classmethod
    def register_email(cls, user):
        token = JWTService.create_token(user, ActivateToken)
        url = f'http://localhost:3000/activate/{token}'
        cls.__send_email(user.email, 'register.html', {'name': user.profile.name, 'url': url}, 'Register')

    @classmethod
    def recovery_password(cls, user):
        token = JWTService.create_token(user, RecoveryPasswordToken)
        url = f'http://localhost:3000/forget/{token}'
        cls.__send_email(user.email, 'recovery_password.html', {'name': user.profile.name, 'url': url},
                         'Recovery password')
