import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View All"),
      ),
      body: ListView(
        children: [
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'createImage'),
            child: Card(
              child: ListTile(
                title: Text("Create image"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'createNetwork'),
            child: Card(
              child: ListTile(
                title: Text("Create Network"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'createVolume'),
            child: Card(
              child: ListTile(
                title: Text("Create Volume"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'downloadImage'),
            child: Card(
              child: ListTile(
                title: Text("Download Image"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'exposeContainer'),
            child: Card(
              child: ListTile(
                title: Text("Expose Container"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'imageList'),
            child: Card(
              child: ListTile(
                title: Text("Image List"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'launchContainer'),
            child: Card(
              child: ListTile(
                title: Text("Launch Container"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'pushImage'),
            child: Card(
              child: ListTile(
                title: Text("Push Image"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'removeAllContainer'),
            child: Card(
              child: ListTile(
                title: Text("Remove All Container"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'removeImage'),
            child: Card(
              child: ListTile(
                title: Text("Remove Image"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'removeContainer'),
            child: Card(
              child: ListTile(
                title: Text("Remove Container"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'running'),
            child: Card(
              child: ListTile(
                title: Text("Running Container"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'startContainer'),
            child: Card(
              child: ListTile(
                title: Text("Start Container"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'stopContainer'),
            child: Card(
              child: ListTile(
                title: Text("Stop Container"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'showNet'),
            child: Card(
              child: ListTile(
                title: Text("Show Network"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'showVol'),
            child: Card(
              child: ListTile(
                title: Text("Show Volume"),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'terminal'),
            child: Card(
              child: ListTile(
                title: Text("Terminal Mode"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
