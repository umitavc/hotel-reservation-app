import 'package:equatable/equatable.dart';
import 'package:hotel_reservation_app/core/data/models/person_number_model.dart';


class PersonNumberFilter extends Equatable {
  final int id;
  final PersonNumber personNumber;
  final bool value;

  PersonNumberFilter({
    required this.id,
    required this.personNumber,
    required this.value,
  });

  PersonNumberFilter copyWith({
    int? id,
    PersonNumber? personNumber,
    bool? value,
  }) {
    return PersonNumberFilter(
      id: id ?? this.id,
      personNumber: personNumber ?? this.personNumber,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [
        id,
        personNumber,
        value,
      ];

  static List<PersonNumberFilter> filters = PersonNumber.personNumbers
      .map((personNumber) => PersonNumberFilter(
            id: personNumber.id,
            personNumber: personNumber,
            value: false,
          ))
      .toList();
}