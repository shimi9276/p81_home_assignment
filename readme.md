# Assignment Objectives:


1. Provision Supporting Infrastructure in AWS
    * Using Terraform modules create the following:
        * S3 Bucket
        * Cloudfront Distribution
        * IAM Role (block public access to the bucket and only allow access from cloudfront) 
    * Use Terragrunt to apply and build the infrastructure
2. Create a simple Python app which completes the following: 
    * Retrieves a dummy JSON from [here](https://dummyjson.com/products)
    * Parse the JSON and retrieve all products which price values are greater or equal to 100 (or any given non negative value)
    * Create a new JSON with the filtered values
    * Upload the file to the S3 bucket created in the previous step
    * Read the uploaded file using the Cloudfront distribution created in the previous step 
3. Package the Application using GitHub Actions
    * Write a two job workflow to provision the infrastructure and run the app
