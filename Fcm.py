import firebase_admin
from firebase_admin import messaging
from firebase_admin import credentials
import os

import pyrebase
import firebase_admin
from firebase_admin import messaging
from firebase_admin import credentials

cred = credentials.Certificate("./pixie-b4bf8-firebase-adminsdk-cdjsi-09a89665de.json") # json 파일 필요
firebase_admin.initialize_app(cred)

config={
	"apiKey": "AIzaSyAn13FTdnfEaWl_KRpU3H1HEwr3NOz9vIE", #webkey
	"authDomain": "pixie-b4bf8.firebaseapp.com", #프로젝트ID
	"databaseURL": "https://pixie-b4bf8-default-rtdb.asia-southeast1.firebasedatabase.app", #database url
	"storageBucket": "pixie-b4bf8.appspot.com", #storage
	"serviceAccount": "./pixie-b4bf8-firebase-adminsdk-cdjsi-09a89665de.json" # json 파일 필요
}

firebase = pyrebase.initialize_app(config)
storage = firebase.storage()
#cred = credentials.Certificate("/content/drive/MyDrive/Colab_Notebooks/code/pixie-b4bf8-firebase-adminsdk-cdjsi-09a89665de.json")
#firebase_admin.initialize_app(cred)

def send_to_firebase_cloud_messaging(title, body):
    registration_token = 'cBRwgIapRVyv7r4t5CfekZ:APA91bH-K3PutC9OECT-29Knkh-QLybNCC9_38KjC0N5P3rDL83c4AJLwEOhoWU5kpP-8ge3RXOAlms0f9khMiNE2bkSj5kBDueSxRPHdQdsitxGPizrTiPWsSys43ZwBRiHlM41NlCr'

    message = messaging.Message(
    notification=messaging.Notification(
        title=title,
        body=body,
    ),
    token=registration_token,
    )

    response = messaging.send(message)
    print('성공적으로 보낸 알림:', response)

send_to_firebase_cloud_messaging("쓰레기 무단 투기 알림", "쓰레기 무단 투기가 의심되는 영상을 발견했습니다. PIXIE 어플에서 확인해주세요.")