#!/usr/bin/python3
"""
module to get a list of schools with a provided topic from mongodb database
"""


def schools_by_topic(mongo_collection, topic):
    """Function to return a list of schools offering a topic"""
    all_schools = mongo_collection.find( {"topics": {"$in": [topic]}} )
    return all_schools
