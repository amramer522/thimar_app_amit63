import 'package:app/core/logic/helper_methods.dart';
import 'package:app/views/home/view.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../firebase_options.dart';



@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  AwesomeNotifications().getInitialNotificationAction().asStream().listen((event) {
    FirebaseHelper().notifyNow(
    message.data["title"],
      message.data["body"],
    );
  });

  AwesomeNotifications().createNotificationFromJsonData(message.data);
}



class FirebaseHelper {
  Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'my_channel',
            channelName: 'Normal notifications',
            importance: NotificationImportance.Max,
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
    );
  }

  void setListeners() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }

  Future<String?> getFCMToken() async {
    if (await checkPermission()) {
      String? token = await FirebaseMessaging.instance.getToken();
      print("FCM Token ----> $token");
      if (token == null) {
        showMessage("Something wrong while getting FCM Token");
        return null;
      }
      setListeners();
      return token;
    } else {
      return null;
    }
  }

  void checkAllowedNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        FirebaseMessaging.onMessage.listen(
          (event) {
            print(event.notification?.title);
            print(event.notification?.body);
            notifyNow(event.notification?.title ?? "",
                event.notification?.body ?? "");
          },
        );
        FirebaseMessaging.onMessageOpenedApp.listen(
          (event) {
            notifyNow(event.notification?.title ?? "",
                event.notification?.body ?? "");
          },
        );


      }
    });
  }

  Future<bool> checkPermission() async {
    var permission = await Permission.notification.request();
    print(permission);
    if (!permission.isGranted) {
      showModalBottomSheet(
        context: navigatorKey.currentContext!,
        builder: (context) => Container(
          width: double.infinity,
          child: Column(
            children: [
              Text("Please give me access"),
              ElevatedButton(
                onPressed: () async {
                  await openAppSettings();
                },
                child: Text("Allow"),
              )
            ],
          ),
        ),
      );
      return false;
    } else {
      checkAllowedNotification();
      return true;
    }
  }

  void notifyNow(String title, String body) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      channelKey: 'my_channel',
      actionType: ActionType.Default,
      title: title,
      body: body,
    ));
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
    print("onNotificationCreatedMethod");
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
    print("onNotificationDisplayedMethod");
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    print("onDismissActionReceivedMethod");
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    print("onActionReceivedMethod");
    navigateTo(HomeView());
    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    // MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/notification-page',
    //         (route) => (route.settings.name != '/notification-page') || route.isFirst,
    //     arguments: receivedAction);
  }
}
