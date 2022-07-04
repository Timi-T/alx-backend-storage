#!/usr/bin/env python3
"""
Module to add a new document to a mongodb database
"""


def insert_school(mongo_collection, **kwargs):
    """Return the new document id"""
    new_doc = mongo_collection.insert_one(kwargs)
    return new_doc.inserted_id
