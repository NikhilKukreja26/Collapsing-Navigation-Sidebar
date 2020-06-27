import 'package:flutter/material.dart';
import 'theme.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: drawerBackgroundColor,
      ),
    );
  }
}
