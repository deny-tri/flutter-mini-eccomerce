import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_eccommerce/src/model/models.dart';
import 'package:flutter_mini_eccommerce/src/service/services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProductFromAPI>((event, emit) async {
      emit(ProductIsLoading());
      final result = await ProductService().fetchProductList();

      if (result.data != null) {
        final data = productModelFromJson(result.data);
        emit(ProductIsSuccesess(data));
      } else {
        emit(ProductIsFailed(result.message));
      }
    });
  }
}
