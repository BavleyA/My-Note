import 'package:flutter/material.dart';
import 'package:my_note/screens/customer.dart';
import '../main.dart';

class editCustomer extends StatelessWidget {
  late Map customer = {};

  editCustomer(this.customer);

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit customer',
            style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(10.0), child:
            TextField(
              autofocus: true,
              controller: name..text = customer['name'],
              decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.lightBlueAccent), //<-- SEE HERE
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.lightBlueAccent), //<-- SEE HERE
                  ),
                  labelText: 'Name', hintText: 'Enter the customer name'),
            ),),
            Padding(padding: EdgeInsets.all(10.0),child:
            TextField(
              maxLength: 11,
              keyboardType: TextInputType.number,
              controller: number..text = customer['number'],
              decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.lightBlueAccent), //<-- SEE HERE
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.lightBlueAccent), //<-- SEE HERE
                  ),
                  labelText: 'Phone Number'),
            ),),
            Padding(padding: EdgeInsets.all(10.0),child:
            TextField(
              controller: address..text = customer['address'],
              decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.lightBlueAccent), //<-- SEE HERE
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.lightBlueAccent), //<-- SEE HERE
                  ),
                  labelText: 'Address'),
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    String f = 'not found';
                    if(name.text != customer['name']){
                      for(int x = 0 ; x< c.length ;x++){
                        if (c[x]['name'] == name.text){
                          f = 'found';
                          print(f);
                        }
                      }
                    }
                    if(f == 'not found'){
                      for (int i = 0; i < c.length; i++) {
                        if (c[i]['name'] == customer['name']) {
                          c[i] = {
                            'id' : c[i]['id'],
                            'name': name.text,
                            'number': number.text,
                            'address': address.text,
                            'transactions': c[i]['transactions']
                          };
                        }
                      }
                      Navigator.of(context).pop();
                      return;
                    }
                    _dialogBuilder(context);
                  },
                  color: Colors.blueAccent,
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Authentication Error',
            style:TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              color: Colors.red,
            ) ,
          ),
          content:  const Text(
            'This UserName You Choosed Is Already Taken !\n'
                'Please Try Enter Another UserName',
            style:TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ) ,

          ),
          actions: <Widget>[

            TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
