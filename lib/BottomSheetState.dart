import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_bottom_sheet/scrollable_bottom_sheet.dart';

class ScrollableBottomSheet{

  static final ScrollableBottomSheet _bottomSheetState = ScrollableBottomSheet._();

  factory ScrollableBottomSheet(){
    return _bottomSheetState;
  }

  ScrollableBottomSheet._();

  Widget? _bodyWidget;
  Widget? _headerWidget;
  PersistentBottomSheetController? _bottomSheetController;
  final ValueNotifier<Color> _bottomSheetBackgroundColor = ValueNotifier<Color>(Colors.black.withOpacity(0.4));

  set centerWidget(Widget newWidget){
    _bodyWidget = newWidget;
  }

  set headerWidget(Widget newWidget){
    _headerWidget = newWidget;
  }

  void closeBottomSheet(){
    _bottomSheetBackgroundColor.value = Colors.transparent;
    _bottomSheetController!.close();
  }

  void openBottomSheet(BuildContext context,{Color backgroundColor = Colors.black, double backgroundOpacity = 0.4}){
    Future.delayed(Duration(milliseconds: 500), (){
      _bottomSheetBackgroundColor.value = backgroundColor.withOpacity(backgroundOpacity);
    });
    _bottomSheetController = Scaffold.of(context).showBottomSheet((context) => GestureDetector(
      onTap: (){
        _bottomSheetBackgroundColor.value = Colors.transparent;
        _bottomSheetController!.close();
      },
      child: ValueListenableBuilder(
        valueListenable: _bottomSheetBackgroundColor,
        builder: (context, Color? value, child) => Container(color: value, child: GestureDetector(
            onTap: (){
              print("gesture");
            },
            child: ScrollableBottomSheetWidget(
              body: _bodyWidget!,
              header: _headerWidget!,
            ))),
      ),
    ));
  }

}