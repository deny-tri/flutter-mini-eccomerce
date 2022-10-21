import 'package:bloc/bloc.dart';
import 'package:flutter_mini_eccommerce/src/model/models.dart';
import 'package:flutter_mini_eccommerce/src/service/services.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<FetchDetailProduct>((event, emit) async {
      emit(ProductDetailisLoading());
      final result = await ProductService().fetchDetailProduct(event.id);
      if (result.data != null) {
        final data = detailProductModelFromJson(result.data);
        emit(ProductDetailisSuccess(data));
      } else {
        emit(ProductDetailisFailed(result.message));
      }
    });
  }
}
