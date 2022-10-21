part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchProductFromAPI extends ProductEvent {}

class SwitchToLogin extends ProductEvent {
  @override
  String toString() {
    return "Switch to Login";
  }
}
