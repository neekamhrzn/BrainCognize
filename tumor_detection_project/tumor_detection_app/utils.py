# from tensorflow.keras.models import load_model
# import numpy as np
# import requests
# from django.core.files.uploadedfile import InMemoryUploadedFile
# from io import BytesIO
# from PIL import Image


# # tumor_detection_app/utils.py
# from tensorflow.keras.models import load_model
# import numpy as np

# from django.core.files.uploadedfile import InMemoryUploadedFile
# from io import BytesIO
# from PIL import Image

# def preprocess_input_image(image_path):
#     # Load the image using PIL
#     print(image_path)
#     response = requests.get(image_path)
#     image_data = BytesIO(response.content)
#     img = Image.open(image_data)

#     # Resize the image to the desired input shape
#     img = img.resize((128, 128))

#     # Convert the image to a numpy array
#     img_array = np.array(img)

#     # Ensure the image has 3 channels (RGB)
#     if len(img_array.shape) == 2:
#         img_array = np.stack([img_array] * 3, axis=-1)
#     if img_array.shape[-1] == 4:
#         img_array = img_array[:, :, :3]

#     # Normalize the pixel values to be in the range [0, 1]
#     img_array = img_array / 255.0

#     # Expand dimensions to create a batch of size 1
#     img_array = np.expand_dims(img_array, axis=0)

#     return img_array

# # ... (rest of the code remains unchanged)


# def predict_tumor(image_path, model_filepath=r'E:\tumor_detection_project\tumor_detection_project\savedModels\model.hdf5'):
#     # Load your trained model here
#     model = load_model(filepath=model_filepath)
#     # image_path1 = "https://upload.wikimedia.org/wikipedia/commons/5/5f/Hirnmetastase_MRT-T1_KM.jpg";
#     image_path1 = "https://imgs.search.brave.com/K2IW5fpNqzXljnOG8LklASFNZRLwai4nDHkawEdhJRM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTA4/NjQ5NDE3Mi9waG90/by9icmFpbi14LXJh/eS1pbWFnZXMuanBn/P3M9NjEyeDYxMiZ3/PWlzJms9MjAmYz1G/NUg2ZlNObUNrbHhp/SXpNSE5OSjlpWElU/SjNCeDBaTmlYMEJF/SzVKZnJ3PQ";
#     # Preprocess the input image
#     input_image = preprocess_input_image(image_path1)
#     # Make predictions
#     predictions = model.predict(input_image)
#     # Assuming your model outputs probabilities for binary classification
#     tumor_probability = predictions[0][0]
#     # You can use the probability to make decisions or further processing
#     if tumor_probability > 0.5:
#         result = "Tumor detected"
#     else:
#         result = "No tumor detected"
#     return result, tumor_probability



# def predict_tumor_mobile(image_url, model_filepath=r'E:\tumor_detection_project\tumor_detection_project\savedModels\model.h5'):
#     print(f"The inputted image link is + {image_url}")
#     # Load your trained model here
#     model = load_model(filepath=model_filepath)

#     # Preprocess the input image
#     input_image = preprocess_input_image(image_url)

#     # Make predictions
#     predictions = model.predict(input_image)

#     # Assuming your model outputs probabilities for binary classification
#     tumor_probability = predictions[0][0]

#     # You can use the probability to make decisions or further processing
#     if tumor_probability > 0.5:
#         result = "Tumor detected"
#     else:
#         result = "No tumor detected"

#     return result, tumor_probability



import numpy as np
import requests
from django.core.files.uploadedfile import InMemoryUploadedFile
from io import BytesIO
from PIL import Image
from tensorflow.keras.models import load_model

def preprocess_input_image_path(image_path):

    img = Image.open(image_path)
    img = img.resize((150, 150))  # Resize the image to (150, 150)
    img_array = np.array(img)
    if len(img_array.shape) == 2:
        img_array = np.stack([img_array] * 3, axis=-1)
    if img_array.shape[-1] == 4:
        img_array = img_array[:, :, :3]
    img_array = img_array / 255.0
    img_array = np.expand_dims(img_array, axis=0)
    return img_array

def preprocess_input_image_url(image_path):
    response = requests.get(image_path)
    image_data = BytesIO(response.content)
    img = Image.open(image_data)
    img = img.resize((150, 150))  # Resize the image to (150, 150)
    img_array = np.array(img)
    if len(img_array.shape) == 2:
        img_array = np.stack([img_array] * 3, axis=-1)
    if img_array.shape[-1] == 4:
        img_array = img_array[:, :, :3]
    img_array = img_array / 255.0
    img_array = np.expand_dims(img_array, axis=0)
    return img_array


def predict_tumor(image_path, model_filepath=r'E:\tumor_detection_project\savedModels\model.hdf5'):
    model = load_model(filepath=model_filepath)
    input_image = preprocess_input_image_path(image_path)
    predictions = model.predict(input_image)
    predicted_class_index = np.argmax(predictions)
    class_labels = {0: 'Pituitary Tumor', 1: 'No Tumor', 2: 'Meningioma Tumor', 3: 'Glioma Tumor'}
    predicted_class_label = class_labels[predicted_class_index]
    return predicted_class_label, predictions[0][predicted_class_index]

def predict_tumor_mobile(image_url, model_filepath=r'E:\tumor_detection_project\savedModels\model.hdf5'):
    print(f"The inputted image link is + {image_url}")
    model = load_model(filepath=model_filepath)
    input_image = preprocess_input_image_url(image_url)
    predictions = model.predict(input_image)
    predicted_class_index = np.argmax(predictions)
    
    class_labels = {0: 'Pituitary Tumor', 1: 'No Tumor', 2: 'Meningioma Tumor', 3: 'Glioma Tumor'}
    predicted_class_label = class_labels[predicted_class_index]
    return predicted_class_label, predictions[0][predicted_class_index]


