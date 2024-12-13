from django.urls import path
from . import views
from rest_framework.authtoken.views import obtain_auth_token
from rest_framework_simplejwt.views import (TokenObtainPairView, TokenRefreshView, TokenVerifyView)

urlpatterns = [
    path('', views.AddressList.as_view()),
    path('<int:pk>/', views.AddressDetail.as_view()),
    path('<int:user_id>/add', views.CreateUserAddress.as_view()),
    path('<int:pk>/update', views.UpdateAddress.as_view()),
    path('<int:pk>/delete', views.DeleteAddress.as_view()),
    path('getToken', obtain_auth_token),

    # Simple JWT Authentication
    path("login/simpleJWT", TokenObtainPairView.as_view()),
    path("login/simpleJWT/refresh", TokenRefreshView.as_view()),
    path("login/simpleJWT/verify", TokenVerifyView.as_view()),
]



# {
#     "refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczNTI3NjAxMSwiaWF0IjoxNzM0MDY2NDExLCJqdGkiOiI4MTMxMTQwMjg1NzQ0YTViYThkMDgwYzRiNGExYmFjOSIsInVzZXJfaWQiOjF9.n16DsLE4L3i3CA5boPFquSFfae9p1NxTsn5YJ2x75Jg",
#     "access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM0MDcwMDExLCJpYXQiOjE3MzQwNjY0MTEsImp0aSI6IjY0Yjg4YjQ1Nzg2OTRhZmVhZGI0NzRjZTdkOGU0Y2EzIiwidXNlcl9pZCI6MX0.EHbQb1kfcDGrGF2481cCVPotw-L6SQc4nA9iw4pKXIs"
# }