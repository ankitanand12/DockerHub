import 'package:flip_card/flip_card.dart';
import 'package:http/http.dart' as http;
import 'package:DuckerHub/BottomBar/bottomBar.dart';
import 'package:DuckerHub/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashBoard extends StatelessWidget {
  _renderLaunch(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "launchContainer");
        },
        front: SizedBox(
          // TODO Launch Container
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.22,
          child: Container(
            margin: EdgeInsets.only(right: 3, top: 3, bottom: 3),
            child: Container(
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.launch,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Launch Container',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        back: SizedBox(
          // TODO Launch Container
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.22,
          child: Container(
            margin: EdgeInsets.only(right: 3, top: 3, bottom: 3),
            child: Container(
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.launch,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Launch Container',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _renderStart(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "startContainer");
        },
        front: SizedBox(
          // TODO Start Container
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.112,
          child: Container(
            margin: EdgeInsets.only(top: 3),
            child: Container(
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.image,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        back: SizedBox(
          // TODO Start Container
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.112,
          child: Container(
            margin: EdgeInsets.only(top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.image,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  _renderStop(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "stopContainer");
        },
        front: SizedBox(
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.100,
          child: Container(
            // margin: EdgeInsets.only(top: 4, right: 4, left: 4),
            child: Container(
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.stop,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Stop',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        back: SizedBox(
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.100,
          child: Container(
            // margin: EdgeInsets.only(top: 4, right: 4, left: 4),
            child: Container(
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.stop,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Stop',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _renderRemoveContainer(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "removeContainer");
        },
        front: SizedBox(
          // TODO Remove Container
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.19,
          child: Container(
            margin: EdgeInsets.only(left: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_circle,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Remove Container',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
            ),
          ),
        ),
        back: SizedBox(
          // TODO Remove Container
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.19,
          child: Container(
            margin: EdgeInsets.only(left: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_circle,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Remove Container',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  _renderRemoveAllContainer(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "removeAllContainer");
        },
        front: SizedBox(
          // TODO Remove All Container
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.19,
          child: Container(
            margin: EdgeInsets.only(right: 3, left: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Remove All Container',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
            ),
          ),
        ),
        back: SizedBox(
          // TODO Remove All Container
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.19,
          child: Container(
            margin: EdgeInsets.only(right: 3, left: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Remove All Container',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  _renderImageList(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "imageList");
        },
        front: SizedBox(
          // TODO Image List
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.107,
          child: Container(
            margin: EdgeInsets.only(left: 3, top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.launch, color: Colors.white70),
                  Text(
                    'Image\n  List',
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
            ),
          ),
        ),
        back: SizedBox(
          // TODO Image List
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.107,
          child: Container(
            margin: EdgeInsets.only(left: 3, top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.launch, color: Colors.white70),
                  Text(
                    'Image\n  List',
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  _renderRemoveImage(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "removeImage");
        },
        front: SizedBox(
          // TODO Remove Image
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.107,
          child: Container(
            margin: EdgeInsets.only(top: 3, left: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.image,
                    color: Colors.white70,
                  ),
                  Text(
                    'Remove\n Image',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
            ),
          ),
        ),
        back: SizedBox(
          // TODO Remove Image
          width: MediaQuery.of(context).size.width * 0.23,
          height: MediaQuery.of(context).size.height * 0.107,
          child: Container(
            margin: EdgeInsets.only(top: 3, left: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.image,
                    color: Colors.white70,
                  ),
                  Text(
                    'Remove\n Image',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  _renderDownloadImage(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "downloadImage");
        },
        front: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.21,
          child: Container(
            // margin: EdgeInsets.only(top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.stop,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Download Image',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
            ),
          ),
        ),
        back: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.21,
          child: Container(
            // margin: EdgeInsets.only(top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.stop,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Download Image',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  _renderRemoveTerminalMode(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "terminal");
        },
        front: SizedBox(
          // TODO Terminal Mode
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.195,
          child: Container(
            margin: EdgeInsets.only(left: 3, top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.airplay,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Terminal Mode',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
            ),
          ),
        ),
        back: SizedBox(
          // TODO Terminal Mode
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.195,
          child: Container(
            margin: EdgeInsets.only(left: 3, top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.airplay,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'Terminal Mode',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  _renderViewAll(context) {
    return Container(
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          Navigator.pushNamed(context, "viewall");
        },
        front: SizedBox(
          // TODO View All
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.195,
          child: Container(
            margin: EdgeInsets.only(right: 3, left: 3, top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.view_list,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 40),
              color: Colors.deepOrange,
            ),
          ),
        ),
        back: SizedBox(
          // TODO View All
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.height * 0.195,
          child: Container(
            margin: EdgeInsets.only(right: 3, left: 3, top: 3),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.view_list,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              // color: Color.fromRGBO(225, 25, 80, 110),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(225, 25, 80, 10),
        backgroundColor: Colors.deepOrange[700],
        title: Text('Dashboard'),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            var authc = FirebaseAuth.instance;
            toast(authc.currentUser.email);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () async {
              var url = 'http://$ip/cgi-bin/voice.py';
              var res;
              try {
                res = await http.get(url);
              } catch (e) {
                print(e);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () => print("help"),
          )
        ],
      ),
      // TODO BottomBar
      bottomNavigationBar: BottomBar(),
      body: Container(
        color: Colors.black,
        // padding: EdgeInsets.all(3),
        // margin: EdgeInsets.only(right: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _renderLaunch(context),
                Container(
                  // TODO Stop Container
                  // padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(top: 3),
                  child: Column(
                    children: <Widget>[
                      _renderStop(context),
                      _renderStart(context),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderRemoveContainer(context),
                _renderRemoveAllContainer(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    _renderImageList(context),
                    _renderRemoveImage(context),
                  ],
                ),
                Container(
                  // TODO Download Image
                  // padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(top: 3, right: 3, left: 3),
                  child: Column(
                    children: <Widget>[
                      _renderDownloadImage(context),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderRemoveTerminalMode(context),
                _renderViewAll(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
