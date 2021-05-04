import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:DuckerHub/main.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// Create Volume

class CreateVolume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Create Volume"),
      ),
      body: CreateVolumeBody(),
    );
  }
}

class CreateVolumeBody extends StatefulWidget {
  @override
  _CreateVolumeBody createState() => _CreateVolumeBody();
}

class _CreateVolumeBody extends State<CreateVolumeBody> {
  @override
  void initState() {
    super.initState();
    showVol();
  }

  var call = false;
  var dr, l = 0;
  var net;
  List namels;
  List driverls;

  showVol() async {
    setState(() {
      call = true;
    });
    var url = 'http://$ip/cgi-bin/showVol.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      namels = fo['name'];
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
            'Driver',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Name',
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
      ]));
    }
    return Table(
      border: TableBorder.all(width: 2),
      columnWidths: {
        0: FixedColumnWidth(120.0),
        1: FixedColumnWidth(160.0),
      },
      children: y,
    );

    // return TableRow(children: [TableCell(child: Text('$y'))]);
  }

  @override
  Widget build(BuildContext context) {
    var vol, output;

    createVol(v) async {
      var url = 'http://$ip/cgi-bin/createvol.py?vname=$v';
      var res, o, fo, foo, status;
      setState(() {
        call = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
        status = fo['status'];
      } catch (e) {
        foo = 'something went wrong';
      }
      setState(() {
        output = '$foo';
        call = false;
      });
      if (status == 0) {
        toast('$v volume gas been created');
      } else {
        toast("$output");
      }
    }

    return ModalProgressHUD(
      inAsyncCall: call,
      child: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
              child: TextFormField(
                onChanged: (value) => vol = value,
                onFieldSubmitted: (value) {
                  createVol(vol);
                },
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Volume name',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                createVol(vol);
              },
              color: Colors.lightBlue,
              child: Text("Create"),
              elevation: 10,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Available Volume',
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

//TODO Show Volume

class ShowVolume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Volume"),
      ),
      body: ShowVolumeBody(),
    );
  }
}

class ShowVolumeBody extends StatefulWidget {
  @override
  _ShowVolumeBody createState() => _ShowVolumeBody();
}

class _ShowVolumeBody extends State<ShowVolumeBody> {
  @override
  void initState() {
    super.initState();
    showVol();
  }

  var call = false;
  var dr, l = 0;
  var net;
  List namels = [];
  List driverls;

  showVol() async {
    setState(() {
      call = true;
    });
    var url = 'http://$ip/cgi-bin/showVol.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      namels = fo['name'];
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
            'Driver',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Name',
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
      ]));
    }
    return Table(
      border: TableBorder.all(width: 2),
      columnWidths: {
        0: FixedColumnWidth(120.0),
        1: FixedColumnWidth(160.0),
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
                'Available Volume',
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
