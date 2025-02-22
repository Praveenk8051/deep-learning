# Deep Learning

This repository consists of all files related to Deep Learning and Machine Learning.

## Folder Structure and Code Access

### `basic_ml_algos`
This folder consists of different machine learning algorithms.

- **Autoencoder**: [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Autoencoder) for Autoencoder-based implementation.
- **Linear Regression**: [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Linear%20Regression) for Linear Regression-based implementation.
- **Logistic Regression**: [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Logistic%20Regression) for Logistic Regression-based implementation.
- **Multi-Layered Perceptron**: [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Multilayer%20Perceptron) for Multi-Layered Perceptron-based implementation.
- **Nearest Neighbour**: [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Nearest_Neighbor) for Nearest Neighbour-based implementation.

### `matched_filter_using_neural_nets`
This folder consists of Matched Filter implementation.

- **Concept**: It is a concept in signal processing to increase signal-to-noise ratio. This is implemented using MLP and RNN.
- **Code**: The code for the related project is found [here](https://github.com/Praveenk8051/deep-learning/tree/master/matched_filter_using_neural_nets).
- **Blog**: Detailed explanation can be found in the [blog](https://medium.com/@praveenkrishna/automating-the-matched-filter-using-neural-nets-73c753615845).

### `classification_scripts`
This folder contains the generic classification script as a notebook.

- **Script**: The code for the same can be found [here](https://github.com/Praveenk8051/deep-learning/blob/master/classification_scripts/pytorch_classification_generic.ipynb).
- **Features**:
  - Compute and plot means and standard deviation of all images.
  - Split dataset into train, test, and validation.
  - Option to fine-tune or perform transfer learning.
  - Option to load different architectures like ResNet, DenseNet, VGG, Inception, etc.
  - Perform training.
  - Visualize the confusion matrix.
  - Test.
  - View classification report.

### `object_detection_scripts`
This folder contains scripts for object detection to check various scenarios and load and train based on pretrained networks.

- **Centroid_Resolution.ipynb**: This notebook helps in finding the centroid of the bounding boxes in an image. It helps in analyzing and balancing the bounding boxes in the image. It also shows the code to plot resolutions of images if they are of different sizes and plot the number of images in the range. [Code](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/Centroid_Resolution.ipynb).
- **main_script_pytorch.ipynb**: The object detection code is written using PyTorch. PyTorch provides the torchvision library which has flexible APIs to create a great working model with high accuracy. [Code](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/main_script_pytorch.ipynb).
- **split_data.ipynb**: Split the images and XML files created for object detection. [Code](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/split_data.ipynb).
- **xml_to_pkl.ipynb**: Convert the XML files to pickle or CSV files. [Code](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/xml_to_pkl.ipynb).
- **pkl_tfrecords.ipynb**: Convert the pickle or CSV files to TensorFlow records. [Code](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/pkl_tfrecords.ipynb).

## Additional Information
- **Scripts**: The implementation scripts are written in Python.
- **Utilities**: Utility functions used across different scripts are included in the `utils.py` file.
- **Documentation**: This README file provides an overview of the repository structure and the purpose of each folder and script.

Feel free to explore the code and contribute to the repository!