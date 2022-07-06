#!/usr/bin/env python3
"""
Create a class to handle redis operations
"""

from functools import wraps
import uuid
import redis
from typing import Callable, Union


def count_calls(mthd: Callable) -> Callable:
    """decorator function to count how many times a function is called"""
    @wraps(mthd)
    def count_calls(*args):
        """"Callback function"""
        key = mthd.__qualname__
        cache = (args[0])._redis
        cache.incr(key)
        return mthd(*args)
    return count_calls


class Cache():
    """Redis class to handle redis operations"""
    def __init__(self):
        """Constructor method for redis instance"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Method to store data"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    @count_calls
    def get(self, key, fn=None):
        """Method to get a value using its key and a callback function"""
        value = self._redis.get(key)
        if fn:
            value = fn(value)
        return value

    @count_calls
    def get_str(self, key):
        """Get a string format of a value"""
        return self.get(key, str)

    @count_calls
    def get_int(self, key):
        """Get an integer format of a value"""
        return self.get(key, int)
