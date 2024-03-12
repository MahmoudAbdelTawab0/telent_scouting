part of 'item_cubit.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}
class ItemLoading extends ItemState {}
class ItemSuccessed extends ItemState {
  final ProductModel data;
  ItemSuccessed(this.data);
}
class ItemFailed extends ItemState {}

