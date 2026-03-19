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
        VisitRoute(),
      ],

      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red), label: 'Feed'),
            BottomNavigationBarItem(icon: Icon(Icons.explore, color: Colors.red), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.museum, color: Colors.red), label: 'Visit'),
          ]
          );
      },
    );
  }
}