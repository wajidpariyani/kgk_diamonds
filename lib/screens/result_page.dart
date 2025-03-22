import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds/components/diamond_card.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/filter/filter_bloc.dart';
import '../bloc/filter/filter_event.dart';
import '../bloc/filter/filter_state.dart';
import '../models/diamond_lot.dart';
import '../utils/cart_helper.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Diamonds'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => _showSortOptions(context),
          ),
        ],
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          List<DiamondLot> diamonds = state.filteredDiamonds;

          if (diamonds.isEmpty) {
            return Center(child: Text('No diamonds found'));
          }

          return ListView.builder(
            itemCount: diamonds.length,
            itemBuilder: (context, index) {
              DiamondLot diamond = diamonds[index];
              return DiamondCard(
                diamond: diamond.toDiamond(),
                onAddOrDeleteToCart: () {
                  toggleCartItem(context, diamond.toDiamond());
                },
                cartBox: context.read<CartBloc>().getCartBox,
              );
            },
          );
        },
      ),
    );
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Sort by Price (Asc)'),
              onTap: () {
                _sortByPrice(context, ascending: true);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sort by Price (Desc)'),
              onTap: () {
                _sortByPrice(context, ascending: false);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sort by Carat (Asc)'),
              onTap: () {
                _sortByCarat(context, ascending: true);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sort by Carat (Desc)'),
              onTap: () {
                _sortByCarat(context, ascending: false);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _sortByPrice(BuildContext context, {required bool ascending}) {
    context.read<FilterBloc>().add(SortDiamondsByPrice(ascending: ascending));
  }

  void _sortByCarat(BuildContext context, {required bool ascending}) {
    context.read<FilterBloc>().add(SortDiamondsByCarat(ascending: ascending));
  }
}
