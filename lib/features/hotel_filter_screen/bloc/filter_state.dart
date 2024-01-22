

import 'package:equatable/equatable.dart';
import 'package:hotel_reservation_app/core/data/models/filter_model.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final Filter filter;
 

  FilterLoaded({
    this.filter = const Filter(),
   
  });

  @override
  List<Object?> get props => [filter,];
}