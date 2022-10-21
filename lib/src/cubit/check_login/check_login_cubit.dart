import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_eccommerce/src/service/services.dart';

part 'check_login_state.dart';

class CheckLoginCubit extends Cubit<CheckLoginState> {
  CheckLoginCubit() : super(CheckLoginInitial());
  void checkLogin() async {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      final result = await UserService().checkLogin();
      if (result.data != null) {
        emit(CheckLoginIsSuccess());
      } else {
        emit(CheckLoginIsFailed(result.message));
      }
    });
  }

  void logout() async {
    final result = await UserService().checkLogOut();
    if (result.data != null) {
      emit(CheckLoginIsLogOut());
    } else {
      emit(CheckLoginIsFailed(result.message));
    }
  }
}
