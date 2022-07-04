#!/usr/bin/env python3
"""
Module to get average from scores
"""


def top_students(mongo_collection):
    """Function to update documents with scores average"""
    all_students = mongo_collection.aggregate(
        [
            {"$match": {}},
            {"$unwind": "$topics"},
            {"$group": {"_id": "$name", "averageScore": {"$avg": "$topics.score"}}},
            {"$sort": {"averageScore": -1}},
        ]
    )
    for student in all_students:
        mongo_collection.update_one(
            {"name": student.get("_id")},
            {"$set": {"averageScore": student.get("averageScore")}}
        )
    all_students = mongo_collection.find().sort("averageScore", -1)
    return all_students
