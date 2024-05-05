import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int value = 0;
  Color _color = Colors.black ;
  Color get color => _color;
  void Zero(){
    value =0;
    _color = Colors.black;
    emit(CounterChnage());
  }
  void InecrementOne(){
    value++;
    _color = Colors.blue;
    emit(CounterChnage());
  }
  void DenecrementOne(){
    value--;
    _color = Colors.amberAccent;
    emit(CounterChnage());
  }
  void InecrementTen(){
    value+=10;
    _color = Colors.redAccent;
    emit(CounterChnage());
  }
  void DenecrementTen(){
    value-=10;
    _color = Colors.green;
    emit(CounterChnage());
  }
}
