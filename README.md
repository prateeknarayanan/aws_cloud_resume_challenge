# AWS Cloud Resume Challenge
This is my attempt at the Cloud Resume Challenge in AWS. Created by Forrest Brazeal, this multi-step project is an application of skills learned in cloud computing, as well as a great learning opportunity for those who are who are interested in cloud computing regardless of background.

## https://prateeknarayanan.com

## Project Components
### 1. Certifications
![aws-certified-cloud-practitioner](https://images.credly.com/size/100x100/images/00634f82-b07f-4bbd-a6bb-53de397fc3a6/image.png)
![aws-certified-developer-associate](https://images.credly.com/size/100x100/images/b9feab85-1a43-4f6c-99a5-631b88d5461b/image.png)
### 2. HTML
For the HTML I used a free sample site template from [HTML5UP](https://html5up.net/). 
### 3. CSS
Just like the HTML, the CSS also comes from [HTML5UP](https://html5up.net/).
### 4. Static Website
To make it a static website, I used S3, AWS' storage service to store the website files and enabled static website hosting. After enabling static website hosting, I created a CloudFront CDN which points to a custom origin.
### 5. HTTPS
For the HTTPS requirement, I obtained an SSL/TLS certificate from AWS Certificate Manager (ACM) to enable HTTPS.
### 6. DNS
For DNS, I used Route53 to create a hosted zone and a DNS record that aliases to a CloudFront distribution. I also used CNAMEs for the certificate in order to access the website from a custom domain name.
### 7. Javascript
I used Javascript to implement a feature where the website displays the number of people who visit it.
### 8. Database
For the database, I used DynamoDB, Amazon's NoSQL database that is efficient both in terms of performance and scalability. The database stores a count of how many people visited the website, which gets updated on each visit.
### 9. API
To meet the API requirement, I went with a Lambda URL for my Javascript function to use. The function URL acts as a dedicated endpoint for the Lambda function.
### 10. Python
The backend function to check how many visitors the website has was written in Python using AWS Lambda. Lambda is a serverless computing platform designed to run code without the need to provision any servers.
### 11. Infrastructure as Code
I used Terraform to create the IAC for the backend components: the Lambda function, database, and Lambda role in IAM. Since we don't want to always manually provision resources in the AWS console, IAC manages the infrastructure through code rather than manually provisioning.
### 12. Source Control
To store the code, I chose Git and GitHub for version control and hosting the code online.
### 13. CI/CD
For CI/CD, I chose to use GitHub Actions. Through Actions, I set up a workflow in YAML to automatically sync the frontend files with my S3 bucket every time changes are pushed.

## Architecture Diagram