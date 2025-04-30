import time
import random
import string

def generate_id():
    """Generate ID using special format
    MAX_LENGTH = 8CHARS
    TIME: 04 -> Unique Time
    TEXT: 04 -> Special Chars
    """
    micro_timestamp = str(int(time.time() * 1000000))[-4:]
    random_suffix = str(random.randint(100, 999))
    text = ''.join(random.choices(string.ascii_uppercase + string.digits, k=3))
    return f"{text}-{micro_timestamp}-{random_suffix}"

if __name__ == '__main__':
    for i in range(10):
        print(f'UNIQUE_ID: {generate_id()}')
    