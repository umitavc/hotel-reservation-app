enum HotelRoomTypeEnum {
  smallRoom,
  colorfulRoom,
  comfortableRoom,
  uncomfortableRoom,
  wideRoom,
  presentationRoom,
  studyRoom
  
}

extension HotelRoomTypeEnumExtension on HotelRoomTypeEnum {
  String get displayString {
    switch (this) {
      case HotelRoomTypeEnum.smallRoom:
        return 'Küçük Oda';
      case HotelRoomTypeEnum.colorfulRoom:
        return 'Renkli Oda';
      case HotelRoomTypeEnum.comfortableRoom:
        return 'Rahat Oda';
      case HotelRoomTypeEnum.uncomfortableRoom:
        return 'Çalışma Odası';
      case HotelRoomTypeEnum.wideRoom:
        return 'Geniş Oda';
        case HotelRoomTypeEnum.studyRoom:
        return 'Çalışma Odası';
      case HotelRoomTypeEnum.presentationRoom:
        return 'Toplantı Odası';
      default:
        return '';
    }
  }
}