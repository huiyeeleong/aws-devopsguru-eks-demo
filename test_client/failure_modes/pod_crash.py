import time
import requests

def trigger_pod_crash(base_url: str):
    while True:
        result = requests.put("http://" + base_url + "/crash")
        print(f"Request completed. Response code: {result.status_code}")
        time.sleep(30)