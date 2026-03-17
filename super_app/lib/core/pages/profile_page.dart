import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:super_app/core/widgets/appbar.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(children: [SizedBox(height: 48), Text('profile')]),
    );
  }
}
