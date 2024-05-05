# models.py

from tensorflow.keras.models import load_model


def load_deployed_model():
    # Load the pre-trained model
    loaded_model = load_model(r'E:\tumor_detection_project\savedModels\model.hdf5')  # Update with your correct file path

    # You can now use this loaded_model for making predictions
    return loaded_model

# Example usage
if __name__ == "__main__":
    deployed_model = load_deployed_model()

    # Now you can use 'deployed_model' for predictions
    # For example:
    # result = deployed_model.predict(your_input_data)
    # ...
