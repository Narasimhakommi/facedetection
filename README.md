# CCN_PROJECT - Group 6
# Team Members
* Narasimha Naidu Kommi
* Venkata Sai Shalini Ganni
* Siva Naga Rutwik Reddy Chintha
* Prashanth Sammanu

#  Introduction
This project is to utilize Core Machine Learning to perform Object Segmentation with Face Parsing and develop a mobile application, specifically for IOS. To achieve this, we will be utilizing various models throughout the project.
## Implementation Methodology

### 1. DeepLabV3 :
A potent model for object segmentation is DeepLabV3 (https://pytorch.org/hub/pytorch_vision_deeplabv3_resnet101/ ). In object segmentation, each pixel in an image is given a label indicating what object or class it pertains to. It can be used in a wide variety of real-world situations, such as autonomous driving, medical imaging, and picture editing.

We want to use various extensions to DeepLabV3, such as DeepLabV3FP1 is an extension of the original DeepLabV3 architecture. It incorporates a feature pyramid network (FPN) that allows the model to more effectively capture and integrate features at multiple scales.  This allows the model to more effectively integrate features across different scales, which can be important for accurately segmenting objects in images. And we also would like to use DeepLabV3Int8LUT is a variant of the DeepLabV3 image segmentation model that uses an 8-bit integer look-up table (LUT) for efficient inference on low-power devices.

DeepLabV3Int8LUT is particularly well-suited for use on mobile and embedded devices with limited processing power and memory, where it can provide real-time segmentation of images. The model is trained in the same way as the original DeepLabV3 model, but during inference, the pre-computed LUTs are used to speed up the calculations and reduce memory usage.

We want to compare the inferences between different flavours of this model and show the inference and execution time, even on both CPU and GPU. 

### 2. Face Parsing :

Face Parsing is a computer vision technique that involves segmenting a human face into different regions or parts, each corresponding to a different facial feature, such as the eyes, nose, mouth, cheeks, and forehead. This can be useful for a range of applications, including face recognition, facial expression analysis, and virtual makeup and accessories.

Face Parsing typically involves training a deep learning model on a large dataset of labelled images, where each pixel in the image is labeled according to the corresponding facial feature. The model can then be used to predict the facial feature segmentation for new images.

The output of a Face Parsing model is usually a color-coded mask, where each facial feature is represented by a different colour. This can be overlaid on the original image to visualize the segmentation. Face Parsing is a challenging problem due to the large variability in facial appearance across individuals, lighting conditions, and poses, but recent advances in deep learning have led to significant improvements in performance.


### 3. IOS Mobile Application :

Our mobile application project will include a range of features, such as the ability to select images from the device's gallery, as well as capturing live images using the device's camera application. One of the primary features we plan to implement is segmentation parsing.

A computer vision task known as object segmentation entails dividing an image into a number of segments, each of which correlates to a different object or area within the image. Identifying and separating each object in an image from its backdrop is the aim of object segmentation.

We aim to **emphasize real-time recording and inference in our project, to enable users to see the process of the app analyzing and parsing the images in real-time**. Our goal is to demonstrate how the inference process works and how it helps in segmenting and parsing images. And compare them real time. 


# Architecture

## Architecture Diagram:

![Screenshot](architecture.png)

## Pytorch to CoreML Coversion:

![Screenshot](pytorch_to_coreml.png)

# Project Plan based on two weeks iteration
## Iteration 1
* Gather requirements for the project,Define project scope and objectives. Set up project repository on GitHub and add team members as collaborators
* Familiarize with the technologies and the concepts.
* Divide the project into small parts and assign to each member.
* Set up the environment required to run the model.
* Develop the app interface using Apple's Xcode IDE.
* Implement the interface for the app's camera feature and integrate image capture and storage capabilities. Implement basic image processing functions to convert images to input format required by the segmentation model.

## Status tracker for iteration1 of the Project
### Requirement Analysis and project objectives
####  Requirement Analysis:
* Core Machine Learning: We will be using Core Machine Learning to integrate machine learning models into the IOS application. This will allow us to perform complex tasks such as Object Segmentation with Face Parsing.

* DeepLabV3 Machine Learning Model: DeepLabV3 is a state-of-the-art machine learning model for semantic image segmentation. We will be using this model to identify and label objects within an image.

* iOS Application Development: We will be developing a mobile application specifically for IOS. The application will provide a user-friendly interface that allows users to upload images and receive real-time feedback on object segmentation and face parsing results.

* User Interface: The user interface of the application should be intuitive and easy to use. It should allow users to upload images and perform object segmentation and face parsing without any difficulty.

#### Project Objectives:
* To develop an IOS application that can perform Object Segmentation with Face Parsing using Core Machine Learning.

* To utilize the DeepLabV3 machine learning model to achieve high levels of accuracy in object segmentation tasks.

* To provide a user-friendly interface that allows users to upload images and receive real-time feedback on object segmentation and face parsing results.

* To ensure that the application is intuitive and easy to use for all users.

* To test and validate the application to ensure that it meets the project objectives and requirements.
### Technology Acquitance
As a team, we are excited to share with you the technologies we plan to use in our project, **Object Segmentation with Face Parsing**. Our goal is to develop an iOS application that allows users to upload images and perform object segmentation and face parsing using the DeepLabV3 machine learning model. Here are some key technologies we will be using:

Firstly, we will be using **iOS application development** as our primary platform. This will allow us to create a user-friendly interface using Swift as our programming language and Xcode as our development environment. Swift is a modern programming language that is optimized for performance and safety, and Xcode provides a suite of tools for designing, building, and testing iOS applications.

Secondly, we plan to use Core Machine Learning, to integrate machine learning models into our iOS application. This will enable us to run pre-trained machine learning models on iOS devices, making it possible to perform complex tasks such as object segmentation and face parsing.

Finally, we will be utilizing the **DeepLabV3 machine learning model**. DeepLabV3 is a state-of-the-art machine learning model that is capable of identifying and labeling objects within an image. It has been trained on large datasets of images and can achieve high levels of accuracy in object segmentation tasks. With its ability to handle a wide range of image sizes, DeepLabV3 can be fine-tuned on specific datasets to improve its performance.

By combining these technologies, we hope to create an iOS application that provides users with real-time feedback on object segmentation and face parsing results. Our application has a wide range of applications, including image editing, augmented reality. We are excited to work as a team and utilize these cutting-edge technologies to bring this project to fruition.
### Project Sprint and involvement by each Team member
#### Team Discussion -
For the first iteration, We discussed and learned about the Machine Learning models that we going to use in this project like DeepLabV3 that it allows the model to capture contextual information at multiple scales, which is essential for accurate semantic segmentation. DeepLabv3 is an efficient model for semantic segmentation that is able to give the performance while keeping the computational cost low.
**Venkata Sai Shalini Ganni** started with creating the application User Interface. **Narasimha Naidu Kommi**, **Prashanth Sammanu**, **Siva Naga Rutwik Reddy Chintha** has developed the further controllers in the app such as CustomTextField, DataModel, HomePageViewController, UIButton, CustomTableViewCell. We discussed about the technologies to use in the project and got a clear view of making this application more efficient.

### Starting with IOS App interface
We created an architecture diagram of the project and implemented the interface in Xcode using Swift. We created various buttons and controllers in the swift such as AppDelegate and ContentView.

### Getting the knowledge of the ML Model
DeepLabV3 is a deep neural network architecture that uses a modified version of the convolutional neural network (CNN) called the atrous convolution or dilated convolution. The atrous convolution allows the model to capture multi-scale contextual information while maintaining spatial resolution, which is important for tasks such as image segmentation.

The atrous spatial pyramid pooling (ASPP) module is a key component of the DeepLabV3 architecture. It consists of parallel convolutional layers with different dilation rates, which allows the model to capture multi-scale information. The ASPP module is followed by a decoder network that upsamples the feature maps to the original image resolution.

DeepLabV3 is a powerful and flexible model for image segmentation tasks, including face parsing. Its ability to capture multi-scale contextual information and maintain spatial resolution makes it particularly well-suited for fine-grained segmentation tasks such as face parsing.


## Iteration 2
* Individual assignment Of each Team memeber to be determined
* Perform preliminary testing of the model to assess its precision and pinpoint opportunities for enhancement.
* Modifying the model as required to boost its precision.
* Validating the complete functionality of the model to guarantee that it satisfies the project specifications.
* Add Video capture and support DeepLabV3 model on LiveImageViewController.
* Predict an image imported from our device’s photo library. Configuring Colour range. 
* Adding Inference time in the mobile application. 
## Iteration 3
* Expand the segmentation model.
* CImplement segmentation features for the additional facial features
* IImprove the app's user interface and usability. Add gpu in the mobile application.
* Examine the system's complete operation and, in the event of any problems, troubleshoot and eliminate them to guarantee the application operates seamlessly.

## Status tracker for iteration3 of the Project

### 1. CameraTextureGenerater
The CameraTextureGenerater class creates Texture objects from camera frames or sample files. The camera data is handled by the CoreMedia framework.

The sourceKey property of the CameraTextureGenerater is used to determine the texture's source. It also has a videoTextureCache property for creating and managing video images. The videoTextureCache is created by the init procedure using the CVMetalTextureCacheCreate function.

Texture objects are returned by the texture function, which accepts a CVPixelBuffer or a CMSampleBuffer as input. It first obtains the buffer's breadth and height before generating a CVMetalTexture with the CVMetalTextureCacheCreateTextureFromImage function. Then it retrieves the underlying MTLTexture from the CVMetalTexture and uses it to build a Texture object.

The Texture object holds the image and its source key. It is used in the rendering pipeline to map textures to particular areas of the screen.

### 2.	CroppedTextureGenerater
CroppedTextureGenerater has a texture method that takes a source texture (source1) and a source region (sourceRegion) and returns a cropped texture.

Metal Performance Shaders (MPS), a framework for accelerating image processing on Apple devices, were used to create the cropped texture. The MPSImageLanczosScale filter, in particular, is used to scale and crop the input texture based on the sourceRegion.

The scaleX and scaleY variables compute the scaling factors used to convert the size of the source region to the size of the destination region. Before scaling, the translateX and translateY variables calculate the translation amounts required to move the source region to the origin.

Finally, using the scaling and translation values, an MPSScaleTransform object is created, which is then used to configure the MPSImageLanczosScale filter. The filter is then used to encode a command buffer that scales and crops the source texture before returning the resulting output texture.

### 3.  MaskTextureGenerater

MaskTextureGenerater class that generates a new texture by applying a mask to another texture. The class uses MetalKit and MetalPerformanceShaders libraries for GPU-accelerated rendering.

The class has a private pipelineState property, which holds a Metal render pipeline state used to render the mask onto the output texture. The textureBuffer1 and textureBuffer2 properties hold buffers used to store texture coordinates.

The generateTextureBuffer method generates texture coordinates for the input textures and the output texture. These coordinates are used to crop the textures to the same size before applying the mask.

The texture method takes two input Texture objects and returns a new Texture object. The method creates a render pass descriptor with a single color attachment and sets the attachment's texture as the output texture. It then creates a command buffer and a render command encoder and sets the appropriate vertex and fragment buffers, textures, and pipeline state. Finally, it draws a rectangle strip of four vertices to render the mask onto the output texture.

### 4.	MetalRenderingDevice

Device and commandQueue are two properties of MetalRenderingDevice.
The MetalRenderingDevice class contains several methods that help create and manage render pipelines and buffers for graphics rendering, such as generateRenderPipelineDescriptor, makeRenderVertexBuffer, and makeRenderVertexBuffer.
The generateRenderPipelineDescriptor method returns a render pipeline descriptor that can be used to create a render pipeline state object that describes how to render a specific object.
The makeRenderVertexBuffer method generates a vertex buffer with the specified vertices that is used to store vertex data for rendering.
The Vertex struct is used to store vertices' position and texture coordinate data.
The code also defines a global shared MetalRenderingDevice instance that can be used to access the device and queue properties from anywhere in the code.


### 5.	MetalVideoView

MetalVideoView is an MTKView. It has a property of type Texture called currentTexture that represents the current texture to be displayed in the view. It also includes a setup() function for configuring the Metal device and pipeline state, as well as a draw() function for rendering the current texture to the view. The rendering process begins with the creation of a command buffer, a render pass descriptor, and a render command encoder, followed by the configuration of the render pipeline state, vertex and uniform buffers, and texture. Finally, the encoder is instructed to draw a four-vertex triangle strip, and the command buffer is displayed to the viewer.


### 6.	MultitargetSegmentationTextureGenerater


The MultitargetSegmentationTextureGenerater that generates a texture for multitarget segmentation from a given segmentation map. The class contains a setupPiplineState function that sets up the Metal render pipeline state and vertex and uniform buffers. The texture function takes a segmentation map, row and column values, and number of classes as input and returns a texture generated from the segmentation map using Metal rendering techniques. The texture function sets up a Metal command encoder and performs a rendering pass to create the output texture.

### 7.	OverlayingTexturesGenerater

This is a class named OverlayingTexturesGenerater which generates a new texture by overlaying two input textures. It uses MetalKit framework and implements the MTKViewDelegate protocol.

The class has a pipeline state property that is used to render the textures. It has two texture buffers that are generated with the generateTextureBuffer function based on the dimensions of the input textures and the desired output dimensions.

The texture function is the main function of the class. It takes two input textures and generates a new output texture by overlaying the two textures. It first creates a render pass descriptor and sets up the output texture as the color attachment. It then creates a command buffer and a render command encoder. It sets up the vertex buffer and the texture buffers, as well as the input textures and the uniform buffer for the alpha value. Finally, it draws the primitive and commits the command buffer.



### 8.	SegmentationTextureGenerater

SegmentationTextureGenerater, which generates a Metal texture based on the segmentation output of a Core ML model. It has a texture method that accepts an MLMultiArray segmentation map, the target texture's dimensions, and a target class as input and returns a Metal Texture object. There is also a setupPipelineState method in the class that configures the Metal rendering pipeline state used by the texture method.

### 9.	Texture

Texture class that represents a Metal texture object. It has two properties: texture of type MTLTexture which stores the actual texture object and textureKey of type String which can be used to associate a key with the texture for identification purposes. The class has two initializers, one that takes an existing MTLTexture object and an optional textureKey and another that creates a new texture of specified dimensions and pixel format using the sharedMetalRenderingDevice singleton and assigns it to the texture property.

## Iteration 4
* Implement real-time video segmentation and integrate it with the camera feature..
* Optimize the app's performance and memory usage. Support face parsing and object segmentation model.
* Adding app tab item and page for tracking face and segmenting it. 
* If issues are found, analyze the root cause and take necessary actions to resolve them.
## Iteration 5
* Get the project documentation ready.
* Construct the presentation and present the completed project.
