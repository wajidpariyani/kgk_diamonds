import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds/bloc/cart/cart_bloc.dart';
import 'package:kgk_diamonds/models/diamond_cart_model.dart';

import '../bloc/cart/cart_event.dart';

void toggleCartItem(BuildContext context, Diamond diamond) {
  final cartBox = context.read<CartBloc>().getCartBox;

  if (cartBox.containsKey(diamond.id)) {
    context.read<CartBloc>().add(RemoveFromCart(context, diamond.id));
  } else {
    context.read<CartBloc>().add(AddToCart(context, diamond));
  }
}
