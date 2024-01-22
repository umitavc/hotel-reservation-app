import 'package:hotel_reservation_app/core/enums/person_number_enum.dart';
import 'package:hotel_reservation_app/core/enums/room_type_enum.dart';

class Hotel {
  final HotelRoomTypeEnum roomType;

  final HotelPersonNumberEnum personNumber;

  final int id;

  Hotel({
    required this.roomType,
    required this.personNumber,
    required this.id,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      roomType: HotelRoomTypeEnum.values.firstWhere((element) => element.name == json['roomType']),
      personNumber: HotelPersonNumberEnum.values.firstWhere((element) => element.name == json['personNumber']) ,
      id: json['id'],
    );
  }
}
