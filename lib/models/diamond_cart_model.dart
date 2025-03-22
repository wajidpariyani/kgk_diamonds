
import 'package:hive_flutter/adapters.dart';

part 'diamond_cart_model.g.dart';

@HiveType(typeId: 0)
class Diamond {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final double carat;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final double discount;

  @HiveField(4)
  final String lotId;

  @HiveField(5)
  final String size;

  @HiveField(6)
  final String lab;

  @HiveField(7)
  final String shape;

  @HiveField(8)
  final String color;

  @HiveField(9)
  final String clarity;

  @HiveField(10)
  final String cut;

  @HiveField(11)
  final String polish;

  @HiveField(12)
  final String symmetry;

  @HiveField(13)
  final String fluorescence;

  @HiveField(14)
  final double perCaratRate;

  @HiveField(15)
  final double finalAmount;

  @HiveField(16)
  final String keyToSymbol;

  @HiveField(17)
  final String labComment;

  Diamond({
    required this.id,
    required this.carat,
    required this.price,
    required this.discount,
    required this.lotId,
    required this.size,
    required this.lab,
    required this.shape,
    required this.color,
    required this.clarity,
    required this.cut,
    required this.polish,
    required this.symmetry,
    required this.fluorescence,
    required this.perCaratRate,
    required this.finalAmount,
    required this.keyToSymbol,
    required this.labComment,
  });
}
