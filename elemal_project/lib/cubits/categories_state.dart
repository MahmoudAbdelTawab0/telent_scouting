part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLodeing extends CategoriesState {

}
class CategoriesSuccessed extends CategoriesState {
  final Categories data;

  CategoriesSuccessed(this.data);




}
class CategoriesFiled extends CategoriesState {


}
