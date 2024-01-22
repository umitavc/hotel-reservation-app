import 'package:equatable/equatable.dart';
import 'package:hotel_reservation_app/core/enums/person_number_enum.dart';

class PersonNumber extends Equatable {
  final int id;
  final String personNumber;
  final HotelPersonNumberEnum personNumberEnum;

  PersonNumber({
    required this.id,
    required this.personNumber,
    required this.personNumberEnum,
  });

  @override
  List<Object?> get props => [id,personNumber];

  static List<PersonNumber> personNumbers = [
    PersonNumber(id: 1, personNumber: '1 Kişilik',personNumberEnum: HotelPersonNumberEnum.one),
    PersonNumber(id: 2, personNumber: '2 Kişilik',personNumberEnum: HotelPersonNumberEnum.two),
    PersonNumber(id: 3, personNumber: '3 Kişilik',personNumberEnum: HotelPersonNumberEnum.three),
    PersonNumber(id: 4, personNumber: '4 Kişilik',personNumberEnum: HotelPersonNumberEnum.four),
    PersonNumber(id: 5, personNumber: '5 Kişilik',personNumberEnum: HotelPersonNumberEnum.five),
    PersonNumber(id: 6, personNumber: '6 Kişilik',personNumberEnum: HotelPersonNumberEnum.six),
  ];
}