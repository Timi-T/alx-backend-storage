#!/usr/bin/env python3
"""
Module to update a collection in a mongo database
"""


def update_topics(mongo_collection, name, topics):
    """Update school collection with a list of topics"""
    mongo_collection.update_many({"name": name}, {
        "$set":
        {
            "topics": topics
        }
    })
