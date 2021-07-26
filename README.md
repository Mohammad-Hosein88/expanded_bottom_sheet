# scrollable_bottom_sheet

A scrollable bottom sheet with ability to be expanded and scroll more

## Example

| Short content           | 
|:-----------------------:
|![](example.gif)

## Install

```yaml
dependencies:
  scrollable_bottom_sheet: ^0.0.1
```

or

```shell
flutter pub add scrollable_bottom_sheet
```

## How to use

```dart
// FIRST INITIALIZE WIDGETS
BottomSheetWidget().centerWidget = MyBottomSheetWidget();
BottomSheetWidget().headerWidget = MyBottomSheetHeader();

// TO OPEN THE BOTTOM SHEET
BottomSheetWidget().openBottomSheet(context, backgroundColor: Colors.black, backgroundOpacity: 0.4);

// TO CLOSE THE BOTTOM SHEET
BottomSheetWidget().closeBottomSheet();
```