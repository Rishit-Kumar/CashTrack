import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:easy_sms_receiver/easy_sms_receiver.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SmsReader(),
    );
  }
}

class SmsReader extends StatefulWidget {
  @override
  _SmsReaderState createState() => _SmsReaderState();
}

class _SmsReaderState extends State<SmsReader> {
  final _smsReceiver = EasySmsReceiver.instance;
  String _lastSmsContent = 'No SMS received yet';

  @override
  void initState() {
    super.initState();
    _requestSmsPermission();
  }

  Future<void> _requestSmsPermission() async {
    var status = await Permission.sms.request();
    if (status.isGranted) {
      _startListeningSms();
    } else {
      setState(() {
        _lastSmsContent = 'SMS permission denied';
      });
    }
  }

  void _startListeningSms() {
    _smsReceiver.listenIncomingSms(
      onNewMessage: (message) {
        setState(() {
          _lastSmsContent = 'From: ${message.address}\nBody: ${message.body}';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SMS Reader')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(_lastSmsContent),
        ),
      ),
    );
  }
}
