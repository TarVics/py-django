from rest_framework import status
from rest_framework.generics import DestroyAPIView, GenericAPIView, ListAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import AllowAny
# from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

from .filters import CarFilter
from .models import CarModel, CarPhotoModel
from .serializers import CarPhotoSerializer, CarSerializer


class CarListCreateView(ListAPIView):
    permission_classes = (AllowAny, )

    serializer_class = CarSerializer
    # pagination_class = PageNumberPagination
    filterset_class = CarFilter

    def get_queryset(self):
        # qs = CarModel.objects.get_cars_by_auto_park_id(3)
        qs = CarModel.objects.all()
        params_dict = self.request.query_params.dict()

        if 'year' in params_dict:
            qs = qs.filter(year__gte=params_dict['year'])

        return qs


class CarRetrieveUpdateDestroyView(RetrieveUpdateDestroyAPIView):
    queryset = CarModel.objects.all()
    serializer_class = CarSerializer


class CarAddPhotosView(GenericAPIView):
    queryset = CarModel.objects.all()
    serializer_class = CarPhotoSerializer

    def post(self, *args, **kwargs):
        car = self.get_object()
        files = self.request.FILES
        for key in files:
            serializer = CarPhotoSerializer(data={'photo': files[key]})
            serializer.is_valid(raise_exception=True)
            serializer.save(car=car)

        serializer = CarSerializer(car)
        return Response(serializer.data, status.HTTP_201_CREATED)


class CarPhotoDeleteView(DestroyAPIView):
    queryset = CarPhotoModel.objects.all()

    def perform_destroy(self, instance):
        instance.photo.delete()
        # instance.delete()
        super().perform_destroy(instance)
