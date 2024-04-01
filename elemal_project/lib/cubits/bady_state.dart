part of 'bady_cubit.dart';

@immutable
abstract class BadyState {}

class BadyInitial extends BadyState {}
class BadyChange extends BadyState {
   late final slactPage ;
}