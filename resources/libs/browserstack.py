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

browserstack_api(
    auth='Basic cm9ib3Rjb3Vyc2VzX1A3R01WRjp5QXMyVE1ycXRCVW5BZlM4RUhxWA==',
    app_name='app.apk',
    app_path='C://Workspace//Appium//resource//app//app.apk',
    # download_url="https://eb5e7388c3df147b74dd2379b7cf8323.r2.cloudflarestorage.com/downloadprod/wp-content/uploads/2024/06/17/6668564c066dc/com.ted.android_7.5.42-4956_minAPI21%28arm64-v8a%2Carmeabi-v7a%2Cx86%2Cx86_64%29%28nodpi%29_apkmirror.com.apk?X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=72a5ba3a0b8a601e535d5525f12f8177%2F20240627%2Fauto%2Fs3%2Faws4_request&X-Amz-Date=20240627T143633Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=55ab6e7e3b6ff38dd2b479c7e917b7ae92f9b815652dbcb13534d4631a2c18af"

)