# scrollable_bottom_sheet

A scrollable bottom sheet with ability to be expanded and scroll more

## Example

![](example.gif)

## Install

```yaml
dependencies:
  scrollable_bottom_sheet: ^0.0.4
```

or

```shell
flutter pub add scrollable_bottom_sheet
```

##Arguments

| Arguments | Description |
| ------------- |:------------ |
| bodyWidget | Body of the widget which MUST be a SliverList |
| headerWidget | Header of the bottom sheet |
| headerHeight | To specify the height of the header widget |
| backgroundColor | Bottom sheet background color when the bottom sheet is up |
| backgroundOpacity | opacity of the bottom sheet background when the bottom sheet is up |
| headerIsPinned | Makes the header widget pinned to the top when the body widget is scrolled |
| hasRadius | Gives header a radius and when reaches top it becomes zero |

## How to use

```dart

// TO OPEN THE BOTTOM SHEET
BottomSheetWidget().openBottomSheet(context);

// TO CLOSE THE BOTTOM SHEET
BottomSheetWidget().closeBottomSheet();
```

# Note

** The centerWidget MUST be a SliverList otherwise it will give an error **

When the bottom sheet is up, the back button closes the bottom sheet

New customizing features are going to be added