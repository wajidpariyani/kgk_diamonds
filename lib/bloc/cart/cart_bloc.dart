import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kgk_diamonds/utils/snackbar_util.dart';
import '../../models/diamond_cart_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Box<Diamond> cartBox;

  Box<Diamond> get getCartBox => cartBox;

  CartBloc(this.cartBox) : super(CartInitial()) {
    on<LoadCart>((event, emit) async {
      emit(CartLoading());
      try {
        final diamonds = cartBox.values.toList();
        emit(CartLoaded(diamonds));
      } catch (e) {
        emit(CartError("Failed to load cart items: ${e.toString()}"));
      }
    });

    on<AddToCart>((event, emit) async {
      try {
        if (cartBox.containsKey(event.diamond.id)) {
          SnackbarUtil.showSnackbar(event.context, "Item already in cart: LOT ID : ${event.diamond.id}");
          return;
        }

        await cartBox.put(event.diamond.id, event.diamond);
        final diamonds = cartBox.values.toList();
        SnackbarUtil.showSnackbar(event.context, "Item added to cart: LOT ID : ${event.diamond.id}");
        emit(CartLoaded(diamonds));
      } catch (e) {
        emit(CartError("Failed to add item to cart: ${e.toString()}"));
      }
    });

    on<RemoveFromCart>((event, emit) async {
      try {
        if (!cartBox.containsKey(event.diamondId)) {
          SnackbarUtil.showSnackbar(event.context, "Item not found in cart: LOT ID : ${event.diamondId}");
          return;
        }

        await cartBox.delete(event.diamondId);
        final diamonds = cartBox.values.toList();
        SnackbarUtil.showSnackbar(event.context, "Item removed from cart: LOT ID : ${event.diamondId}");
        emit(CartLoaded(diamonds));
      } catch (e) {
        emit(CartError("Failed to remove item from cart: ${e.toString()}"));
      }
    });
  }
}
