#!/usr/bin/env python3
"""
Create a class to handle redis operations
"""

import uuid
import redis
from typing import Union


class Cache():
    """Redis class to handle redis operations"""
    def __init__(self):
        """Constructor method for redis instance"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Method to store data"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key, fn):
        """Method to get a value using its key and a callback function"""
        value = self._redis.get(key)
        if fn:
            value = fn(value)
        return value
