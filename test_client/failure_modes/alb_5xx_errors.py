import requests


def trigger_5xx_error_count_anomaly(base_url: str):
    while True:
        result = requests.get("http://" + base_url + "/badgateway")
        print(f"Request completed. Response code: {result.status_code}")
