from django.urls import path
from .views import CollegeAPIView, DetailCollegeView

urlpatterns = [
    path('', CollegeAPIView.as_view()),
    path('<int:pk>/', DetailCollegeView.as_view()),
]
