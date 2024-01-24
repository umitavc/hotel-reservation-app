// State
import 'package:equatable/equatable.dart';
import 'package:hotel_reservation_app/core/data/models/filter_model.dart';
import 'package:hotel_reservation_app/core/data/models/hotel_model.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  List<Hotel> filteredHotelList({Filter? filter}) {
    return [];
  }

  @override
  List<Object> get props => [];
}

class HomeScreenLoading extends HomeScreenState {}

class DataLoadedState extends HomeScreenState {
  final List<Hotel> filteredHotels;
  final Filter? filter; 

  const DataLoadedState(this.filteredHotels, {this.filter});

  @override
  List<Object> get props => [filteredHotels,  filter ?? [] ];
}

class ErrorState extends HomeScreenState {
  final String errorMessage;

  const ErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}