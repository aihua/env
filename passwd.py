#!/usr/bin/python

import string
import random
import os

length = 10

chars = string.ascii_letters + string.digits + '!@#$%^&*()'
#chars = string.ascii_letters + string.digits 

random.seed = (os.urandom(1024))

print ''.join(random.choice(chars) for i in range(length))

