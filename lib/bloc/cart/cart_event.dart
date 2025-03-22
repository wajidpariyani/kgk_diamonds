
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final diamond;
  final BuildContext context;

  AddToCart(this.context, this.diamond);

  @override
  List<Object?> get props => [diamond];
}

class RemoveFromCart extends CartEvent {
  final String diamondId;
  final BuildContext context;

  RemoveFromCart(this.context, this.diamondId);

  @override
  List<Object?> get props => [diamondId];
}
