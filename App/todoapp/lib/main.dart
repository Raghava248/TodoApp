import 'package:flutter/material.dart';
import 'package:todoapp/models/global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Todo app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            bottom: TabBar(
              labelColor: darkGreyColor,
              unselectedLabelColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              indicatorPadding: EdgeInsets.all(5.0),
              tabs: [
                Tab(icon: Icon(Icons.flight)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_car)),
              ],
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        body: Stack(children: <Widget>[
          TabBarView(
            children: [
              Container(
                color: darkGreyColor,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 50),
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Intray",
                  style: intrayTitleStyle,
                ),
                Container()
              ],
            ),
          ),
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(
                top: 120, left: MediaQuery.of(context).size.width * 0.5 - 40),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                size: 70,
                color: Colors.white,
              ),
              backgroundColor: redColor,
            ),
          )
        ]),
      ),
    );
  }
}
