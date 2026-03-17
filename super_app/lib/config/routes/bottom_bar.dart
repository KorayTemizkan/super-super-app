import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:super_app/config/routes/app_router.gr.dart';

@RoutePage()
class MyBottomBar extends StatelessWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FeedRoute(),
        ExploreRoute(),
        ProfileRoute(),
      ],

      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.one_k), label: '1'),
            BottomNavigationBarItem(icon: Icon(Icons.two_k), label: '2'),
            BottomNavigationBarItem(icon: Icon(Icons.three_k), label: '3'),
          ]
          );
      },
    );
  }
}