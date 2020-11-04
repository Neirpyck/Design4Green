import 'package:flutter/material.dart';
import './screens/Title.dart';
import 'screens/Cards.dart';
import 'screens/Paragraph.dart';
import 'package:algolia/algolia.dart';

class Application {
  static final Algolia algolia = Algolia.init(
    applicationId: 'F4E5YFM8PV',
    apiKey: 'f77475277758ad733f124b23fea7edcb',
  );
}

void main() async {
  Algolia algolia = Application.algolia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFR Search Page',
      home: MyHomePage(title: 'IFR Search Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeTitle(),
          RowCards(),
          Paragraph(),
        ],
      ),
    );
  }
}
