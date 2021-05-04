import 'Routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

var ip = "13.234.19.87";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      // title: "Container",
      initialRoute: 'welcomescreen',
      checkerboardOffscreenLayers: false,
      routes: approutes,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blue),
    ),
  );
}

toast(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}

/* 


 TODO Next page
  onPressed: () {
   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => clssName()),
  );
}


TODO Back Page
 onPressed: () {
  Navigator.pop(context);
}

*/
