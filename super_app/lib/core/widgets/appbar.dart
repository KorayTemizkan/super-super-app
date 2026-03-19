import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('The Met', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), backgroundColor: Colors.red);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
