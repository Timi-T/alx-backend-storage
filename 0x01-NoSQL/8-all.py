#!/usr/bin/env python3
"""
Module to list all documents in a mongodb collection
"""


def list_all(mongo_collection):
    """List all documets using the find method"""
    return mongo_collection.find()
