import 'package:flutter/material.dart';


class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Offline'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Offline',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.signal_wifi_off,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
