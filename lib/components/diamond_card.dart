import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/diamond_cart_model.dart';

class DiamondCard extends StatefulWidget {
  final Diamond diamond;
  final Function() onAddOrDeleteToCart;
  final Box<Diamond> cartBox;

  DiamondCard({
    required this.diamond,
    required this.onAddOrDeleteToCart,
    required this.cartBox,
  });

  @override
  State<DiamondCard> createState() => _DiamondCardState();
}

class _DiamondCardState extends State<DiamondCard> {
  @override
  Widget build(BuildContext context) {
    bool isInCart = widget.cartBox.containsKey(widget.diamond.id);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lot ID: ${widget.diamond.lotId}',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Carat: ${widget.diamond.carat}'),
            Text('Lab: ${widget.diamond.lab}'),
            Text('Shape: ${widget.diamond.shape}'),
            Text('Color: ${widget.diamond.color}'),
            Text('Clarity: ${widget.diamond.clarity}'),
            Text('Cut: ${widget.diamond.cut}'),
            Text('Polish: ${widget.diamond.polish}'),
            Text('Symmetry: ${widget.diamond.symmetry}'),
            Text('Fluorescence: ${widget.diamond.fluorescence}'),
            Text('Discount: ${widget.diamond.discount}%'),
            Text(
                'Per Carat Rate: \$${widget.diamond.perCaratRate.toStringAsFixed(2)}'),
            Text(
                'Final Amount: \$${widget.diamond.finalAmount.toStringAsFixed(2)}'),
            Text('Key To Symbol: ${widget.diamond.keyToSymbol}'),
            Text('Lab Comment: ${widget.diamond.labComment}'),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                widget.onAddOrDeleteToCart();
                setState(() {});
              },
              child: Text(isInCart ? 'Remove from Cart' : 'Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
