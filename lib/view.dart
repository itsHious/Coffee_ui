// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ViewCoffee extends StatefulWidget {
  ViewCoffee({Key? key}) : super(key: key);

  @override
  State<ViewCoffee> createState() => _ViewCoffeeState();
}

class _ViewCoffeeState extends State<ViewCoffee> {
  @override
  bool btnone = true;
  bool btntwo = false;
  bool btnthree = false;
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 23),
        // appBar:
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 500,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: 'herotag',
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0)),
                            child: Image.asset(
                              'images/cupper2.jpeg',
                              height: 500,
                              // width: width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 18, top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 20, 20, 23),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 20,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 20, 20, 23),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            // top: 430,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0)),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              width: width,
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, right: 25, top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Cupertino',
                                            style: TextStyle(
                                                fontSize: 28,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('With Oat Milk',
                                            style: TextStyle(
                                              // fontSize: 28,
                                              color: Colors.white,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  207, 121, 64, 61),
                                            ),
                                            Text('4.5',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color.fromARGB(
                                                      255, 20, 20, 23),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              .0),
                                                      child: Icon(
                                                        Icons.coffee,
                                                        size: 15,
                                                        color: Color.fromRGBO(
                                                            207, 121, 64, 61),
                                                      ),
                                                    ),
                                                    Text('Coffee',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color.fromARGB(
                                                      255, 20, 20, 23),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              .0),
                                                      child: Icon(
                                                        Icons.local_drink,
                                                        size: 15,
                                                        color: Color.fromRGBO(
                                                            207, 121, 64, 61),
                                                      ),
                                                    ),
                                                    Text('Milk',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 120,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color.fromARGB(
                                                    255, 20, 20, 23),
                                              ),
                                              child: Center(
                                                child: Text('Meduim/Extra Foam',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 18, bottom: 5),
                child: Text('Description',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.7),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                    'A cappuccino is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam. Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.7),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 18, bottom: 5),
                child: Text('Size',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.7),
                    )),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFButton(
                        color: btnone
                            ? Color.fromRGBO(207, 121, 64, 61)
                            : Colors.black.withOpacity(0.6),
                        onPressed: () {
                          setState(() {
                            btnone = !btnone;
                            btntwo = false;
                            btnthree = false;
                          });
                        },
                        text: "S",
                        // color: Colors.black.withOpacity(0.6),
                        // shape: GFButtonShape.square,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFButton(
                        text: "M",
                        color: btntwo
                            ? Color.fromRGBO(207, 121, 64, 61)
                            : Colors.black.withOpacity(0.6),
                        onPressed: () {
                          setState(() {
                            btnone = false;
                            btntwo = !btntwo;
                            btnthree = false;
                          });
                        }, // shape: GFButtonShape.square,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFButton(
                        text: "L",
                        color: btnthree
                            ? Color.fromRGBO(207, 121, 64, 61)
                            : Colors.black.withOpacity(0.6),
                        onPressed: () {
                          setState(() {
                            btnone = false;
                            btntwo = false;
                            btnthree = !btnthree;
                          });
                        }, // shape: GFButtonShape.square,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text('Price',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.7),
                            )),
                        RichText(
                          text: TextSpan(
                            text: '¢ ',
                            style: TextStyle(
                                fontSize: 19,
                                color: Color.fromRGBO(207, 121, 64, 61),
                                fontWeight: FontWeight.bold),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '4.20',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                      flex: 2,
                      child: GFButton(
                        color: Color.fromRGBO(207, 121, 64, 61),
                        onPressed: () {},
                        text: "Buy Now",
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
