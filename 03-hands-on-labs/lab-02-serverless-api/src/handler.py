"""
Lab 02 — Serverless API Lambda Handler
Handles basic CRUD operations against a DynamoDB table.
"""

import json
import logging
import os

import boto3
from boto3.dynamodb.conditions import Key

logger = logging.getLogger()
logger.setLevel(os.getenv("LOG_LEVEL", "INFO"))

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def lambda_handler(event: dict, context) -> dict:
    """Entry point — route by HTTP method and path."""
    logger.info("Event: %s", json.dumps(event))

    http_method = event.get("requestContext", {}).get("http", {}).get("method", "")
    path_params = event.get("pathParameters") or {}
    item_id = path_params.get("id")

    try:
        if http_method == "GET" and item_id:
            return get_item(item_id)
        elif http_method == "GET":
            return list_items()
        elif http_method == "POST":
            body = json.loads(event.get("body") or "{}")
            return create_item(body)
        elif http_method == "DELETE" and item_id:
            return delete_item(item_id)
        else:
            return _response(405, {"error": "Method not allowed"})
    except Exception as exc:  # pylint: disable=broad-except
        logger.exception("Unhandled error: %s", exc)
        return _response(500, {"error": "Internal server error"})


# -------------------------------------------------------
# Handlers
# -------------------------------------------------------

def list_items() -> dict:
    result = table.scan()
    return _response(200, result.get("Items", []))


def get_item(item_id: str) -> dict:
    result = table.get_item(Key={"id": item_id})
    item = result.get("Item")
    if not item:
        return _response(404, {"error": "Item not found"})
    return _response(200, item)


def create_item(body: dict) -> dict:
    if "id" not in body:
        return _response(400, {"error": "'id' field is required"})
    table.put_item(Item=body)
    return _response(201, body)


def delete_item(item_id: str) -> dict:
    table.delete_item(Key={"id": item_id})
    return _response(204, {})


# -------------------------------------------------------
# Helper
# -------------------------------------------------------

def _response(status_code: int, body) -> dict:
    return {
        "statusCode": status_code,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }
