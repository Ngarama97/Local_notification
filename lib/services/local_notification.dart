import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class LocalNotification {
  static scheduledNotification() {
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
      schedule: NotificationCalendar(
        weekday: 1,
        hour: 10,
        minute: 54,
        second: 0,
        repeats: true,
      ),
    );
  }

  static cancelNotification(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }
}
