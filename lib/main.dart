import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_notifi/api/firebase_Api.dart';
import 'package:flutter_firebase_notifi/home.dart';
import 'package:flutter_firebase_notifi/notification_page.dart';
final Navigatorkey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: "AIzaSyBR6gdr6GcSfLRcyS6RxGVxUkiVE2r3h20", 
    appId:  "1:47145755698:android:ac74815adf53d8d414c82b", 
    messagingSenderId:  "47145755698", 
    projectId: "flutter-firebase-notifi",
    storageBucket:"flutter-firebase-notifi.appspot.com", 
    ));
    await FirebaseApi().initNotificationa();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      navigatorKey: Navigatorkey,
      routes: {
        "/notification_screen":(context)=>const NotificationPage(),
      
      },
    );
  }
}

