import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:easy_sms_receiver/easy_sms_receiver.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




// This should be declared after Supabase initialization
late final SupabaseClient supabase;


void _handleSms(String? body, String? sender) async {
  if (body == null || sender == null) return;

  try {
    await supabase.from('sms_messages').insert({
      'sender': sender,
      'body': body,
    });
    print('SMS inserted into database');

  } catch (e) {
    print('Error inserting SMS: $e');
  }
}



// This function should be a method in _SmsReaderState
// void listenForSms() {
//   _smsReceiver.listenIncomingSms(
//     onNewMessage: (SmsMessage message) {
//       _handleSms(message.body, message.address);
//     },
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ozzjwehlykmiufunkneq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im96emp3ZWhseWttaXVmdW5rbmVxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg5NDc2MTgsImV4cCI6MjA1NDUyMzYxOH0.1b9Qw6O5xFJ9L7p2XeSRc0iTDihP-2EuJsmA-3nnfnc',
  );

  // Initialize the supabase client
  supabase = Supabase.instance.client;

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
        // Call _handleSms to insert the message into Supabase
        _handleSms(message.body, message.address);
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
