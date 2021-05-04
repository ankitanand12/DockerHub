import 'package:DuckerHub/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO Image List

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    imgs();
  }

  var output;
  List imgls;
  List tagls;
  List idls;
  var l = 0;
  var load = false;

  imgs() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showImage.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      imgls = fo['images'];
      tagls = fo['versions'];
      idls = fo['ids'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = imgls.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Version',
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
    for (var i = 0; i < l; i++) {
      y.add(TableRow(children: [
        TableCell(
          child: Center(
            child: Text(
              '${imgls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(
              '${tagls[i]}',
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Images Available'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            tb(),
          ],
        ),
      ),
    );
  }
}

// TODO Create Image

class CreateImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Create Image"),
      ),
      body: CreateImageBody(),
    );
  }
}

class CreateImageBody extends StatefulWidget {
  @override
  _CreateImageBodyState createState() => _CreateImageBodyState();
}

class _CreateImageBodyState extends State<CreateImageBody> {
  @override
  void initState() {
    // TODO: implement initState
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
    for (var i = 0; i < l; i++) {
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
    var osn, img;

    stp(os, im) async {
      var url = 'http://$ip/cgi-bin/createimage.py?osn=$os&im=$im';
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
        output = '${foo}';
        load = false;
      });
      toast('$os Image has been created');
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
                onChanged: (value) {
                  osn = value;
                },
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Os name',
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
              child: TextFormField(
                onChanged: (value) {
                  img = value;
                },
                onFieldSubmitted: (value) {
                  stp(osn, img);
                },
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'image name:version',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                stp(osn, img);
              },
              color: Colors.lightBlue,
              child: Text("Create"),
              elevation: 10,
            ),
            Center(
              child: Text(
                'Launched Container',
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

// TODO Download Image

class DownloadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Download Image"),
      ),
      body: DownloadImageBody(),
    );
  }
}

class DownloadImageBody extends StatefulWidget {
  @override
  _DownloadImageBody createState() => _DownloadImageBody();
}

class _DownloadImageBody extends State<DownloadImageBody> {
  var call = false;

  @override
  Widget build(BuildContext context) {
    var output;
    var img, ver;

    download(im, v) async {
      var url = 'http://$ip/cgi-bin/download_Image.py?img=$im&ver=$v';
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
        output = '${foo}';
        call = false;
      });
      if (status == 0) {
        toast('$im Image has been downloaded');
      } else {
        toast("$output");
      }
      //Navigator.pushNamed(context, "/stop");
    }

    return ModalProgressHUD(
      inAsyncCall: call,
      child: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextFormField(
                onChanged: (value) {
                  img = value;
                },
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'image name',
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
              child: TextFormField(
                onChanged: (value) {
                  ver = value;
                },
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'version',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                download(img, ver);
              },
              color: Colors.lightBlue,
              child: Text("Download"),
              elevation: 10,
            ),
            RaisedButton(
              onPressed: () async {
                const url = 'https://hub.docker.com';
                await launch(url);
              },
              color: Colors.lightBlue,
              child: Container(
                width: 140,
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text("Look for Images"),
                  ],
                ),
              ),
              elevation: 10,
            ),
          ],
        ),
      ),
    );
  }
}

// TODO Remove Image

class RemoveImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Remove Image"),
      ),
      body: RemoveImageBody(),
    );
  }
}

class RemoveImageBody extends StatefulWidget {
  @override
  _RemoveImageBody createState() => _RemoveImageBody();
}

class _RemoveImageBody extends State<RemoveImageBody> {
  var call = false, output;

  @override
  Widget build(BuildContext context) {
    var imgVer;

    remove(im) async {
      var url = 'http://$ip/cgi-bin/remove_image.py?img=$im';
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
        output = '${foo}';
        call = false;
      });
      if (status == 0) {
        toast('$im Image has been removed');
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
                onChanged: (value) => imgVer = value,
                onFieldSubmitted: (value) {
                  remove(imgVer);
                },
                scrollPadding: EdgeInsets.all(20),
                autocorrect: false,
                autofocus: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'image name:version',
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                remove(imgVer);
              },
              color: Colors.lightBlue,
              child: Text("Remove"),
              elevation: 10,
            ),
          ],
        ),
      ),
    );
  }
}

// TODO Push Image

class PushImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Image"),
      ),
      body: PushImageBody(),
    );
  }
}

class PushImageBody extends StatefulWidget {
  @override
  _PushImageBodyState createState() => _PushImageBodyState();
}

class _PushImageBodyState extends State<PushImageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(
              top: 13,
              left: 10,
              right: 10,
              bottom: 15,
            ),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'image name:version',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => print("created"),
            color: Colors.lightBlue,
            child: Text("Push"),
            elevation: 10,
          ),
        ],
      ),
    );
  }
}
