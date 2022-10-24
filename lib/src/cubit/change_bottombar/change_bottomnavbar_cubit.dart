import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_bottomnavbar_state.dart';

class ChangeBottomnavbarCubit extends Cubit<int> {
  ChangeBottomnavbarCubit(this.context) : super(0);
  final BuildContext context;
  void changeHome() => emit(0);
  void changeProduct() => emit(1);
  void changeProfile() => emit(2);
}
