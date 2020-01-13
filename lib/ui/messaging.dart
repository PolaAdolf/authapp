 import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class Messaging {
  static final Client client = Client();
  static const String serverKey =
      'AAAAMF2P81Y:APA91bF2YnaXiOWZVtFFlMbnO1SE9qtBG7c6vopK7CuIof8oMFuM_uoxwJUMiJ2nhQV3AXmjjdwjOllGITV5GautjIVIICqnWLmAfsQgsxYSYK_aBzE6oft2RHWmwYGrV-y8cTMWxaqY';

  static Future<Response> sendToAll({
    @required String title,
    @required String body,
  }) =>
      sendToTopic(title: title, body: body, topic: 'c1vO4RXmDRU:APA91bGA5T6hR3nUTyJyA09MJaURvU5__u5XanVUwOyyG7i9Xx4UyxV1klLKcLXrCSY7yQnj4R5ktP6TB8x7sHghePNExU812QTU1HgQzdpyZlCx40DUvW6xstc5--TRli1-i6vyNhrK');

  static Future<Response> sendToTopic(
          {@required String title,
          @required String body,
          @required String topic}) =>
      sendTo(title: title, body: body, fcmToken: topic);

  static Future<Response> sendTo({
    @required String title,
    @required String body,
    @required String fcmToken,
  }) =>
      client.post(
        'https://fcm.googleapis.com/fcm/send',
        body: json.encode({
          'notification': {'body': '$body', 'title': '$title'},
          'priority': 'high',
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done',
          },
          'to': 'c1vO4RXmDRU:APA91bGA5T6hR3nUTyJyA09MJaURvU5__u5XanVUwOyyG7i9Xx4UyxV1klLKcLXrCSY7yQnj4R5ktP6TB8x7sHghePNExU812QTU1HgQzdpyZlCx40DUvW6xstc5--TRli1-i6vyNhrK',
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
      );
}
