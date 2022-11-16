# bakery_project

Flutter project created in Semester V for subject Smart Device Programming(SDP) by Het Patel and Deep Patel.

## About Project
Our application has two types of users – admin user and normal user.

Admin user can login to their account by providing their credentials and they will be redirected to the home page where they can add items to the store. Admin is also able to view all users, all orders placed and all the items present currently in the store.

A normal user can register themselves and login to their account and they will be redirected to the home page where they will be viewed all the items present in the store currently. Users can select the items and add them in their cart. They can view their cart, add item to cart, remove item from cart and once they are sure about the items, they can place order.

## Dependencies used in project
Taken from : [pub.dev](https://pub.dev/packages)
```
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  firebase_auth: ^3.11.0
  firebase_core: ^1.23.0
  firebase_database: ^9.1.5
  cloud_firestore: ^3.1.4
  get_storage: ^2.0.3
  flutter_launcher_icons: ^0.10.0
  ```
  
  We have used firebase in this project so you can use your own firebase for that you can refer the link below to connect your flutter project with firebase.
  [firebase.connect](https://firebase.google.com/docs/flutter/setup?platform=android)
