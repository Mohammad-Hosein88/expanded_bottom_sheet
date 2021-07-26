library scrollable_bottom_sheet;

import 'package:expanded_bottom_sheet/BottomSheetCustomPersistentHeader.dart';
import 'package:expanded_bottom_sheet/ScrollableBottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableBottomSheetWidget extends StatefulWidget {
  ScrollableBottomSheetWidget(
      {Key? key, required this.body, required this.header, required this.width})
      : super(key: key);

  final Widget header;
  final Widget body;
  final double width;

  @override
  _ScrollableBottomSheetWidgetState createState() =>
      _ScrollableBottomSheetWidgetState();
}

class _ScrollableBottomSheetWidgetState
    extends State<ScrollableBottomSheetWidget> {
  ValueNotifier<double> _topRadius = ValueNotifier(25);
  double _scrollLastExtent = 0.0;

  @override
  void initState() {
    _topRadius = ValueNotifier(widget.width * 0.07);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DraggableScrollableSheet(
      minChildSize: 0.001,
      maxChildSize: 1.0,
      initialChildSize: 0.6,
      builder: (context, scrollController) {
        return ValueListenableBuilder(
          child: widget.body,
          valueListenable: _topRadius,
          builder: (context, double radius, child) {
            return Container(
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (scrollData) {
                  // CHECKING IF THE SCROLL VIEW IS IN THE CERTAIN POINT TO CHANGE THE RADIUS FOR SMOOTH ANIMATED-LIKE CHANGE
                  if (scrollData.extent > 0.95 && scrollData.extent <= 1.0) {
                    if ((scrollData.extent - _scrollLastExtent) > 0.0) {
                      _topRadius.value -= 2;
                    } else {
                      if (radius < width * 0.07) {
                        _topRadius.value += 2;
                      }
                    }
                  }

                  // CHECKING IF THE SCROLL VIEW IS BEING SCROLLED FAST SO IT WILL CHANGE SHAPE SUDDENLY
                  if (scrollData.extent <= 0.95) {
                    _topRadius.value = width * 0.07;
                  }
                  _scrollLastExtent = scrollData.extent;
                  return true;
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollData) {
                    if (scrollData.metrics.pixels > 0.0) {
                      _topRadius.value = 0.0;
                    }

                    // WHEN RELEASED IT GOES DOWN
                    if (scrollData is ScrollEndNotification) {
                      if (scrollData.metrics.viewportDimension < 350) {
                        ScrollableBottomSheet().closeBottomSheet();
                      }
                    } else if (scrollData is ScrollNotification) {
                      if (scrollData.metrics.viewportDimension < 0) {
                        ScrollableBottomSheet().closeBottomSheet();
                      }
                    }
                    return true;
                  },
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: BottomSheetCustomPersistentHeader(
                          borderRadius: radius,
                          headerWidget: widget.header,
                        ),
                      ),
                      child!
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
