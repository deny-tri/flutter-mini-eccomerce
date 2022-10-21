part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductIsAppBar extends ProductState {
  final bool index;

  ProductIsAppBar(this.index);
}

class ProductIsLoading extends ProductState {}

class ProductIsSuccesess extends ProductState {
  final List<ProductModel> data;

  ProductIsSuccesess(this.data);
}

class ProductIsFailed extends ProductState {
  final String message;

  ProductIsFailed(this.message);
}
