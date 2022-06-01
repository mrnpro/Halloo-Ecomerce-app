# hallo shop

## Introduction 
hallo shop is online trading system  . hallo shop focuses on electronics products

## Screenshot 
### Home Page
![alt home](https://github.com/mrnpro/Halloo-Ecomerce-app/blob/main/hallo%20screenshot/homepage)
### Detail Page
 
- clone repository
``` git clone https://github.com/mrnpro/Halloo-Ecomerce-app ```
- [setup firebase](https://firebase.google.com/docs/cli)
- add SHA-256 to project settings 
-  enable phone auth and google auth in firebase auth 
-  update firebase storage rule 
  ``` rules_version = '2';
service firebase.storage {
  
    match /{allPaths=**} {
      allow read, write: if request.auth != null;
    }
  }
```
- run the project through actual devices 
## How to install 
  - [clone repository](https://github.com/mrnpro/Halloo-Ecomerce-app.git)
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
