import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_firebase_notifi/main.dart';

class FirebaseApi {
  final _firebasemessaging = FirebaseMessaging.instance;


  Future<void>initNotificationa()async{
await _firebasemessaging.requestPermission();


/// how to token create
final FCMToken = await _firebasemessaging.getToken();


// print token
print("Token$FCMToken");
initNotificationa();
  }
// functions have message received
  void HandleMessage(RemoteMessage? message){

    if(message == null) return;


    /// when the message is received we click the meesage to push the notificatons screens
    Navigatorkey.currentState?.pushNamed(
      
      "/notificaton_screen",
      arguments: message,
    );

    /// when the app is terminted and now open 
    Future initPushNotification()async{

      FirebaseMessaging.instance.getInitialMessage().then(HandleMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(HandleMessage);

    }
  }


}