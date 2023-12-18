import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/notification/notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.cancel, color: Colors.red[300]),
            title: Text("Kolam Furina berada dalam kondisi tidak baik"),
            subtitle: Text("Parameter yang terdampak ph,tdo,tds"),
          );
        },
      ),
    );
  }
}