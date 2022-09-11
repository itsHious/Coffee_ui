// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:ui_challenge/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  late TabController tabController;

  @override
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<dynamic> list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  // late  tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    setState(() {
      tabController = TabController(
        initialIndex: 0,
        length: 4,
        vsync: this,
      );
    });
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 23),
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 48, 48, 48),
                        ),
                        child: Icon(
                          Icons.widgets,
                          color: Colors.white54,
                          size: 14,
                        ),
                      ),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 48, 48, 48),
                          ),
                          child: GFImageOverlay(
                            height: 30,
                            width: 30,
                            shape: BoxShape.circle,
                            image: AssetImage('images/profile.jpg'),
                            boxFit: BoxFit.cover,
                          )
                          // Image.asset('images/profile.jpg',
                          //     fit: BoxFit.cover),
                          ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Find the best\ncoffee for you',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: GFSearchBar(
                    noItemsFoundWidget:
                        Lottie.asset('images/96528-search-not-found.zip'),
                    searchBoxInputDecoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white54,
                        ),
                        filled: true,
                        fillColor: Colors.white54.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 141, 19, 19),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        // isDense: true,
                        label: Text(
                          'Search',
                          style: TextStyle(color: Colors.white54),
                        )),
                    searchList: list,
                    searchQueryBuilder: (query, item) {
                      return list
                          .where((item) =>
                              item!.toLowerCase().contains(query.toLowerCase()))
                          .toList();
                    },
                    overlaySearchListItemBuilder: (item) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          item.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    },
                    onItemSelected: (item) {
                      setState(() {
                        print('$item');
                      });
                    },
                  ),
                ),
                DefaultTabController(
                  length: 5,
                  child: Container(
                    // color: Colors.white,
                    height: 400,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          indicator: DotIndicator(
                            color: Color.fromRGBO(207, 121, 64, 61),
                            distanceFromCenter: 16,
                            radius: 3,
                            paintingStyle: PaintingStyle.fill,
                          ),
                          tabs: [
                            Tab(
                              child: Text(
                                'Cappaccino',
                                style: TextStyle(
                                    color: Colors.white54.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Latte',
                                style: TextStyle(
                                    color: Colors.white54.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Expresso',
                                style: TextStyle(
                                    color: Colors.white54.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Flat Milk',
                                style: TextStyle(
                                    color: Colors.white54.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Flat Yoghurt',
                                style: TextStyle(
                                    color: Colors.white54.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 2,
                          child: TabBarView(
                            // controller: tabController,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '4.20',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper2.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '3.14',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  )),
                              // one
                              Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '4.20',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper2.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '3.14',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  )),
                              // two
                              Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '4.20',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper2.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '3.14',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  )),
                              // three

                              Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '4.20',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper2.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '3.14',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  )),
                              // four
                              Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '4.20',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Hero(
                                          tag: 'herotag',
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ViewCoffee()),
                                              );
                                            },
                                            child: Container(
                                              width: width / 2,
                                              height: 270,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white54
                                                    .withOpacity(0.2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'images/cupper2.jpeg',
                                                        height: 150,
                                                        // width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              top: 8),
                                                      child: Text(
                                                        'Capperccino',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'With Cow Milk',
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text: '¢ ',
                                                              style: TextStyle(
                                                                  fontSize: 19,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          207,
                                                                          121,
                                                                          64,
                                                                          61),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              children: const <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '3.14',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: Color
                                                                    .fromRGBO(
                                                                        207,
                                                                        121,
                                                                        64,
                                                                        61)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Special For You",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18, top: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'images/cupper.jpeg',
                                height: 150,
                                // width: width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 14.0, right: 14),
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      '5 Coffee beans you\n must try!',
                                      style: TextStyle(
                                          fontSize: 26, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "The coffee plant is incredibly diverse. It can take root in a series of different environments and develop unique characteristics....",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.7)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ],
        )),
        bottomNavigationBar: GFTabBar(
          indicatorColor: Color.fromRGBO(207, 121, 64, 61),
          tabBarColor: Color.fromARGB(255, 20, 20, 23).withOpacity(0.4),
          tabBarHeight: 50,
          length: 4,
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.white54.withOpacity(0.7),
              ),
            ),
            Tab(
              icon: Icon(Icons.shopping_bag_outlined,
                  color: Colors.white54.withOpacity(0.7)),
            ),
            Tab(
              icon:
                  Icon(Icons.favorite, color: Colors.white54.withOpacity(0.7)),
            ),
            Tab(
              icon: Icon(Icons.notifications_on,
                  color: Colors.white54.withOpacity(0.7)),
            ),
          ],
        ),
      ),
    );
  }
}
