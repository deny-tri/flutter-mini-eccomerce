import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_color_product_state.dart';

class ChangeColorProductCubit extends Cubit<ChangeColorProductState> {
  ChangeColorProductCubit() : super(ChangeColorProductInitial());
}
