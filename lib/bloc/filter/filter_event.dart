
abstract class FilterEvent {}
class UpdateCarat extends FilterEvent {
  final double from, to;
  UpdateCarat(this.from, this.to);
}
class UpdateLab extends FilterEvent {
  final String lab;
  UpdateLab(this.lab);
}
class UpdateShape extends FilterEvent {
  final String shape;
  UpdateShape(this.shape);
}
class UpdateColor extends FilterEvent {
  final String color;
  UpdateColor(this.color);
}
class UpdateClarity extends FilterEvent {
  final String clarity;
  UpdateClarity(this.clarity);
}

class ApplyFilters extends FilterEvent {
}

class SortDiamondsByPrice extends FilterEvent {
  final bool ascending;
  SortDiamondsByPrice({required this.ascending});
}

class SortDiamondsByCarat extends FilterEvent {
  final bool ascending;
  SortDiamondsByCarat({required this.ascending});
}