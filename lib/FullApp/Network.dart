import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DuckerHub/main.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

//Show Networks

class ShowNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Network"),
      ),
      body: ShowNetworkBody(),
    );
  }
}

class ShowNetworkBody extends StatefulWidget {
  @override
  _ShowNetworkBody createState() => _ShowNetworkBody();
}

class _ShowNetworkBody extends State<ShowNetworkBody> {
  @override
  void initState() {
    super.initState();
    shownet();
  }

  var call = false;
  var dr, l = 0;
  var net;
  List namels = [], idls, driverls;

  shownet() async {
    setState(() {
      call = true;
    });
    var url = 'http://$ip/cgi-bin/showNet.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      namels = fo['name'];
      idls = fo['id'];
      driverls = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = namels.length;
      call = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Driver',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'ID',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ])
  ];
  Widget tb() {
    var len = l != null ? l : 0;
    for (var i = 0; i < len; i++) {
      y.add(TableRow(children: [
        TableCell(
          child: Center(
            child: Text(
              '${namels[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(
              '${driverls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(
              '${idls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ]));
    }
    return Table(
      border: TableBorder.all(width: 2),
      columnWidths: {
        0: FixedColumnWidth(90.0),
        1: FixedColumnWidth(150.0),
        2: FixedColumnWidth(130.0),
      },
      children: y,
    );

    // return TableRow(children: [TableCell(child: Text('$y'))]);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: call,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Available Networks',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: 300,
              child: ListView(children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    tb(),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

//Create Network

class CreateNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Create Network"),
      ),
      body: CreateNetwokBody(),
    );
  }
}

class CreateNetwokBody extends StatefulWidget {
  @override
  _CreateNetwokBody createState() => _CreateNetwokBody();
}

class _CreateNetwokBody extends State<CreateNetwokBody> {
  @override
  void initState() {
    super.initState();
    shownet();
  }

  var load = false;
  var dr, l = 0;
  var net;
  List namels, driverls, idls;

  shownet() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showNet.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      namels = fo['name'];
      idls = fo['id'];
      driverls = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = namels.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Driver',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'ID',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ])
  ];
  Widget tb() {
    var len = l != null ? l : 0;
    for (var i = 0; i < len; i++) {
      y.add(TableRow(children: [
        TableCell(
          child: Center(
            child: Text(
              '${namels[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(
              '${driverls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(
              '${idls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ]));
    }
    return Table(
      border: TableBorder.all(width: 2),
      columnWidths: {
        0: FixedColumnWidth(90.0),
        1: FixedColumnWidth(150.0),
        2: FixedColumnWidth(130.0),
      },
      children: y,
    );

    // return TableRow(children: [TableCell(child: Text('$y'))]);
  }

  @override
  Widget build(BuildContext context) {
    createNet(d, n) async {
      var url = 'http://$ip/cgi-bin/createnet.py?drive=$d&net=$n';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        var status = fo['status'];
        if (status == 0) {
          toast('$n network has been created');
        } else {
          toast('Something went wrong');
        }
      } catch (e) {
        foo = 'something went wrong';
      }
      setState(() {
        l = namels.length;
        load = false;
      });

      //Navigator.pushNamed(context, "/stop");
    }

    return ModalProgressHUD(
      inAsyncCall: load,
      child: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextFormField(
                onChanged: (value) => dr = value,
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Driver',
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
              child: TextFormField(
                onChanged: (value) => net = value,
                onFieldSubmitted: (value) {
                  createNet(dr, net);
                },
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Network name',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                createNet(dr, net);
              },
              color: Colors.lightBlue,
              child: Text("Create"),
              elevation: 10,
            ),
            Center(
              child: Text(
                'Available Network',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: 300,
              child: ListView(children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    tb(),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
