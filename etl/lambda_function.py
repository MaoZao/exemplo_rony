import boto3
import urllib.request
import os

# Constantes
file_name = "/tmp/titanic.csv"
object_name = "raw-data/titanic/titanic.csv"


def get_data():
    url = "https://raw.githubusercontent.com/neylsoncrepalde/titanic_data_with_semicolon/main/titanic.csv"
    urllib.request.urlretrieve(url, file_name)
    return True


def handler(event, context):

    bucket_name = os.environ['BUCKET']
    region = os.environ['REGION']

    res = get_data()

    s3 = boto3.client("s3")
    s3.upload_file(file_name, bucket_name, object_name)

    return {
        'statusCode': 200,
        'body': f"Subiu o arquivo {object_name} para o bucket {bucket_name}. E nois que voa!"
    }
