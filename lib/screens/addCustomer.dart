import 'package:flutter/material.dart';
import '../main.dart';

class customer extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add customer'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(10.0), child:
            TextField(
              autofocus: true,
              controller: name,
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
              controller: number,
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
              controller: address,
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
                    String f ='not found';
                    for(int i = 0 ; i < c.length ; i++){
                      if(c[i]['name'] == name.text){
                        f ='found';
                      }
                    }


                    if(f == 'not found' && name.text!= ''){
                      if( c.length == 0){
                        c.add({
                          'id' : 0,
                          'name': name.text,
                          'number': number.text,
                          'address': address.text,
                          'transactions': {'lastBalance': 0, 'oldTrx': []}
                        });
                      }else{
                        c.add({
                          'id' : c.length,
                          'name': name.text,
                          'number': number.text,
                          'address': address.text,
                          'transactions': {'lastBalance': 0, 'oldTrx': []}
                        });
                      }
                      Navigator.of(context).pop();
                      return;
                    }
                    if(name.text == ''){
                      String t = "Name can't be empty";
                      _dialogBuilder(context,t);
                      return;
                    }
                    _dialogBuilder(context,'This UserName You Choosed Is Already Taken !\n'
                        'Please Try Enter Another UserName');
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
  Future<void> _dialogBuilder(BuildContext context , t) {
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
          content:  Text(t,
            // 'This UserName You Choosed Is Already Taken !\n'
            //     'Please Try Enter Another UserName',
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
