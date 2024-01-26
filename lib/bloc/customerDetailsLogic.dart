
import 'package:bloc/bloc.dart' show Cubit;
import 'package:my_note/bloc/customerDetailsState.dart';
import '../main.dart';


class customerDetailsLogic extends Cubit<customerDetailsState>{
  List oldOp = [];
  Map C ={};
  customerDetailsLogic() : super(InitHomePage());
  void getoldop(i){
    oldOp = c[i]['transactions']['oldTrx'];
    emit(getOldOp());
  }
  void getccustomer(id){
    for(int i = 0 ; i < c.length ; i++){
      if(c[i]['id'] == id){
        C = c[i];
      }
    }
    emit(getCustomer());
  }
}