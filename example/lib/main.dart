import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gt_verify/gt_verify.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();

  }

  _preGetToken() async {
    var res = await GtVerify.preGetToken();
    debugPrint('$res');
  }

  _oneTapLogin() async {

  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GtVerify.startWithAppId('appId');
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      var map = await GtVerify.preGetToken();
      debugPrint('${map}');
    } on PlatformException {
      debugPrint('preGetToken failure');
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: Column(
            children: [
              RaisedButton(
                child: Text('preGetToken'),
                onPressed: (){
                   _preGetToken();
                },
              ),
              RaisedButton(
                child: Text('oneTapLogin'),
                onPressed: (){
                  _oneTapLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
