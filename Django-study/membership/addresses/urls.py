from django.urls import path
from . import views

urlpatterns = [
    path('', views.AddressList.as_view()),
    path('<int:pk>/', views.AddressDetail.as_view()),
    path('<int:user_id>/add', views.CreateUserAddress.as_view()),
    path('<int:pk>/update', views.UpdateAddress.as_view()),
    path('<int:pk>/delete', views.DeleteAddress.as_view())
]