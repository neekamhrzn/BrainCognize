# # tumor_detection_app/urls.py

# from django.urls import path
# from . import views

# urlpatterns = [
#     path('', views.index, name='index'),
#     path('api/predict-tumor',  views.detect_tumor_api)
# ]

# tumor_detection_app/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('api/predict-tumor',  views.detect_tumor_api)
]