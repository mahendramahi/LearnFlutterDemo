import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final appTitle = 'DrawerDemo';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: OrientationList(
        title: appTitle,
      )
    );
  }
}


/*
* @Mahendra
* OrientationList Class
* */

class OrientationList extends StatelessWidget {
  final String title;

  OrientationList({ Key key, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              // Create a grid with 2 columns in portrait mode, or 3 columns in
              // landscape mode.
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(100, (index) {
                return Center(
                  child: Text('Item $index',
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              }),
            );
          }),
    );
  }

}




/*
* @mahendra
* create SnackBar
* */

class SnackBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('yay ! A SnackBar'),
              action: SnackBarAction(
                label: 'undo',
                onPressed: () {
                  // Some code to undo the change!
                },
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        child: Text('Show Snackbar'),
      ),
    );
  }
}





/*
* Set Drawer And Create two menu and Click Listner on theme
* */

class MyHomePage extends StatelessWidget {
    final String title;

    MyHomePage({ Key key, this.title }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('title 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
