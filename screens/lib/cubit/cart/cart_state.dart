part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class ItemAddedLoading extends CartState {}
class ItemAddedSuccessfly extends CartState {}
class ItemNotFound extends CartState {}
class GeneralErrorInCart extends CartState {}
class NotAuthorizedInCart extends CartState {}
