from django.urls import path
from .views import CollegeListAPIView,student_input, all_colleges,CollegeListAPIDataView


urlpatterns = [
    path('api/', CollegeListAPIView, name='api-home'),
    # path('apidata/<slug:rank>/<slug:region>/<slug:sc>/<slug:placement>/', CollegeListAPIDataView, name='api-data-home'),
    path('apidata/<slug:rank>/<slug:region>/<slug:caste>/<slug:gender>/<slug:branch>/<slug:order_fields>/', CollegeListAPIDataView, name='api-data-home'),
    # path('apidata/<slug:rank>/<slug:region>/<slug:sc>/<slug:placement>/', CollegeListAPIDataView, name='api-data-home'),
    # path('apidata/<slug:rank>/<slug:region>/<slug:sc>/<slug:placement>/', CollegeListAPIDataView, name='api-data-home'),
    # path('apidata/<slug:rank>/<slug:region>/<slug:sc>/<slug:placement>/', CollegeListAPIDataView, name='api-data-home'),
    # path('apidata/<slug:rank>/<slug:region>/<slug:sc>/<slug:placement>/', CollegeListAPIDataView, name='api-data-home'),
    # path('apidata/<slug:rank>/<slug:region>/<slug:sc>/<slug:placement>/', CollegeListAPIDataView, name='api-data-home'),
    path('all-colleges/', all_colleges, name='all-colleges'),
    path('', student_input, name='home'),
]
