from rest_framework import status
from rest_framework.generics import DestroyAPIView, GenericAPIView, ListAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.response import Response

from .models import CarModel, CarPhotoModel
from .serializers import CarPhotoSerializer, CarSerializer


class CarListCreateView(ListAPIView):
    serializer_class = CarSerializer

    def get_queryset(self):
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
