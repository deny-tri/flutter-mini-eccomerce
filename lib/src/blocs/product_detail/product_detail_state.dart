part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailisLoading extends ProductDetailState {}

class ProductDetailisFailed extends ProductDetailState {
  final String message;

  ProductDetailisFailed(this.message);
}

class ProductDetailisSuccess extends ProductDetailState {
  final DetailProductModel model;

  ProductDetailisSuccess(this.model);
}
