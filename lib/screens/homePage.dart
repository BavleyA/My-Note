import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/bloc/homePageLogic.dart';
import 'package:my_note/bloc/homePageState.dart';
import 'package:my_note/screens/addCustomer.dart';
import 'package:my_note/screens/customer.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homePageLogic()..getcustomers(),
      child: BlocConsumer<homePageLogic, homePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          homePageLogic obj = BlocProvider.of(context);
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('The Note', style: TextStyle(fontSize: 25)),
                  backgroundColor: Colors.blueAccent,
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: 'My notes',
                      ),
                      Tab(
                        text: 'My profile',
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Scaffold(
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) {
                            return customer();
                          })).then((context) => obj.getcustomers());
                        },
                      ),
                      body: ListView(
                        children: [
                          for (int i = 0; i < obj.customers.length; i++)
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(obj.customers[i]['name'],
                                            style: TextStyle(fontSize: 20))),
                                    if (obj.customers[i]['transactions']
                                    ['lastBalance'] >=
                                        0) ...[
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                            'Owes him : ${obj.customers[i]['transactions']['lastBalance']}'),
                                      )
                                    ] else ...[
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                            'Owes you : ${0 - obj.customers[i]['transactions']['lastBalance']}'),
                                      )
                                    ],
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (c) {
                                              return customerDetails(
                                                  obj.customers[i]['id']);
                                            })).then(
                                                (context) => obj.getcustomers());
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ),
                                      shape: CircleBorder(),
                                      color: Colors.blueAccent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Scaffold(
                      body: Container(
                        child: ListView(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'You have money from others = ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          obj.t1.toString() + ' EGP',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'you owe to others = ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          obj.t2.toString() + ' EGP',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Number of customers = ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          obj.n.toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Number of customers who owe you = ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          obj.n1.toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Number of customers you owe = ',
                                          style: TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          obj.n2.toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
