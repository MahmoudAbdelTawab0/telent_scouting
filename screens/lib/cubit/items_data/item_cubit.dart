import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:screens/models/product_model.dart';
import 'package:screens/repositories/product_repo.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());
  void getData () async{
    try {
      emit(ItemLoading());
      final data = await Product_Repo().getProduct();
      emit(ItemSuccessed(data));
    } on Exception catch (e) {
      emit(ItemFailed());
    }


  }
}
