import 'diamond_cart_model.dart';

class DiamondLot {
  final String lotId;
  final String size;
  final double carat;
  final String lab;
  final String shape;
  final String color;
  final String clarity;
  final String cut;
  final String polish;
  final String symmetry;
  final String fluorescence;
  final double discount;
  final double perCaratRate;
  final double finalAmount;
  final String keyToSymbol;
  final String labComment;

  DiamondLot({
    required this.lotId,
    required this.size,
    required this.carat,
    required this.lab,
    required this.shape,
    required this.color,
    required this.clarity,
    required this.cut,
    required this.polish,
    required this.symmetry,
    required this.fluorescence,
    required this.discount,
    required this.perCaratRate,
    required this.finalAmount,
    required this.keyToSymbol,
    required this.labComment,
  });

  factory DiamondLot.fromJson(Map<String, dynamic> json) {
    return DiamondLot(
      lotId: json['lot_id'] as String,
      size: json['size'] as String,
      carat: (json['carat'] as num).toDouble(),
      lab: json['lab'] as String,
      shape: json['shape'] as String,
      color: json['color'] as String,
      clarity: json['clarity'] as String,
      cut: json['cut'] as String,
      polish: json['polish'] as String,
      symmetry: json['symmetry'] as String,
      fluorescence: json['fluorescence'] as String,
      discount: (json['discount'] as num).toDouble(),
      perCaratRate: (json['per_carat_rate'] as num).toDouble(),
      finalAmount: (json['final_amount'] as num).toDouble(),
      keyToSymbol: json['key_to_symbol'] as String,
      labComment: json['lab_comment'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lot_id': lotId,
      'size': size,
      'carat': carat,
      'lab': lab,
      'shape': shape,
      'color': color,
      'clarity': clarity,
      'cut': cut,
      'polish': polish,
      'symmetry': symmetry,
      'fluorescence': fluorescence,
      'discount': discount,
      'per_carat_rate': perCaratRate,
      'final_amount': finalAmount,
      'key_to_symbol': keyToSymbol,
      'lab_comment': labComment,
    };
  }

  Diamond toDiamond() {
    return Diamond(
      id: lotId,
      carat: carat,
      price: finalAmount,
      discount: discount,
      lotId: lotId,
      size: size,
      lab: lab,
      shape: shape,
      color: color,
      clarity: clarity,
      cut: cut,
      polish: polish,
      symmetry: symmetry,
      fluorescence: fluorescence,
      perCaratRate: perCaratRate,
      finalAmount: finalAmount,
      keyToSymbol: keyToSymbol,
      labComment: labComment,
    );
  }
}
