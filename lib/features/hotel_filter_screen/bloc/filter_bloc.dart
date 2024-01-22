

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_reservation_app/core/data/models/category_filter_model.dart';
import 'package:hotel_reservation_app/core/data/models/filter_model.dart';
import 'package:hotel_reservation_app/core/data/models/person_number_filter_model.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_state.dart';

part 'filter_event.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading()) {
    on<LoadFilter>(_onLoadFilter);
    on<UpdateCategoryFilter>(_onUpdateCategoryFilter);
    on<UpdatePersonNumberFilter>(_onUpdatePersonNumberFilter);
  }

  void _onLoadFilter(
    LoadFilter event,
    Emitter<FilterState> emit,
  ) async {

    
    emit(
      FilterLoaded( 
        filter: Filter(
          categoryFilters: CategoryFilter.filters,
          personNumberFilters: PersonNumberFilter.filters,
        ),
      ),
    );
  }

  void _onUpdateCategoryFilter(
    UpdateCategoryFilter event,
    Emitter<FilterState> emit,
  ) async {
    final state = this.state;

    if (state is FilterLoaded) {
      final List<CategoryFilter> updatedCategoryFilters = state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id ? event.categoryFilter : categoryFilter;
      }).toList();

      var categories = updatedCategoryFilters;

      var personNumbers = state.filter.personNumberFilters;

      emit(
        FilterLoaded(
          filter: Filter(
            categoryFilters: updatedCategoryFilters,
            personNumberFilters: state.filter.personNumberFilters,
          ),
        ),
      );
    }
  }

  void _onUpdatePersonNumberFilter(
    UpdatePersonNumberFilter event,
    Emitter<FilterState> emit,
  ) async {
    final state = this.state;

    if (state is FilterLoaded) {
      final List<PersonNumberFilter> updatedPersonNumberFilters = state.filter.personNumberFilters.map((personNumberFilter) {
        return personNumberFilter.id == event.personNumberFilter.id ? event.personNumberFilter : personNumberFilter;
      }).toList();

      var categories = state.filter.categoryFilters;

      var personNumbers = updatedPersonNumberFilters;

      print(
        Filter(
            categoryFilters: categories,
            personNumberFilters: personNumbers,
          ).toString(),
      );

      emit(
        FilterLoaded(
          filter: Filter(
            categoryFilters: categories,
            personNumberFilters: personNumbers,
          ),
        ),
      );
    }
  }
}
