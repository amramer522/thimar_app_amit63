part of "bloc.dart";

class NotificationsData {
  late final int unReadCount;
  late final List<NotificationModel> list;

  NotificationsData.fromJson(Map<String, dynamic> json) {
    unReadCount = json['unreadnotifications_count'] ?? 0;
    list =
        List.from(json['notifications'] ?? []).map((e) => NotificationModel.fromJson(e)).toList();
  }
}

class NotificationModel {
  late final String id,img, notifyType, title, body, time;
  late bool isRead;
  late final Order order;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]??"";
    img = json["image"]??"";
    title = json["title"]??"";
    body = json["body"]??"";
    time = json["created_at"]??"";
    isRead = json[""]??false;
    notifyType = json['notify_type']??"";
    order = Order.fromJson(json['order']??{});
  }
}

class Order {
  late final int orderId;
  late final int clientId;
  late final int driverId;
  late final String orderStatus;

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id']??0;
    clientId = json['client_id']??0;
    driverId = json['driver_id']??0;
    orderStatus = json['order_status']??"";
  }
}
