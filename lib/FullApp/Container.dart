import 'dart:convert';
import 'package:DuckerHub/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;

//Launch Container

class LaunchContainer extends StatefulWidget {
  @override
  _LaunchContainerState createState() => _LaunchContainerState();
}

class _LaunchContainerState extends State<LaunchContainer> {
  @override
  void initState() {
    super.initState();
    imgs();
    vol();
    net();
  }

  var output, osn, im, st, ntn, l, load = false;
  List image,
      volume,
      network,
      driverNet,
      driverVol,
      tag,
      y = [],
      z = [],
      N = [];

  vol() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showVol.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      volume = fo['name'];
      driverVol = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = volume.length;
      load = false;
      var len = l != null ? l : 0;
      for (var i = 0; i < len; i++) {
        z.add('${volume[i]}');
      }
    });
  }

  imgs() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showImage.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      image = fo['images'];
      tag = fo['versions'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = image.length;
      load = false;
      var len = l != null ? l : 0;
      for (var i = 0; i < len; i++) {
        y.add('${image[i]}:${tag[i]}');
      }
    });
  }

  net() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showNet.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      network = fo['name'];
      driverNet = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(
      () {
        l = network.length;
        load = false;
        var len = l != null ? l : 0;
        for (var i = 0; i < len; i++) {
          N.add('${network[i]}');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    lnch(os, i, s, n) async {
      var url = 'http://$ip/cgi-bin/launch.py?osn=$os&im=$i&st=$s&ntn=$n';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
      } catch (e) {
        foo = 'Plzzz connect to the Internet';
      }
      setState(() {
        output = '$foo';
        load = false;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Enter Details'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'OS Name:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    onChanged: (value) => {osn = value},
                    decoration: InputDecoration(
                      hintText: 'os-name',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Image And Version:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton(
                      hint: Text('Select Image'),
                      dropdownColor: Colors.grey[200],
                      value: im,
                      isExpanded: true,
                      elevation: 5,
                      onChanged: (value) {
                        setState(() {
                          im = value;
                        });
                      },
                      items: y.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Storage & Folder:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      hint: Text('Select Storage'),
                      value: st,
                      elevation: 5,
                      isExpanded: true,
                      dropdownColor: Colors.grey[200],
                      onChanged: (value) {
                        setState(() {
                          st = value;
                        });
                      },
                      items: z.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Network:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      hint: Text('Select Network'),
                      value: ntn,
                      elevation: 5,
                      isExpanded: true,
                      dropdownColor: Colors.grey[200],
                      onChanged: (value) {
                        setState(() {
                          ntn = value;
                        });
                      },
                      items: N.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 190,
                    ),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: Container(
                        child: RaisedButton(
                          onPressed: () {
                            lnch(osn, im, st, ntn);
                          },
                          color: Colors.lightBlue,
                          child: Text(
                            'Launch',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(output ?? ''),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TODO Start Container

class StartContainer extends StatefulWidget {
  @override
  _StartContainerState createState() => _StartContainerState();
}

class _StartContainerState extends State<StartContainer> {
  @override
  void initState() {
    super.initState();

    launchedContainer();
  }

  var l = 0;
  var load = false;
  List osls, statusls, imagels;
  launchedContainer() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/LosAll.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      setState(() {
        osls = fo['container'];
        statusls = fo['status'];
        imagels = fo['image'];
      });
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = osls.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]),
  ];

  Widget tb() {
    var len = l != null ? l : 0;

    for (var i = 0; i < len; i++) {
      y.add(
        TableRow(children: [
          TableCell(
            child: Center(
              child: Text(
                '${osls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${statusls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${imagels[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      );
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
  }

  @override
  Widget build(BuildContext context) {
    var output;
    var osn;

    strt(os) async {
      var url = 'http://$ip/cgi-bin/start.py?osn=$os';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
      } catch (e) {
        foo = 'something went wrong';
      }
      setState(() {
        output = '$foo';
        load = false;
      });
      toast('$output has been started');
      //Navigator.pushNamed(context, "/stop");
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Start Container'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Enter OS name:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onSubmitted: (value) {
                      strt(value);
                    },
                    onChanged: (value) => {osn = value},
                    decoration: InputDecoration(
                        hintText: 'os-name', border: OutlineInputBorder()),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 90,
                  height: 40,
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        strt(osn);
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        'Start',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Launched Container',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 400,
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
      ),
    );
  }
}

//TODO Stop Container

class StopContainer extends StatefulWidget {
  @override
  _StopContainerState createState() => _StopContainerState();
}

class _StopContainerState extends State<StopContainer> {
  @override
  void initState() {
    super.initState();

    launchedContainer();
  }

  var l = 0;
  var load = false;
  List osls, statusls, imagels;
  launchedContainer() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/Los.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      setState(() {
        osls = fo['container'];
        statusls = fo['status'];
        imagels = fo['image'];
      });
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = osls.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]),
  ];

  Widget tb() {
    var len = l != null ? l : 0;
    for (var i = 0; i < len; i++) {
      y.add(
        TableRow(children: [
          TableCell(
            child: Center(
              child: Text(
                '${osls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${statusls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${imagels[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      );
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
    var output;
    var osn;

    stp(os) async {
      var url = 'http://$ip/cgi-bin/stop.py?osn=$os';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
      } catch (e) {
        foo = 'something went wrong';
      }
      setState(() {
        output = '$foo';
        load = false;
      });
      toast('$output has been stopped');
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Stop Container'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Enter OS name:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onSubmitted: (value) {
                      stp(value);
                    },
                    onChanged: (value) => {osn = value},
                    decoration: InputDecoration(
                        hintText: 'os-name', border: OutlineInputBorder()),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 90,
                  height: 40,
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        stp(osn);
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        'Stop',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Launched Container',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 400,
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
      ),
    );
  }
}

//TODO Running Container

class RunningContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Running Container'),
      ),
      body: RunningContainerBody(),
    );
  }
}

class RunningContainerBody extends StatefulWidget {
  @override
  _RunningContainerBodyState createState() => _RunningContainerBodyState();
}

class _RunningContainerBodyState extends State<RunningContainerBody> {
  @override
  void initState() {
    super.initState();
    launchedContainer();
  }

  var l = 0;
  var call = false;
  List osls, statusls, imagels;
  launchedContainer() async {
    setState(() {
      call = true;
    });
    var url = 'http://$ip/cgi-bin/LosAll.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      setState(() {
        osls = fo['container'];
        statusls = fo['status'];
        imagels = fo['image'];
      });
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = osls.length;
      call = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]),
  ];

  Widget tb() {
    var len = l != null ? l : 0;

    for (var i = 0; i < len; i++) {
      y.add(
        TableRow(children: [
          TableCell(
            child: Center(
              child: Text(
                '${osls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${statusls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${imagels[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      );
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
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: call,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Launched Container',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: 400,
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

//TODO Remove One Container

class RemoveContainer extends StatefulWidget {
  @override
  _RemoveContainerState createState() => _RemoveContainerState();
}

class _RemoveContainerState extends State<RemoveContainer> {
  void initState() {
    super.initState();

    launchedContainer();
  }

  var l = 0;
  var load = false;
  List osls, statusls, imagels;
  launchedContainer() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/LosAll.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      setState(() {
        osls = fo['container'];
        statusls = fo['status'];
        imagels = fo['image'];
      });
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = osls.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]),
  ];

  Widget tb() {
    var len = l != null ? l : 0;
    for (var i = 0; i < len; i++) {
      y.add(
        TableRow(children: [
          TableCell(
            child: Center(
              child: Text(
                '${osls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${statusls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${imagels[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      );
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
    var output;
    var osn;

    stp(os) async {
      var url = 'http://$ip/cgi-bin/removeos.py?osn=$os';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
      } catch (e) {
        foo = 'something went wrong';
      }
      setState(() {
        output = '$foo';
        load = false;
      });
      toast('$output has been removed');
      //Navigator.pushNamed(context, "/stop");
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Remove Container'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Enter Container name:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onSubmitted: (value) {
                      stp(value);
                    },
                    onChanged: (value) => {osn = value},
                    decoration: InputDecoration(
                        hintText: 'container-name',
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 90,
                  height: 40,
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        stp(osn);
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        'Remove',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Launched Container',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 400,
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
      ),
    );
  }
}

//TODO Remove All Container

class RemoveAllContainer extends StatefulWidget {
  @override
  _RemoveAllContainerState createState() => _RemoveAllContainerState();
}

class _RemoveAllContainerState extends State<RemoveAllContainer> {
  void initState() {
    super.initState();
    launchedContainer();
  }

  var l = 0;
  var load = false, output;
  List osls, statusls, imagels;
  launchedContainer() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/LosAll.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      setState(() {
        osls = fo['container'];
        statusls = fo['status'];
        imagels = fo['image'];
      });
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = osls.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]),
  ];

  Widget tb() {
    var len = l != null ? l : 0;
    for (var i = 0; i < len; i++) {
      y.add(
        TableRow(children: [
          TableCell(
            child: Center(
              child: Text(
                '${osls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${statusls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${imagels[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      );
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
  }

  @override
  Widget build(BuildContext context) {
    /*var output;
    var osn;

    stp(os) async {
      var url = 'http://$ip/cgi-bin/stop.py?osn=$os';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
      } catch (e) {
        foo = 'something went wrong';
      }
      setState(() {
        output = '$foo';
        load = false;
      });
      toast('$output has been stopped');
      //Navigator.pushNamed(context, "/stop");
    }*/

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Remove All Container'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 90,
                  height: 40,
                  child: Container(
                    child: RaisedButton(
                      onPressed: () async {
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Are You Sure'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'This would remove all Running or Non-Running Container'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Yes'),
                                  onPressed: () async {
                                    var url =
                                        'http://$ip/cgi-bin/removeAllOs.py';
                                    var res, o, fo, foo;
                                    setState(() {
                                      load = true;
                                    });
                                    try {
                                      res = await http.get(url);
                                      o = res.body;
                                      fo = jsonDecode(o);
                                      foo = fo['output'];
                                      print(foo);
                                      if (foo == 0) {
                                        toast('Removed all OS');
                                      } else {
                                        toast('Something Not good');
                                      }
                                    } catch (e) {
                                      foo = 'something went wrong';
                                    }
                                    setState(() {
                                      load = false;
                                    });

                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        'Remove All',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Launched Container',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 400,
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
      ),
    );
  }
}

//Expose Container

class ExposeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Expose Container"),
      ),
      body: Expose(),
    );
  }
}

class Expose extends StatefulWidget {
  @override
  _ExposeState createState() => _ExposeState();
}

class _ExposeState extends State<Expose> {
  void initState() {
    super.initState();
    imgs();
    volm();
    net();
  }

  var load = false;
  var output, osname, img, vol, baseport, contport, network, l;
  List image, volume, netw, driverNet, driverVol, tag, y = [], z = [], N = [];

  volm() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showVol.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      volume = fo['name'];
      driverVol = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = volume.length;
      load = false;
      var len = l != null ? l : 0;
      for (var i = 0; i < len; i++) {
        z.add('${volume[i]}');
      }
    });
  }

  imgs() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showImage.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      image = fo['images'];
      tag = fo['versions'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = image.length;
      load = false;
      var len = l != null ? l : 0;
      for (var i = 0; i < len; i++) {
        y.add('${image[i]}:${tag[i]}');
      }
    });
  }

  net() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showNet.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      netw = fo['name'];
      driverNet = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(
      () {
        l = netw.length;
        load = false;
        var len = l != null ? l : 0;
        for (var i = 0; i < len; i++) {
          N.add('${netw[i]}');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    expose(osn, im, v, bp, cp, net) async {
      var url =
          'http://$ip/cgi-bin/expose.py?osn=$osn&im=$im&st=$v&bport=$bp&cport=$cp&ntn=$net';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['status'];
      } catch (e) {
        foo = 'Plzzz connect to the Internet';
      }
      setState(() {
        output = '$foo';
        load = false;
      });

      if (int.parse('$output') == 0) {
        toast('Container Exposed Sucessfully');
      } else {
        toast('something went wrong');
      }
    }

    return ModalProgressHUD(
      inAsyncCall: load,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'OS Name',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Os name',
                ),
                onChanged: (value) {
                  osname = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Image And Version:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                    hint: Text('Select Image'),
                    dropdownColor: Colors.grey[200],
                    value: img,
                    isExpanded: true,
                    elevation: 5,
                    onChanged: (value) {
                      setState(() {
                        img = value;
                      });
                    },
                    items: y.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Volume Name:Mount Path',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Volume Name:Mount Path',
                ),
                onChanged: (value) {
                  vol = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Base Port No.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Base Port No.',
                ),
                onChanged: (value) {
                  baseport = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Container Port No.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Container Port No.',
                ),
                onChanged: (value) {
                  contport = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Network:',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    hint: Text('Select Network'),
                    value: network,
                    elevation: 5,
                    isExpanded: true,
                    dropdownColor: Colors.grey[200],
                    onChanged: (value) {
                      setState(() {
                        network = value;
                      });
                    },
                    items: N.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () =>
                    expose(osname, img, vol, baseport, contport, network),
                color: Colors.lightBlue,
                child: Text("Expose"),
                elevation: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
