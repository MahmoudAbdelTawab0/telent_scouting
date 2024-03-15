part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class ProductIsAdded extends CartState {
  final String name;

  ProductIsAdded({required this.name});
}
