import 'dart:collection';

import 'package:j_wallet/model/notification_model.dart';

class NotificationList{
  static final List<NotificationModel>_list=[
   NotificationModel(time: '4:20',transfer: '120 Sol', date: '27/3/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '1200 J', date: '5/10/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '120 Sol', date: '27/3/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '1200 J', date: '5/10/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '120 Sol', date: '27/3/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '1200 J', date: '5/10/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '120 Sol', date: '27/3/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '1200 J', date: '5/10/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '120 Sol', date: '27/3/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
   NotificationModel(time: '4:20',transfer: '1200 J', date: '5/10/2023', from: '0xd401F8d74736142FCc4507B255E8Ebb9A7463875'),
  ];
  static int get dataLength => _list.length;

  static NotificationModel getNotification(int index) => _list.elementAt(index);

  static UnmodifiableListView<NotificationModel> get dataList =>
      UnmodifiableListView(_list);
}