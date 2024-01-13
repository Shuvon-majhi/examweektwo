import 'package:examweektwo/alertDialog.dart';
import 'package:examweektwo/AppBar.dart';
import 'package:examweektwo/checkOut.dart';
import 'package:examweektwo/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // count total sum here
  int get totalAmount {
    return Data.fold<int>(0,
        (total, product) => total + product['Price'] * product['count'] as int);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        title: appbar(),
      ),

      // Body

      body: Padding(
        padding: const EdgeInsets.only(right: 14, left: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Bag Part
            Text(
              "My Bag",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // end My Bag Part

            //list view part
            Expanded(
              child: ListView.separated(
                //shrinkWrap: true,
                itemCount: Data.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Row(
                      children: [
                        // Image
                        Image.asset(
                          Data[index]['path']!,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              // Name
                              Text(
                                Data[index]['name']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // size colors row
                              Row(
                                children: [
                                  // Colors
                                  Text(
                                    'Color : ' + Data[index]['color']!,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  // Size
                                  Text(
                                    'Size : ' + Data[index]['Size']!,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // remove oparetion
                                  IconButton(
                                    onPressed: () {
                                      if (Data[index]['count'] > 1) {
                                        setState(() {
                                          Data[index]['count']--;
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  // count value
                                  Text(Data[index]['count'].toString()),

                                  // adding Oparetion
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Data[index]['count']++;
                                      });
                                      if (Data[index]['count'] == 5) {
                                        // Dialog box
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return alertDialog(
                                              item: Data[index]['name'],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // more icon and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                //TODO: do some action here
                              },
                              icon: Icon(Icons.more_vert),
                            ),
                            // single amount price
                            Text('\$' +'${Data[index]['Price'] * Data[index]['count']}'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ),
            ),

            // total Amount
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // total amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$totalAmount\$'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //check Out button
                  checkOut(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
