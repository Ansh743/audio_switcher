import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_audio_manager/flutter_audio_manager.dart';
import 'package:incoming_call_event/incoming_call_event.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Switcher',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription streamSubscription;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Example'),
      ),
      body: new Padding(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text('A:'),
            new FlatButton(
                onPressed: () {
                  setState(() {
                    print('refresh');
                  });
                },
                child: Text('Refresh'))
          ],
        ),
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    streamSubscription = incomingCallEvent.listen((IncomingCallEvent event) {
      print('Call is Incoming or Connected' + event.stateC);
      //event.stateC has values "true" or "false"
    });
  }
}
