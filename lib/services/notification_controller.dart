import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';

class NotificationController extends ChangeNotifier {
  //SINGLETON PATTERN
  static final NotificationController _instance =
      NotificationController._internal();

  factory NotificationController() {
    return _instance;
  }

  NotificationController._internal();

  // INITIALIZATION METHOD
  static Future<void> initializeLocalNotification({required bool debug}) async {
    await AwesomeNotifications().initialize(
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
      debug: debug,
    );
  }
}
