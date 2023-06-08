

# AWS

## Create new lambda 

`AWS` -> 'US West" - Lamda 
Right click and *Create Lambda SAM Application*
Selec
 
    AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31
Description: >
  task1

  Sample SAM Template for task1


  
Always use cf feather



[Sample Python](https://docs.aws.amazon.com/cloud9/latest/user-guide/sample-python.html)


Step 4: Install and configure the AWS SDK for Python (Boto3)
The AWS SDK for Python (Boto3) enables you to use Python code to interact with AWS services like Amazon S3. For example, you can use the SDK to create an Amazon S3 bucket, list your available buckets, and then delete the bucket you just created.

Install pip
In the AWS Cloud9 IDE, confirm whether pip is already installed for the active version of Python by running the python -m pip --version command. If pip is installed, skip to the next section.

To install pip, run the following commands. Because sudo is in a different environment from your user, you must specify the version of Python to use if it differs from the current aliased version.

### Set up credentials in your environment

Each time you use the AWS SDK for Python (Boto3) to call an AWS service, you must provide a set of credentials with the call. These credentials determine whether the SDK has the necessary permissions to make the call. If the credentials don't cover the necessary permissions, the call fails.

To store your credentials within the environment, follow the instructions in [Calling AWS services from an environment in AWS Cloud9](https://docs.aws.amazon.com/cloud9/latest/user-guide/credentials.html), and then return to this topic.

For additional information, see [Credentials](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/configuration.html) in the AWS SDK for Python (Boto3).



# More info about Globals: https://github.com/awslabs/serverless-application-model/blob/master/docs/globals.rst
Globals:
  Function:
    Timeout: 3

Resources:
  HelloWorldFunction:
    Type: AWS::Serverless::Function # More info about Function Resource: https://github.com/awslabs/serverless-application-model/blob/master/versions/2016-10-31.md#awsserverlessfunction
    Properties:
      CodeUri: hello_world/
      Handler: app.lambda_handler
      Runtime: python3.7

Outputs:
 
  HelloWorldFunction:
    Description: "Hello World Lambda Function ARN"
    Value: !GetAtt HelloWorldFunction.Arn
  HelloWorldFunctionIamRole:
    Description: "Implicit IAM Role created for Hello World function"
    Value: !GetAtt HelloWorldFunctionRole.Arn

```

