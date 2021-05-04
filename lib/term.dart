import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Terminal());
}

class Terminal extends StatefulWidget {
  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  var output, input = '', load = false;
  var ls = [];
  var msgc = TextEditingController();
  var fs = FirebaseFirestore.instance;
  var sc = ScrollController();
  var fo, foo;
  api(c) async {
    var url = 'http://13.234.19.87/cgi-bin/main.py?x=${c}';
    var res = await http.get(url);
    var out = res.body;
    fo = jsonDecode(out);
    foo = fo['output'];
    setState(() {
      output = '$foo';
    });

    await fs.collection('command').add({
      'cmd': c,
      'output': foo,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  print('cleared');
                })
          ],
          title: Text('Terminal'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: load,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: msgc,
                onChanged: (value) => input = value,
                cursorColor: Colors.white70,
                cursorWidth: 7,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    prefix: Text(
                      '[localhost]\$',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () async {
                      msgc.clear();
                      setState(() {
                        load = true;
                      });
                      try {
                        await api(input);
                      } catch (e) {
                        print(e);
                      }
                      setState(() {
                        load = false;
                      });
                    },
                    child: Text('Send'),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('command')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.amberAccent,
                        ),
                      );
                    }
                    var msg = snapshot.data.docs;
                    List<Text> msgls = [];
                    for (var messgae in msg) {
                      var msgcmd = messgae.data()['cmd'];
                      var msgout = messgae.data()['output'];
                      var msgwidget = Text('[localhost]\$$msgcmd\n$msgout');
                      msgls.add(msgwidget);
                    }
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView(
                        children: msgls,
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
