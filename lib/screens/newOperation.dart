import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_note/main.dart';

class newOperation extends StatelessWidget {
  TextEditingController amount = TextEditingController();
  TextEditingController des = TextEditingController();
  Map C = {};
  newOperation(this.C);
  String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String time = DateFormat("HH:mm").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('New opertation', style: TextStyle(fontSize: 25)),
      ),
      body: Container(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: des,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0), child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    for (int i = 0; i < c.length; i++) {
                      if (c[i]['name'] == C['name']) {
                        c[i]['transactions']['oldTrx'].insert(0,{
                          'op': '+',
                          'details': des.text,
                          'amount': double.parse(amount.text),
                          'time': date + time,
                          'balance': c[i]['transactions']['lastBalance'] + double.parse(amount.text),
                        });
                        c[i]['transactions']['lastBalance'] =c[i]['transactions']['lastBalance'] + double.parse(amount.text);
                      }
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('+', style: TextStyle(fontSize: 30),),
                ), MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    for (int i = 0; i < c.length; i++) {
                      if (c[i]['name'] == C['name']) {
                        c[i]['transactions']['oldTrx'].insert(0,{
                          'op': '-',
                          'details': des.text,
                          'amount': double.parse(amount.text),
                          'time': date + time,
                          'balance': c[i]['transactions']['lastBalance'] - double.parse(amount.text),
                        });
                        c[i]['transactions']['lastBalance'] =c[i]['transactions']['lastBalance'] - double.parse(amount.text);
                      }
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('-', style: TextStyle(fontSize: 30),),
                ),
                ],
              ), )

            ],
          )),
    );
  }
}
