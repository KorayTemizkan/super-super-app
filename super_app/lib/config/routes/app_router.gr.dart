// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:super_app/config/routes/bottom_bar.dart' as _i3;
import 'package:super_app/core/pages/explore_page.dart' as _i1;
import 'package:super_app/features/visit/presentation/pages/visit_page.dart' as _i4;
import 'package:super_app/features/feed/presentation/pages/feed_page.dart'
    as _i2;

/// generated route for
/// [_i1.ExplorePage]
class ExploreRoute extends _i5.PageRouteInfo<void> {
  const ExploreRoute({List<_i5.PageRouteInfo>? children})
    : super(ExploreRoute.name, initialChildren: children);

  static const String name = 'ExploreRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.ExplorePage();
    },
  );
}

/// generated route for
/// [_i2.FeedPage]
class FeedRoute extends _i5.PageRouteInfo<void> {
  const FeedRoute({List<_i5.PageRouteInfo>? children})
    : super(FeedRoute.name, initialChildren: children);

  static const String name = 'FeedRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.FeedPage();
    },
  );
}

/// generated route for
/// [_i3.MyBottomBar]
class MyBottomBar extends _i5.PageRouteInfo<void> {
  const MyBottomBar({List<_i5.PageRouteInfo>? children})
    : super(MyBottomBar.name, initialChildren: children);

  static const String name = 'MyBottomBar';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.MyBottomBar();
    },
  );
}

/// generated route for
/// [_i4.VisitPage]
class VisitRoute extends _i5.PageRouteInfo<void> {
  const VisitRoute({List<_i5.PageRouteInfo>? children})
    : super(VisitRoute.name, initialChildren: children);

  static const String name = 'VisitRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.VisitPage();
    },
  );
}
