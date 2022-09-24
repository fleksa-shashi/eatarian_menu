// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eaterian_menu/model/menu4.dart';

import 'package:eaterian_menu/repo/menurepo.dart';

import 'package:flutter/material.dart';

class MenuList1 extends StatefulWidget {
  const MenuList1({Key? key}) : super(key: key);

  @override
  State<MenuList1> createState() => _MenuList1State();
}

class _MenuList1State extends State<MenuList1> {
  late Future<Menu4> menuL;
  double totalPrice = 0;
  int lenght = 0;
  bool isclicked = false;
  List<String> indexList = [];

  int counter = 1;
  int? plusCost;
  @override
  void initState() {
    super.initState();
    menuL = getMenus();
  }

  // loadMenu() async {
  //   var gett = await getMenus();
  //   menuL = gett as List<Menu3>;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FutureBuilder<Menu4>(
            future: menuL,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data!.categories!.length,
                    itemBuilder: (context, categoryindex) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffFEFCE8),
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data!.categories![categoryindex]
                                    .nameJson!.english!,
                                style: style(),
                              ),
                            ),
                          ),
                          ListView.separated(
                              // scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              separatorBuilder: (context, index) => Divider(
                                    thickness: 1.2,
                                  ),
                              itemCount: snapshot.data!
                                  .categories![categoryindex].products!.length,
                              itemBuilder: (context, itemindex) {
                                // Row(
                                //   children: [
                                //     Container(
                                //       padding: EdgeInsets.all(10),
                                //       decoration: BoxDecoration(),
                                //       child: Text(
                                //         snapshot.data!.categories![categoryindex]
                                //             .nameJson!.german!,
                                //         style: TextStyle(fontSize: 15),
                                //       ),
                                //     ),                      ],
                                // );
                                var data = snapshot
                                    .data!
                                    .categories![categoryindex]
                                    .products![itemindex];
                                double price = data.price!;
                                String itemName = data.nameJson!.english!;
                                String itemDesc =
                                    data.descriptionJson!.english!;

                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  itemName,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  itemDesc,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  '€${price.toString()}',
                                                  style: style(),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isclicked = true;
                                                totalPrice = totalPrice + price;
                                                indexList.add(itemName);
                                              });
                                            },
                                            child: indexList.contains(itemName)
                                                ? Container(
                                                    height: 45,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffFFEE32),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: <Widget>[
                                                        GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (data.counter >
                                                                    1) {
                                                                  data.counter--;
                                                                  totalPrice =
                                                                      totalPrice -
                                                                          price;
                                                                } else if (data
                                                                        .counter ==
                                                                    1) {
                                                                  totalPrice =
                                                                      totalPrice -
                                                                          price;
                                                                  indexList.remove(
                                                                      itemName);
                                                                  indexList
                                                                          .isEmpty
                                                                      ? isclicked =
                                                                          false
                                                                      : isclicked =
                                                                          true;
                                                                }
                                                              });
                                                            },
                                                            child: Text(
                                                              '-',
                                                              style: style(),
                                                            )),
                                                        Text(
                                                          data.counter
                                                              .toString(),
                                                          style: style(),
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                data.counter++;
                                                                totalPrice =
                                                                    totalPrice +
                                                                        price;
                                                              });
                                                            },
                                                            child: Text(
                                                              '+',
                                                              style: style(),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    height: 45,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffFFEE32),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'ADD',
                                                        style: style(),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ListView.builder(
                                    //     shrinkWrap: true,
                                    //     itemCount: snapshot
                                    //         .data!
                                    //         .categories![categoryindex]
                                    //         .products![itemindex]
                                    //         .sideProductsJson!
                                    //         .length,
                                    //     itemBuilder:
                                    //         (context, sideproductsindex) {
                                    //       return Text(snapshot
                                    //           .data!
                                    //           .categories![categoryindex]
                                    //           .products![itemindex]
                                    //           .sideProductsJson![
                                    //               sideproductsindex]
                                    //           .nameJson!
                                    //           .english!);
                                    //     }),
                                  ],
                                );
                              }),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // // By default, show a loading spinner.
              return Center(child: const CircularProgressIndicator());
            },
          ),
          isclicked ? floatingTotalPrice(totalPrice.toString()) : SizedBox(),
        ],
      )),
    );
  }
}

Widget floatingTotalPrice(String totalMoney) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFFEE32),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.food_bank,
              size: 30,
            ),
            Text(
              'View order',
              style: style(),
            ),
            Text(
              '€$totalMoney',
              style: style(),
            ),
          ],
        ),
      ),
    ),
  );
}

TextStyle style() {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}



                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     // scrollDirection: Axis.horizontal,
                  //     itemCount: snapshot.data!.categories!.length,
                  //     itemBuilder: (context, index) {
                  //       lenght = snapshot.data!.categories!.length;
                  //       int choiceIndex = 0;
                  //       int optionsIndex = 1;

                  //       return Text(snapshot
                  //           .data!.categories![index].nameJson!.english!);
                  //     }),