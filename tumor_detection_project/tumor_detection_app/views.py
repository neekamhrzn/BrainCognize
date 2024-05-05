# # tumor_detection_app/views.py

# from django.shortcuts import render
# from rest_framework.response import Response
# from .forms import ImageUploadForm
# from .utils import predict_tumor, predict_tumor_mobile
# from rest_framework.decorators import api_view



# @api_view(['POST'])
# def detect_tumor_api(request):
#     body = request.data  
#     result = predict_tumor_mobile(body.get("image_url"))
#     return Response({"result":result[0], "tumor_probability": result[1]})



# def index(request):
#     if request.method == 'POST':
#         form = ImageUploadForm(request.POST, request.FILES)
#         if form.is_valid():
#             image = request.FILES['image']
#             result = predict_tumor(image)
#             return render(request, 'result.html', {'result': result})
#     else:
#         form = ImageUploadForm()

#     return render(request, 'index.html', {'form': form})

# tumor_detection_app/views.py

# from django.shortcuts import render
# from rest_framework.response import Response
# from .forms import ImageUploadForm
# from .utils import predict_tumor, predict_tumor_mobile
# from rest_framework.decorators import api_view

# @api_view(['POST'])
# def detect_tumor_api(request):
#     body = request.data  
#     predicted_class_label, tumor_probability = predict_tumor_mobile(body.get("image_url"))
#     return Response({"predicted_class_label": predicted_class_label, "tumor_probability": tumor_probability})

# def index(request):
#     predicted_class_label = None
#     tumor_probability = None

#     if request.method == 'POST':
#         form = ImageUploadForm(request.POST, request.FILES)
#         if form.is_valid():
#             image = request.FILES['image']
#             predicted_class_label, _ = predict_tumor(image)
#     else:
#         form = ImageUploadForm()

#     return render(request, 'index.html', {'form': form, 'predicted_class_label': predicted_class_label, 'tumor_probability': tumor_probability})

# from django.shortcuts import render
# from rest_framework.response import Response
# from .forms import ImageUploadForm
# from .utils import predict_tumor, predict_tumor_mobile
# from rest_framework.decorators import api_view

# @api_view(['POST'])
# def detect_tumor_api(request):
#     image_url = request.data.get("image_url")
#     predicted_class_label, tumor_probability = predict_tumor_mobile(image_url)
#     return Response({"predicted_class_label": predicted_class_label, "tumor_probability": tumor_probability})

# def index(request):
#     predicted_class_label = None
#     tumor_probability = None

#     if request.method == 'POST':
#         image_url = request.POST.get('image_url')
#         predicted_class_label, tumor_probability = predict_tumor_mobile(image_url)
#     else:
#         form = ImageUploadForm()

#     return render(request, 'result.html', {'predicted_class_label': predicted_class_label, 'tumor_probability': tumor_probability})


# tumor_detection_app/views.py

# from django.shortcuts import render
# from rest_framework.response import Response
# from .forms import ImageUploadForm
# from .utils import predict_tumor, predict_tumor_mobile
# from rest_framework.decorators import api_view

# @api_view(['POST'])
# def detect_tumor_api(request):
#     body = request.data  
#     predicted_class_label, tumor_probability = predict_tumor_mobile(body.get("image_url"))
#     return Response({"predicted_class_label": predicted_class_label, "tumor_probability": tumor_probability})

# def index(request):
#     predicted_class_label = None
#     tumor_probability = None

#     if request.method == 'POST':
#         form = ImageUploadForm(request.POST, request.FILES)
#         if form.is_valid():
#             image = request.FILES['image']
#             predicted_class_label, _ = predict_tumor(image)
#             return render(request, 'result.html', {'predicted_class_label': predicted_class_label})
#     else:
#         form = ImageUploadForm()

#     return render(request, 'index.html', {'form': form})





from django.shortcuts import render
from rest_framework.response import Response
from .forms import ImageUploadForm
from .utils import predict_tumor, predict_tumor_mobile
from rest_framework.decorators import api_view

@api_view(['POST'])
def detect_tumor_api(request):
    body = request.data  
    result = predict_tumor_mobile(body.get("image_url"))
    return Response({"result": result[0], "tumor_probability": result[1]})

def index(request):
    predicted_class_label = None
    tumor_probability = None

    if request.method == 'POST':
        form = ImageUploadForm(request.POST, request.FILES)
        if form.is_valid():
            image = request.FILES['image']
            result = predict_tumor(image)
            return render(request, 'result.html', {'result': result[0], 'tumor_probability': result[1]})
    else:
        form = ImageUploadForm()

    return render(request, 'index.html', {'form': form})







