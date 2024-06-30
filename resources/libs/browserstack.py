import requests
import random
import json
from robot.libraries.BuiltIn import BuiltIn

def browserstack_upload_app_file(app_name, app_path, auth, custom_id):
    url = "https://api-cloud.browserstack.com/app-automate/upload"

    payload = {'custom_id': custom_id}
    files = [
        ('file', (app_name, open(app_path, 'rb'), 'application/octet-stream'))
    ]
    headers = {
        'Authorization': auth
    }

    response = requests.request("POST", url, headers=headers, data=payload, files=files)
    response.raise_for_status()

    return response.json()

def browserstack_upload_public_url(download_url, auth, custom_id):
    url = "https://api-cloud.browserstack.com/app-automate/upload"

    payload = {'url': download_url, 'custom_id': custom_id}
    headers = {
        'Authorization': auth
    }

    response = requests.request("POST", url, headers=headers, data=payload)
    response.raise_for_status()

    return response.json()



def browserstack_get_list_app(auth, custom_id):
    url = f"https://api-cloud.browserstack.com/app-automate/recent_apps/{custom_id}"

    headers = {
        'Authorization': auth
    }

    response = requests.request("GET", url, headers=headers)
    response.raise_for_status()

    return response.json()

def browserstack_api(auth, app_name=None, app_path=False, download_url=False):
    
    custom_id = f'TED_{random.randint(0, 99999)}'

    BuiltIn().log_to_console(f'Enviando App para o Browserstack - CustomID {custom_id}')

    if app_path:
        browserstack_upload_app_file(app_name, app_path, auth, custom_id)
        bs_get_app = browserstack_get_list_app(auth, custom_id)
    elif download_url:
        browserstack_upload_public_url(download_url, auth, custom_id)
        bs_get_app = browserstack_get_list_app(auth, custom_id)

    return  bs_get_app[0]

def scenario_status(session_id, status, reason, auth):

    url = f"https://api-cloud.browserstack.com/app-automate/sessions/{session_id}.json"
    headers = {
        'Content-Type': 'application/json',
        'Authorization': auth
    }

    if status == 'FAIL':

        payload = json.dumps({
            "status": "failed",
            "reason": reason
        })

    else:

        payload = json.dumps({
            "status": "passed",
            "reason": "Test Passed"
        })

    requests.request("PUT", url, headers=headers, data=payload)