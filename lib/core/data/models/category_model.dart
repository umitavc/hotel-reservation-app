import 'package:equatable/equatable.dart';
import 'package:hotel_reservation_app/core/enums/room_type_enum.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final HotelRoomTypeEnum roomType;
  final String imageUrl;
  final int index;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.index,
    required this.roomType,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, index];

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'].toString(),
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      index: snap['index'],
      roomType: HotelRoomTypeEnum.smallRoom, // TODO
    );
  }

  static List<Category> categories = [
    const Category(
      id: '1',
      name: 'Küçük Oda',
      roomType: HotelRoomTypeEnum.smallRoom,
      imageUrl: 'assets/images/rooms.png',
      index: 0,
    ),
    const Category(
      id: '2',
      name: 'Rahat Oda',
      roomType: HotelRoomTypeEnum.comfortableRoom,
      imageUrl: 'assets/images/rooms.png',
      index: 1,
    ),
    const Category(
      id: '3',
      name: 'Çalıma Odası',
      roomType: HotelRoomTypeEnum.uncomfortableRoom,
      imageUrl: 'assets/images/rooms.png',
      index: 2,
    ),
    const Category(
      id: '4',
      name: 'Toplantı Odası',
      roomType: HotelRoomTypeEnum.presentationRoom,
      imageUrl: 'assets/images/rooms.png',
      index: 3,
    ),
    const Category(
      id: '5',
      name: 'Geniş Oda',
      roomType: HotelRoomTypeEnum.wideRoom,
      imageUrl: 'assets/images/rooms.png',
      index: 4,
    ),
  ];
}
