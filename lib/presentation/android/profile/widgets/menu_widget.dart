import 'package:flutter/material.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/lists/menu_item_widget.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/texts/title_widget.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          TitleWidget(
            title: "Perangkat",
          ),
          const SizedBox(height: 10),
          MenuItemWidget(
            text: "Beli Perangkat",
            icon: Icons.shopping_cart,
          ),
          const Divider(),
          const SizedBox(height: 10),
          TitleWidget(
            title: "Bantuan",
          ),
          const SizedBox(height: 10),
          MenuItemWidget(
            text: "Panduan",
            icon: Icons.help,
          ),
          const SizedBox(height: 10),
          const Divider(),
          TitleWidget(
            title: "Akun",
          ),
          const SizedBox(height: 10),
          MenuItemWidget(
            text: "Atur Profil",
            icon: Icons.edit,
          ),
          const Divider(),
          MenuItemWidget(
            text: "Keluar",
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}