import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/bloc/customerDetailsLogic.dart';
import 'package:my_note/bloc/customerDetailsState.dart';
import 'package:my_note/screens/editCustomer.dart';
import 'package:my_note/screens/newOperation.dart';
import '../bloc/customerDetailsState.dart';
import '../main.dart';

class customerDetails extends StatelessWidget {
  int id;

  customerDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => customerDetailsLogic()..getccustomer(id),
      child: BlocConsumer<customerDetailsLogic, customerDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          customerDetailsLogic obj = BlocProvider.of(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.add,
                size: 40,
              ),
              onPressed: () {
                int x = 0;
                for (int i = 0; i < c.length; i++) {
                  if (c[i]['name'] == obj.C['name']) {
                    x = i;
                  }
                }
                Navigator.of(context).push(MaterialPageRoute(builder: (c) {
                  return newOperation(obj.C);
                })).then((context) => obj.getoldop(x));
              },
            ),
            appBar: AppBar(
              title: Text(
                obj.C['name'],
                style: TextStyle(fontSize: 25),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    int x = 0;
                    for (int i = 0; i < c.length; i++) {
                      if (c[i]['name'] == obj.C['name']) {
                        x = i;
                      }
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (c) {
                      return editCustomer(obj.C);
                    })).then((value) => obj.getccustomer(id));
                  },
                ),
              ],
            ),
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
                                'Name : ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                obj.C['name'],
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
                                'Phone Number : ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                obj.C['number'],
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
                                'Address : ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                obj.C['address'],
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
                                'Number of operations : ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                obj.C['transactions']['oldTrx'].length.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                if (obj.C['transactions']['lastBalance'] >=
                                    0) ...[
                                  Row(
                                    children: [
                                      Text(
                                        'Owes him : ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        obj.C['transactions']['lastBalance'].toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ] else ...[
                                  Row(
                                    children: [
                                      Text(
                                        'Owes you : ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        (0-obj.C['transactions']['lastBalance']).toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Table(
                            border: TableBorder(
                                horizontalInside: BorderSide(
                                    width: 1, style: BorderStyle.solid)),
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(3),
                              3: FlexColumnWidth(2),
                              4: FlexColumnWidth(2.2),
                            },
                            children: [
                              TableRow(children: [
                                Text(
                                  "Balance",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Op",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Details",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Time",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                              for (int i = 0;
                              i < obj.C['transactions']['oldTrx'].length;
                              i++)
                                TableRow(children: [
                                  Text(
                                    obj.C['transactions']['oldTrx'][i]['balance']
                                        .toString(),
                                    style: TextStyle(fontSize: 18.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  if(obj.C['transactions']['oldTrx'][i]['op'] == '+')...[
                                    Text(
                                      obj.C['transactions']['oldTrx'][i]['op'],
                                      style: TextStyle(
                                          fontSize: 23.0, color: Colors.green),
                                      textAlign: TextAlign.center,
                                    ),
                                  ]else...[
                                    Text(
                                      obj.C['transactions']['oldTrx'][i]['op'],
                                      style: TextStyle(
                                          fontSize: 30.0, color: Colors.red),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                  Text(
                                    obj.C['transactions']['oldTrx'][i]['details'],
                                    style: TextStyle(fontSize: 18.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    obj.C['transactions']['oldTrx'][i]['amount']
                                        .toString(),
                                    style: TextStyle(fontSize: 18.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    obj.C['transactions']['oldTrx'][i]['time'],
                                    style: TextStyle(fontSize: 18.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
