part of 'category_product_bloc.dart';

@immutable
abstract class CategoryProductState {}

class CategoryProductInitial extends CategoryProductState {}

class CategoryProductIsLoading extends CategoryProductState {}

class CategoryProductIsFailed extends CategoryProductState {
  final String message;

  CategoryProductIsFailed(this.message);
}

class CategoryProductIsSuccess extends CategoryProductState {
  final List<CategoryModel> data;

  CategoryProductIsSuccess(this.data);
}
