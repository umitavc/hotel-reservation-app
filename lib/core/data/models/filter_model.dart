import 'package:equatable/equatable.dart';
import 'package:hotel_reservation_app/core/data/models/person_number_filter_model.dart';
import 'category_filter_model.dart';


class Filter extends Equatable {
  final List<CategoryFilter> categoryFilters;
  final List<PersonNumberFilter> personNumberFilters;

  const Filter({
    this.categoryFilters = const <CategoryFilter>[],
    this.personNumberFilters = const <PersonNumberFilter>[],
  });

  Filter copyWith({
    List<CategoryFilter>? categoryFilters,
    List<PersonNumberFilter>? personNumberFilters,
  }) {
    return Filter(
      categoryFilters: categoryFilters ?? this.categoryFilters,
      personNumberFilters: personNumberFilters ?? this.personNumberFilters,
    );
  }

  @override
  List<Object?> get props => [personNumberFilters, categoryFilters];
}