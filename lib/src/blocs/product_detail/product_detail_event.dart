part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class FetchDetailProduct extends ProductDetailEvent {
  final int id;

  FetchDetailProduct(this.id);
}
