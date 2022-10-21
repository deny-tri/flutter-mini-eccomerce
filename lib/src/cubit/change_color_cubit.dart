import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'change_color_state.dart';

class ChangeColorCubit extends Cubit<ThemeData> {
  ChangeColorCubit() : super(ThemeData.light());

  void changeColor() {
    if (state == ThemeData.light()) {
      emit(ThemeData.dark());
    } else {
      emit(ThemeData.light());
    }
  }
}
