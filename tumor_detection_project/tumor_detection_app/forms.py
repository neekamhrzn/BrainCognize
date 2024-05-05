# tumor_detection_app/forms.py

from django import forms

class ImageUploadForm(forms.Form):
    image = forms.ImageField()


class ImageUrlForm(forms.Form):
    image_url = forms.URLField(label='Image URL', required=True)



