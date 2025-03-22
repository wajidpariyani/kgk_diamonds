import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds/utils/cart_helper.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../bloc/cart/cart_state.dart';
import '../components/diamond_card.dart';
import '../models/diamond_cart_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<CartBloc>(context).state is CartInitial) {
      BlocProvider.of<CartBloc>(context).add(LoadCart());
    }

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial || state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final diamonds = state.diamonds;

            if (diamonds.isEmpty) {
              return Center(child: Text("Your cart is empty."));
            }

            double totalCarat = diamonds.fold(0.0, (sum, item) => sum + item.carat);
            double totalPrice = diamonds.fold(0.0, (sum, item) => sum + item.price);
            double avgPrice = diamonds.isNotEmpty ? totalPrice / diamonds.length : 0.0;
            double avgDiscount = diamonds.isNotEmpty
                ? diamonds.fold(0.0, (sum, item) => sum + item.discount) / diamonds.length
                : 0.0;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: diamonds.length,
                    itemBuilder: (context, index) {
                      Diamond diamond = diamonds[index];
                      return DiamondCard(
                          diamond: diamond,
                          onAddOrDeleteToCart: () {
                            toggleCartItem(context, diamond);
                          },
                        cartBox: context.read<CartBloc>().getCartBox,);
                    },
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Carat: $totalCarat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Total Price: \$${totalPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                      Text("Average Price: \$${avgPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                      Text("Average Discount: ${avgDiscount.toStringAsFixed(2)}%", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text("Something went wrong!"));
          } else {
            return Center(child: Text("Unexpected state!"));
          }
        },
      ),
    );
  }
}
