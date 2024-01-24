

import 'package:hotel_reservation_app/core/data/models/filter_model.dart';

abstract class HomeScreenEvent {}

class FetchDataEvent extends HomeScreenEvent {
  final Filter? filter;

  FetchDataEvent({this.filter});
}