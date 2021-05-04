import 'package:DuckerHub/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var auth = FirebaseAuth.instance;
  String email;
  String pass;
  bool call = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: ModalProgressHUD(
        inAsyncCall: call,
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlue,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.36,
              child: Image.asset(
                "images/docker2.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.35,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            shadows: [BoxShadow()]),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    autocorrect: false,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      pass = value;
                    },
                    onSubmitted: (value) async {
                      setState(
                        () {
                          call = true;
                        },
                      );
                      try {
                        var sign = await auth.signInWithEmailAndPassword(
                            email: email, password: pass);
                        if (sign != null) {
                          Navigator.pushNamed(context, 'dashboard');
                          toast("Login Successful");
                        } else {
                          toast("Something error");
                        }
                      } catch (e) {
                        toast("user not fount");
                        print(e);
                      }
                      setState(
                        () {
                          call = false;
                        },
                      );
                    },
                  ),

                  // TODO Forgot Password Page
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'forgotpass');
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  // TODO SignIn Button
                  RaisedButton(
                    color: Colors.lightBlue,
                    child: Center(
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    elevation: 10,
                    onPressed: () async {
                      setState(
                        () {
                          call = true;
                        },
                      );
                      try {
                        var sign = await auth.signInWithEmailAndPassword(
                            email: email, password: pass);
                        if (sign != null) {
                          Navigator.pushNamed(context, 'dashboard');
                          toast("Login Successful");
                        } else {
                          print("ankit");
                        }
                      } catch (e) {
                        toast("user not fount");
                        print(e);
                      }
                      setState(
                        () {
                          call = false;
                        },
                      );
                    },
                  ),
                  FlatButton(
                    child: Text("\nCreate new account"),
                    onPressed: () {
                      Navigator.pushNamed(context, 'signup');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
