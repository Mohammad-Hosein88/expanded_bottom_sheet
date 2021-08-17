import 'package:flutter/material.dart';

class BottomSheetCustomPersistentHeader extends SliverPersistentHeaderDelegate {
    BottomSheetCustomPersistentHeader(
      {required this.borderRadius, required this.headerWidget, required this.headerHeight});

  final Widget headerWidget;
  final double borderRadius;
  final double headerHeight;
  int _index = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      if (++_index > Colors.primaries.length - 1) _index = 0;

      return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 2, color: Colors.white))),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(borderRadius)),
          ),
          padding: EdgeInsets.only(right: 20, top: 15, bottom: 15, left: 10),
          height: constraints.maxHeight,
          child: headerWidget,
        ),
      );
    });
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

  @override
  double get maxExtent => (headerHeight + 0.002);

  @override
  double get minExtent => headerHeight;
}
