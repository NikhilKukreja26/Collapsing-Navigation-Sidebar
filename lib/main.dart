import 'package:flutter/material.dart';

import './common/collapsing_navigation_drawer.dart';
import './theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collapsible Navigation Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Collapsing Navigation Drawer/Sidebar'),
          backgroundColor: drawerBackgroundColor,
          elevation: 0.0,
        ),
        // drawer: CollapsingNavigationDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              color: selectedColor,
            ),
            CollapsingNavigationDrawer(),
          ],
        ),
      ),
    );
  }
}
