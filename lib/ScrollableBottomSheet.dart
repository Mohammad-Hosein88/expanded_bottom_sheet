import 'package:expanded_bottom_sheet/ScrollableBottomSheetWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollableBottomSheet {
  static final ScrollableBottomSheet _bottomSheetState =
      ScrollableBottomSheet._();

  factory ScrollableBottomSheet() {
    return _bottomSheetState;
  }

  ScrollableBottomSheet._();

  final ValueNotifier<Color> _bottomSheetBackgroundColor =
      ValueNotifier<Color>(Colors.black.withOpacity(0.4));
  PersistentBottomSheetController? _bottomSheetController;
  bool isBottomSheetClosed = false;


  void closeBottomSheet() {
    _bottomSheetBackgroundColor.value = Colors.transparent;
    _bottomSheetController!.close();
  }

  void openBottomSheet(BuildContext context,
      {required Widget bodyWidget, required Widget headerWidget, double headerHeight = 80.0, Color backgroundColor = Colors.black, double backgroundOpacity = 0.4, bool headerIsPinned = true, bool hasRadius = true}) {
    Future.delayed(Duration(milliseconds: 500), () {
      _bottomSheetBackgroundColor.value =
          backgroundColor.withOpacity(backgroundOpacity);
    });
    
    _bottomSheetController =
        Scaffold.of(context).showBottomSheet((context) => GestureDetector(
              onTap: () {
                _bottomSheetBackgroundColor.value = Colors.transparent;
                _bottomSheetController!.close();
              },
              child: ValueListenableBuilder(
                valueListenable: _bottomSheetBackgroundColor,
                builder: (context, Color? value, child) => GestureDetector(
                  onVerticalDragUpdate: (DragUpdateDetails details){
                    // TO PREVENT IT FROM SCROLLING DOWN
                  },
                  onTap: (){
                    closeBottomSheet();
                  },
                  child: Container(
                      color: value,
                      child: GestureDetector(
                          onTap: () {},
                          child: ScrollableBottomSheetWidget(
                            headerIsPersistent: true,
                            body: bodyWidget,
                            header: headerWidget,
                            headerHeight: headerHeight,
                            hasRadius: hasRadius,
                            width: MediaQuery.of(context).size.width,
                          )
                      )
                  ),
                ),
              ),
            )
        );
  }
}
