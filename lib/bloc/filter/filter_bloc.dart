import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds/models/data.dart';
import 'filter_event.dart';
import 'filter_state.dart';
import '../../models/diamond_lot.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final allDiamonds = diamondsList.map((json) => DiamondLot.fromJson(json)).toList();

  FilterBloc() : super(FilterState()) {
    on<UpdateCarat>(_onUpdateCarat);
    on<UpdateLab>(_onUpdateLab);
    on<UpdateShape>(_onUpdateShape);
    on<UpdateColor>(_onUpdateColor);
    on<UpdateClarity>(_onUpdateClarity);
    on<ApplyFilters>(_onApplyFilters);
    on<SortDiamondsByPrice>(_onSortDiamondsByPrice);
    on<SortDiamondsByCarat>(_onSortDiamondsByCarat);
  }

  void _onUpdateCarat(UpdateCarat event, Emitter<FilterState> emit) {
    emit(state.copyWith(caratFrom: event.from, caratTo: event.to));
  }

  void _onUpdateLab(UpdateLab event, Emitter<FilterState> emit) {
    emit(state.copyWith(lab: event.lab));
  }

  void _onUpdateShape(UpdateShape event, Emitter<FilterState> emit) {
    emit(state.copyWith(shape: event.shape));
  }

  void _onUpdateColor(UpdateColor event, Emitter<FilterState> emit) {
    emit(state.copyWith(color: event.color));
  }

  void _onUpdateClarity(UpdateClarity event, Emitter<FilterState> emit) {
    emit(state.copyWith(clarity: event.clarity));
  }

    void _onApplyFilters(ApplyFilters event, Emitter<FilterState> emit) async {
      await state.filterAndSortDiamonds(allDiamonds);
      emit(state.copyWith(filteredDiamonds: state.filteredDiamonds));
    }

  Future<void> _onSortDiamondsByPrice(SortDiamondsByPrice event, Emitter<FilterState> emit) async {
    emit(state.copyWith(sortByPriceAsc: event.ascending));
    await state.filterAndSortDiamonds(allDiamonds);
    emit(state.copyWith(filteredDiamonds: state.filteredDiamonds));
  }

  Future<void> _onSortDiamondsByCarat(SortDiamondsByCarat event, Emitter<FilterState> emit) async {
    emit(state.copyWith(sortByCaratAsc: event.ascending));
    await state.filterAndSortDiamonds(allDiamonds);
    emit(state.copyWith(filteredDiamonds: state.filteredDiamonds));
  }
}
