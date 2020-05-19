
# coding: utf-8
# Few points about Linear Regression:
>Linear approach to modelling the relationship between dependent variable and one or more independent variables. 
>The case of one independent variable is called Simple Linear Regression
>For more than one independent variable, the process is called Multiple Linear Regression
>Linear regression consists of finding the best-fitting straight line through the points. The best-fitting line is called a regression line.
Real Life Example: https://towardsdatascience.com/linear-regression-in-real-life-4a78d7159f16
# In[11]:


import tensorflow as tf
import numpy
import matplotlib.pyplot as plt
rng = numpy.random


# In[12]:


#matplotlib.pyplot

#is a collection of command style functions that make matplotlib work like MATLAB.
#Each pyplot function makes some change to a figure: 
#e.g., creates a figure, creates a plotting area in a figure, plots some lines in a plotting area


import matplotlib.pyplot as plt
plt.plot([1,2,3,4])
plt.ylabel('some numbers')
plt.show()


# In[13]:


# Parameters
learning_rate = 0.01
training_epochs = 1000
display_step = 50


# In[14]:


# Training Data
train_X = numpy.asarray([3.3,4.4,5.5,6.71,6.93,4.168,9.779,6.182,7.59,2.167,
                         7.042,10.791,5.313,7.997,5.654,9.27,3.1])

train_Y = numpy.asarray([1.7,2.76,2.09,3.19,1.694,1.573,3.366,2.596,2.53,1.221,
                         2.827,3.465,1.65,2.904,2.42,2.94,1.3])
n_samples = train_X.shape[0]

print(train_X)
print(train_Y)
print(n_samples)

# The shape property is usually used to get the current shape of an array


# In[18]:


# tf Graph Input
X = tf.placeholder("float")
Y = tf.placeholder("float")
print(X)
# Set model weights
W = tf.Variable(rng.randn(), name="weight")
b = tf.Variable(rng.randn(), name="bias")
print(W)
print(b)
print(rng.randn()) #Check!


# In[19]:


# Construct a linear model
pred = tf.add(tf.multiply(X, W), b)
print(pred)


# In[20]:


# Mean squared error
cost = tf.reduce_sum(tf.pow(pred-Y, 2))/(2*n_samples) # perform common math computations that reduce various dimensions of a tensor.
print(cost)
# Gradient descent
optimizer = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost)


# In[21]:


# Initializing the variables
init = tf.global_variables_initializer()


# In[23]:


# Launch the graph
with tf.Session() as sess:
    sess.run(init)

    # Fit all training data
    for epoch in range(training_epochs):
        for (x, y) in zip(train_X, train_Y):
            sess.run(optimizer, feed_dict={X: x, Y: y})

        #Display logs per epoch step
        if (epoch+1) % display_step == 0:
            c = sess.run(cost, feed_dict={X: train_X, Y:train_Y})
            print ("Epoch:", '%04d' % (epoch+1), "cost=", "{:.9f}".format(c),                 "W=", sess.run(W), "b=", sess.run(b))

    print ("Optimization Finished!")
    training_cost = sess.run(cost, feed_dict={X: train_X, Y: train_Y})
    print ("Training cost=", training_cost, "W=", sess.run(W), "b=", sess.run(b), '\n')

    #Graphic display
    plt.plot(train_X, train_Y, 'ro', label='Original data')
    plt.plot(train_X, sess.run(W) * train_X + sess.run(b), label='Fitted line')
    plt.legend()
    plt.show()

# Summarized Data
Import libraries
Generate random labels and inputs
Graph Input
Model Weights
Linear Model Construction
Cost Function
Gradient descent
Initialize all variables
Launch the graph
Loop over all Training data
	Display logs per epochs
	Graph display