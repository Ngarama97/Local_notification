import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic tests',
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Public,
        channelShowBadge: true,
        enableVibration: true,
        enableLights: true,
        defaultColor: Colors.redAccent,
        icon: 'resource://drawable/res_naruto',
        playSound: true,
        soundSource: 'resource://raw/naruto_jutsu',
      ),
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  scheduledNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Kuza Business',
        body: 'Simple Notification',
        bigPicture:
            "https://images.unsplash.com/photo-1695504236952-37306fc71896?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3387&q=80",
        notificationLayout: NotificationLayout.BigPicture,
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(const Duration(minutes: 1)),
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: scheduledNotification,
            child: const Text("Scheduled Notification"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Unscheduled Notification'),
          ),
        ],
      ),
    );
  }
}
