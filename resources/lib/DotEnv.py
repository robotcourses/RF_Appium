import os
from dotenv import load_dotenv, dotenv_values

for key in dotenv_values().keys():
    if key in os.environ:
        print(key)
        del os.environ[key]

load_dotenv()
