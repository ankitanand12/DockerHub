import 'package:DuckerHub/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var signup = FirebaseAuth.instance;
  var fs = FirebaseFirestore.instance;
  var email;
  var pass;
  String fullname;
  String username;
  bool call = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[600],
        title: Text(
          "SignUp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: call,
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Create an Account",
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
                onChanged: (value) {
                  fullname = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  username = value;
                },
                textCapitalization: TextCapitalization.words,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                textCapitalization: TextCapitalization.words,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                textCapitalization: TextCapitalization.words,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  pass = value;
                },
                onFieldSubmitted: (value) async {
                  setState(
                    () {
                      call = true;
                    },
                  );
                  try {
                    var user = await signup.createUserWithEmailAndPassword(
                        email: email, password: pass);
                    if (user.additionalUserInfo.isNewUser == true) {
                      await fs.collection("user").doc(username).set(
                        {
                          "fullname": fullname,
                          "username": username,
                          "email": email,
                        },
                      );
                      toast("Welcome");
                      Navigator.pushNamed(context, 'dashboard');
                    }
                    print(user);
                  } catch (e) {
                    print(e);
                  }
                  setState(
                    () {
                      call = false;
                    },
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.3,
                ),
                child: RaisedButton(
                  onPressed: () async {
                    setState(
                      () {
                        call = true;
                      },
                    );
                    try {
                      var user = await signup.createUserWithEmailAndPassword(
                          email: email, password: pass);
                      if (user.additionalUserInfo.isNewUser == true) {
                        await fs.collection("user").doc(username).set(
                          {
                            "fullname": fullname,
                            "username": username,
                            "email": email,
                          },
                        );
                        toast("Welcome");
                        Navigator.pushNamed(context, 'dashboard');
                      }
                      print(user);
                    } catch (e) {
                      print(e);
                    }
                    setState(
                      () {
                        call = false;
                      },
                    );
                  },
                  color: Colors.lightBlue,
                  child: Text("Create"),
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
