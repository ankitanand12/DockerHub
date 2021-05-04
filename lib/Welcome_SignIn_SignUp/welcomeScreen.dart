import 'package:DuckerHub/Welcome_SignIn_SignUp/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _controller.forward();

    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
      ..addListener(() {
        setState(() {
          animation.value;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text(
          'Docker Hub',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0 * animation.value,
            color: Colors.blue,
          ),
        ),
        image: new Image.asset("images/docker2.png"),
        backgroundColor: Colors.blue[50],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.blue);
  }
}
