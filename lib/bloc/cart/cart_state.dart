import 'package:equatable/equatable.dart';
import '../../models/diamond_cart_model.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Diamond> diamonds;

  CartLoaded(this.diamonds);

  @override
  List<Object?> get props => [diamonds];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object?> get props => [message];
}
