# Uploading Images with AWS S3

## Intro

Uploading a custom image is a very common pattern on any website.

Using MongoDB we *could* just save the image into the database as binary data. However, we will quickly bloat our database this way and start 

## Resources

1. [AWS Management Console](https://aws.amazon.com/console/)
1. [`s3-uploader`](https://www.npmjs.com/package/s3-uploader)
1. [`multer`](https://www.npmjs.com/package/multer)

## Baseline Challenges

1. When user creates a new pet, they should be able to upload an image from their computer to the pet.
1. That image should be visible on the pet's thumbnail and bigger on their page.

## Stretch Challenges

1. There should be two versions of the image, one for thumbnail that is smaller and one for the pet's page that is bigger.
1. Users should be able to update this image.
