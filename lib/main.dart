import 'package:flutter/material.dart';

import 'TweenAnimation.dart';
import 'TweenAnimationBuilder.dart';
import 'TweenAnimationWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Tween'),
    Tab(text: 'AnimatedWidget'),
    Tab(text: 'AnimatedBuilder'),
  ];

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          tabs: myTabs,
          labelStyle: TextStyle(fontSize: 12),
          controller: tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          TweenAnimation(),
          TweenWidget(),
          TweenBuilderWidget(),
        ],
        controller: tabController,
      ),
    );
  }
}
