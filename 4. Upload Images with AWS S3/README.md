# Uploading Images with AWS S3

## Competencies & Objectives

## Intro

Uploading a custom image is a very common pattern on any website.

Using MongoDB we *could* just save the image into the database as binary data. However, we will quickly bloat our database this way and start paying a lot of $$$ to our database provider.

Instead we should use a cloud storage service like Amazon AWS S3 or App Fog. In this case we will be using Amazon AWS S3. This is not only more efficient and cheap, but we are continuing to employ a Service Oriented Architecture or even a "Microservices Architecture" in order to keep our stack modular, scalable, and lean.

There are various libraries that wrap the S3 API. On the simple end is just the `aws-sdk` module, but for this I've chosen that we use the `s3-uploader` module which allows us to resize and crop images and store multiple versions in S3.

## Resources

1. [What is Microservices Architecture?](https://smartbear.com/learn/api-design/what-are-microservices/)
1. [AWS Management Console](https://aws.amazon.com/console/)
1. [`s3-uploader`](https://www.npmjs.com/package/s3-uploader)
1. [`multer`](https://www.npmjs.com/package/multer)

## Baseline Challenges

1. Read "What is Microservices Architecture?" and come up with three questions for the group discussion.
1. Meet with a partner and make a plan for what changes you will have to make to add the following user stories to Famous Amos' Pets' Store. (hint: read `s3-uploader` and `multer` documentation and try drawing a picture).
  * When user creates a new pet, they should be able to upload an image from their computer to the pet.
  * That image should be visible on the pet's thumbnail and bigger on their page.

## Stretch Challenges

1. There should be two versions of the image, one for thumbnail that is smaller and one for the pet's page that is bigger.
1. Add validations that these images are only images.
1. Add allowing uploading pdf for the pet's vaccinations form.
