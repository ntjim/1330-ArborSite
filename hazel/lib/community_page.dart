//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import './home.dart';
import './nav_bar.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(179, 180, 61, .1),
  100: Color.fromRGBO(179, 180, 61, .2),
  200: Color.fromRGBO(179, 180, 61, .3),
  300: Color.fromRGBO(179, 180, 61, .4),
  400: Color.fromRGBO(179, 180, 61, .5),
  500: Color.fromRGBO(179, 180, 61, .6),
  600: Color.fromRGBO(179, 180, 61, .7),
  700: Color.fromRGBO(179, 180, 61, .8),
  800: Color.fromRGBO(179, 180, 61, .9),
  900: Color.fromRGBO(179, 180, 61, 1),
};

MaterialColor navColor = MaterialColor(0xFFB3B43D, color);

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireDb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String? uid = auth.currentUser?.uid;
    User? currentUser = auth.currentUser;
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: navColor,
        ),
        home: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Image.asset('assets/Google@3x.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      //Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
              title: Text("Hazel", style: TextStyle(color: Colors.white)),
              actions: <Widget>[NavBar()],
            ),
            body: Center(
                child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      color: Colors.lime[50], //page background color
                    ),
                    // child: BarChart(BarChartData(
                    //     borderData: FlBorderData(
                    //         border: const Border(
                    //       top: BorderSide.none,
                    //       right: BorderSide.none,
                    //       left: BorderSide(width: 1),
                    //       bottom: BorderSide(width: 1),
                    //     )),
                    //     groupsSpace: 10,
                    //     barGroups: [
                    //       BarChartGroupData(x: 1, barRods: [
                    //         BarChartRodData(
                    //             fromY: 0, width: 15, color: Colors.amber, toY: 10),
                    //       ]),
                    //       BarChartGroupData(x: 2, barRods: [
                    //         BarChartRodData(
                    //             fromY: 0, width: 15, color: Colors.amber, toY: 9),
                    //       ]),
                    //       BarChartGroupData(x: 3, barRods: [
                    //         BarChartRodData(
                    //             fromY: 0, width: 15, color: Colors.amber, toY: 4),
                    //       ]),
                    //     ])),
                    child: ListView(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.teal[900], //box 2 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Your Impact",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),

                                    ////////Insert code here for graphs
                                    Container(
                                        padding: EdgeInsets.only(
                                          left: 150.0,
                                          right: 150.0,
                                          top: 5,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF)),
                                        child: AspectRatio(
                                            aspectRatio: 2,
                                            child: BarChart(BarChartData(
                                                borderData: FlBorderData(
                                                    border: const Border(
                                                  top: BorderSide.none,
                                                  right: BorderSide.none,
                                                  left: BorderSide(width: 1),
                                                  bottom: BorderSide(width: 1),
                                                )),
                                                groupsSpace: 10,
                                                barGroups: [
                                                  BarChartGroupData(
                                                      x: 1,
                                                      barRods: [
                                                        BarChartRodData(
                                                            fromY: 0,
                                                            width: 15,
                                                            color: Colors.amber,
                                                            toY: 10000),
                                                      ]),
                                                  BarChartGroupData(
                                                      x: 2,
                                                      barRods: [
                                                        BarChartRodData(
                                                            fromY: 0,
                                                            width: 15,
                                                            color: Colors.amber,
                                                            toY: 9000),
                                                      ]),
                                                  BarChartGroupData(
                                                      x: 3,
                                                      barRods: [
                                                        BarChartRodData(
                                                            fromY: 0,
                                                            width: 15,
                                                            color: Colors.amber,
                                                            toY: 4000),
                                                      ]),
                                                ])))),
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.blue[800], //box 3 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Community Impact",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    ////////Insert code here for graphs
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            height: 350.0,
                            width: 400.0,
                            color: Colors.transparent,
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 100.0, right: 100.0),
                                decoration: BoxDecoration(
                                    color: Colors.lime[900], //box 4 color
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.0, left: 15.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Projects You Support",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: 'Roboto')),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                    ),
                                    ////////Insert code here for graphs
                                  ],
                                ))))
                      ],
                    )))));
  }
}
