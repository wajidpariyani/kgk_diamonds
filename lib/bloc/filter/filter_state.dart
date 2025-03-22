import 'package:kgk_diamonds/models/diamond_lot.dart';

class FilterState {
  final double caratFrom;
  final double caratTo;
  final String lab;
  final String shape;
  final String color;
  final String clarity;
  final bool sortByPriceAsc;
  final bool sortByCaratAsc;
  List<DiamondLot> filteredDiamonds;

  FilterState({
    this.caratFrom = 0.30,
    this.caratTo = 0.39,
    this.lab = 'GIA',
    this.shape = 'BR',
    this.color = 'D',
    this.clarity = 'VVS1',
    this.sortByPriceAsc = true,
    this.sortByCaratAsc = true,
    List<DiamondLot>? filteredDiamonds,
  }) : filteredDiamonds = filteredDiamonds ?? [];

  FilterState copyWith({
    double? caratFrom,
    double? caratTo,
    String? lab,
    String? shape,
    String? color,
    String? clarity,
    bool? sortByPriceAsc,
    bool? sortByCaratAsc,
    List<DiamondLot>? filteredDiamonds,
  }) {
    return FilterState(
      caratFrom: caratFrom ?? this.caratFrom,
      caratTo: caratTo ?? this.caratTo,
      lab: lab ?? this.lab,
      shape: shape ?? this.shape,
      color: color ?? this.color,
      clarity: clarity ?? this.clarity,
      sortByPriceAsc: sortByPriceAsc ?? this.sortByPriceAsc,
      sortByCaratAsc: sortByCaratAsc ?? this.sortByCaratAsc,
      filteredDiamonds: filteredDiamonds ?? this.filteredDiamonds,
    );
  }

  Future<void> filterAndSortDiamonds(List<DiamondLot> allDiamonds) async {
    filteredDiamonds = allDiamonds.where((diamond) {
      bool matchesCarat = diamond.carat >= caratFrom && diamond.carat <= caratTo;
      bool matchesLab = diamond.lab == lab;
      bool matchesShape = diamond.shape == shape;
      bool matchesColor = diamond.color == color;
      bool matchesClarity = diamond.clarity == clarity;

      return matchesCarat && matchesShape && matchesLab && matchesColor && matchesClarity;
    }).toList();

    if (sortByPriceAsc) {
      filteredDiamonds.sort((a, b) => a.finalAmount.compareTo(b.finalAmount));
    } else {
      filteredDiamonds.sort((a, b) => b.finalAmount.compareTo(a.finalAmount));
    }

    if (sortByCaratAsc) {
      filteredDiamonds.sort((a, b) => a.carat.compareTo(b.carat));
    } else {
      filteredDiamonds.sort((a, b) => b.carat.compareTo(a.carat));
    }
  }
}
