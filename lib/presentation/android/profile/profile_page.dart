import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/profile/profile_controller.dart';
import 'package:simodang_v2/presentation/android/profile/widgets/menu_widget.dart';
import 'package:simodang_v2/presentation/android/profile/widgets/profile_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/rounded_label_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          20, // left
          60, // top
          20, // right
          20, // bottom
        ),
        child: Column(
          children: [
            ProfileWidget(
              name: "Kaedehara Yoshinori Kaedehara Kazuha",
              email: "johndoe@email.com",
              phoneNum: "081234567890",
              image: "https://picsum.photos/200/300"
            ),
            const SizedBox(height: 20),
            RowLabelWidget(
              label: "Alamat",
              value: "Malang, Indonesia",
            ),
            const SizedBox(height: 15),
            RowLabelWidget(
              label: "No. HP",
              value: "081234567890",
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                RoundedLabel(
                  title: "Perangkat",
                  value: 5,
                ),
                SizedBox(width: 15),
                RoundedLabel(
                  title: "Master",
                  value: 5,
                ),
              ],
            ),
            const SizedBox(height: 20),
            MenuWidget(),
          ]
        ),
      )
    );
  }
}