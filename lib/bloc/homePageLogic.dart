import 'package:bloc/bloc.dart';
import 'package:my_note/bloc/homePageState.dart';
import '../main.dart';


class homePageLogic extends Cubit<homePageState>{
  List customers = c;
  double t1 = 0;
  double t2 = 0;
  int n = 0;
  int n1 = 0;
  int n2 = 0;
  homePageLogic() : super(InitHomePage());
  void getcustomers(){
    t1 = 0;
    t2 = 0;
    n = c.length;
    n1 =0;
    n2 =0;
    customers = c;
    for(int i = 0 ; i < c.length ;i++){
      if(c[i]['transactions']['lastBalance'] < 0){
        t1 += 0 - c[i]['transactions']['lastBalance'];
        n1++;
      }else if(c[i]['transactions']['lastBalance'] > 0){
        t2 += c[i]['transactions']['lastBalance'];
        n2++;
      }
    }
    emit(getCustomers());
  }
}