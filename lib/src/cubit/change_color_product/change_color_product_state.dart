part of 'change_color_product_cubit.dart';

@immutable
abstract class ChangeColorProductState {}

class ChangeColorProductInitial extends ChangeColorProductState {}

class ChangeColorProductIsColor extends ChangeColorProductState {
  final int index;

  ChangeColorProductIsColor(this.index);
}
