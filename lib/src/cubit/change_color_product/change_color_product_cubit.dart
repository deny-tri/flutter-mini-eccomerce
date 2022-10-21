import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_color_product_state.dart';

class ChangeColorProductCubit extends Cubit<ChangeColorProductState> {
  ChangeColorProductCubit() : super(ChangeColorProductIsColor(0));
  void changeColor(int index) {
    emit(ChangeColorProductIsColor(index));
  }
}
