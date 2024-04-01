import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bady_state.dart';

class BadyCubit extends Cubit<BadyState> {
  BadyCubit() : super(BadyInitial());
 int slactedPage = 0;
  void changeBady(int x){
    slactedPage = x;
    emit(BadyChange());
  }
}
