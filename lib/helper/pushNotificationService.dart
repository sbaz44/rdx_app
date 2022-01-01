import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebasePushNotificationService {
  // late FirebaseMessaging _fcm;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initialize() async {
    initializeNotification();
    print("FCM INITIALIZED");
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showNotification(event.notification!.body, event.notification!.title);
    });
    // if (Platform.isIOS) {
    //   _fcm.requestNotificationPermissions(IosNotificationSettings());
    // }
    // _fcm.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     showNotification(message);
    //     print("onMessage: $message");
    //     print(message);
    //     print("CALLING NOT");

    //     // _showItemDialog(message);
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     showNotification(message);
    //     print("onLaunch: $message");
    //     print('onLaunch called');
    //     print(message);

    //     // _navigateToItemDetail(message);
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     showNotification(message);
    //     print("onResume: $message");
    //     print(message);

    //     // _navigateToItemDetail(message);
    //   },
    // );
  }

  void initializeNotification() async {
    try {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      var initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      var initializationSettingsIOS = IOSInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
        // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        // onSelectNotification: didSelectNotification
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //  Future<dynamic> onDidReceiveLocalNotification(int, String?, String?, String?) async {
  //   //Handle notification tapped logic here
  // }

  showNotification(body, title) async {
    print(title);
    print(body);
    // var scheduledNotificationDateTime =
    //     DateTime.now().add(Duration(seconds: 4));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: 'app_icon',
      priority: Priority.high,
      importance: Importance.max,
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics,
        payload: 'Welcome to the Local Notification demo');
  }
}
