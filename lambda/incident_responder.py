import boto3
import uuid

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('infragpt-incidents')

def lambda_handler(event, context):
    item = {
        "incident_id": str(uuid.uuid4()),
        "message": "Test incident from Lambda 🚀"
    }

    table.put_item(Item=item)

    return {
        "statusCode": 200,
        "body": "Stored in DynamoDB 🚀"
    }