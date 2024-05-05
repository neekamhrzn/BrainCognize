# tumor_detection_project/urls.py

from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('tumor_detection_app.urls')),
    path('get', include('tumor_detection_app.urls')),
    path('api/predict-tumor',include('tumor_detection_app.urls')),
]
