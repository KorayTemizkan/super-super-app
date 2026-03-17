import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('AppBar'), backgroundColor: Colors.blue);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
