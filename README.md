# deep-learning

This repository consists of all files related to Deep-Learning and Machine Learning.

Please find the folders present and direct access to code.

```basic_ml_algos```: This folder consists of different machine learning algorithms. 

  * `Autoencoder` : [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Autoencoder) to Autoencoder based implementation.
  * `Linear Regression` : [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Linear%20Regression) to Linear Regression based implementation.
  * `Logistic Regression` : [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Logistic%20Regression) to Logistic Regression based implementation.
  * `Multi-Layered Perceptron` : [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Multilayer%20Perceptron) to Multi-Layered Perceptron based implementation.
  * `Nearest Neighbour` : [Code](https://github.com/Praveenk8051/deep-learning/tree/master/basic_ml_algos/Nearest_Neighbor) to Nearest Neighbour based implementation.
  
  
  ```matched_filter_using_neural_nets```: This folder consists of Matched Filter implementation. 
  
  It is a concept in signal processing to increase signal to noise ratio. This is implemented using MLP and RNN.
  the code for the related project is found [here](https://github.com/Praveenk8051/deep-learning/tree/master/matched_filter_using_neural_nets). 
  
  Blog can be found [here](https://medium.com/@praveenkrishna/automating-the-matched-filter-using-neural-nets-73c753615845)

```classification_scripts``` : the generic classification script as a notebook. The code for the same can be found [here](https://github.com/Praveenk8051/deep-learning/blob/master/classification_scripts/pytorch_classification_generic.ipynb)
* The script has below following aspects.

> compute and plot means and std deviation of all images

> split dataset in train, test and validation

> option to fine-tune or perform transfer learning

> option to load different architectures like resnet, densenet, vgg, inception..,

> perform training

> visualize the confusion matrix 

> test

> view classification report



```Object_detection_scripts```: The object detection script to check various scenarios and load and train based on pretrained network

* `Centroid_Resolution.ipynb` : This notebook helps in finding the centroid of the bounding boxes in an image. This helps in analysing and balancing the bboxes in the image. It also shows the code to plot resolutions of images if there are of different sizes. And plot number of images in the range. The code for the same can be found [here](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/Centroid_Resolution.ipynb)


* `main_script_pytorch.ipynb` : The Object detection based code is written using PyTorch. The Pytorch provides torchvision library which has flexible apis to create great working model with high accuracy. Find the explanation and compact code [here](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/main_script_pytorch.ipynb)


* `split_data.ipynb`: split the images and xml files created for the object detection. The code for the same can be found [here](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/split_data.ipynb)


* `xml_to_pkl.ipynb`: Convert the xml files to pickle or csv files. The code for the same can be found [here](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/xml_to_pkl.ipynb)


* `pkl_tfrecords.ipynb`: Convert the pickle or csv files to tensorflow records. The code for the same can be found [here](https://github.com/Praveenk8051/deep-learning/blob/master/object_detection_scripts/pkl_tfrecords.ipynb)
