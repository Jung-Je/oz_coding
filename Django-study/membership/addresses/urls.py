from django.urls import path
from . import views
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('', views.AddressList.as_view()),
    path('<int:pk>/', views.AddressDetail.as_view()),
    path('<int:user_id>/add', views.CreateUserAddress.as_view()),
    path('<int:pk>/update', views.UpdateAddress.as_view()),
    path('<int:pk>/delete', views.DeleteAddress.as_view()),
    path('getToken', obtain_auth_token)
]