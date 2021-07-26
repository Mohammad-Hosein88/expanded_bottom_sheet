import 'package:expanded_bottom_sheet/ScrollableBottomSheet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  void initState() {
    super.initState();
    ScrollableBottomSheet().headerWidget = Container(child: Text("Header"));
    ScrollableBottomSheet().centerWidget = SliverList(delegate: SliverChildBuilderDelegate((context, index) => Container(color: Colors.red,alignment: Alignment.centerLeft, padding: EdgeInsets.symmetric(vertical: 10),child: Text("$index"),),childCount: 100));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomWidget(),
      ),
    );
  }
}


class CustomWidget extends StatelessWidget{

  void showBottomSheet(BuildContext context) {
    ScrollableBottomSheet().openBottomSheet(context,backgroundColor: Colors.black, backgroundOpacity: 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Text("Show Bottom Sheet"),
        onTap: (){
          showBottomSheet(context);
        },
      ),
    );
  }
}