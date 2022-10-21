import 'package:bloc/bloc.dart';
import 'package:flutter_mini_eccommerce/src/model/models.dart';
import 'package:flutter_mini_eccommerce/src/service/services.dart';
import 'package:meta/meta.dart';

part 'category_product_event.dart';
part 'category_product_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  CategoryProductBloc() : super(CategoryProductInitial()) {
    on<CategoryProductEvent>((event, emit) async {
      emit(CategoryProductIsLoading());
      final result = await ProductService().fetchCategoryJewel();

      if (result.data != null) {
        final data = categoryModelFromJson(result.data);
        emit(CategoryProductIsSuccess(data));
      } else {
        emit(CategoryProductIsFailed(result.message));
      }
    });
  }
}
