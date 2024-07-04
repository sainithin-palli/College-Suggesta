from rest_framework import generics

from colleges.models import College
from .serializers import CollegeSerializer


class CollegeAPIView(generics.ListAPIView):
    queryset = College.objects.all()
    serializer_class = CollegeSerializer


class DetailCollegeView(generics.RetrieveAPIView):
    queryset = College.objects.all()
    serializer_class = CollegeSerializer


class PostList(generics.ListCreateAPIView):
    queryset = College.objects.all()
    serializer_class = CollegeSerializer


class CollegeDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = College.objects.all()
    serializer_class = CollegeSerializer

