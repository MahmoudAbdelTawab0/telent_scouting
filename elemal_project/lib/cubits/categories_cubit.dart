import 'package:bloc/bloc.dart';
import 'package:elemal_project/models/categories.dart';
import 'package:elemal_project/repositories/categories.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  void getData () async{
    try {
      emit(CategoriesLodeing());
      final data = await Categories_Repo().getData();
      emit(CategoriesSuccessed( data));
    } on Exception catch (e) {
      emit(CategoriesFiled());
    }


  }


}
