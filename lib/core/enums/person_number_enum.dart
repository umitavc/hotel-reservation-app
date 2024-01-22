enum HotelPersonNumberEnum {
  one(1),
  two(2),
  three(3),
  four(4),
  five(5),
  six(6),
  seven(7),
  eight(8),
  nine(9),
  ten(10);

  final int value;
  const HotelPersonNumberEnum(this.value);
}


extension HotelPersonNumberEnumExtension on HotelPersonNumberEnum {
  String get displayString {
    switch (this) {
      case HotelPersonNumberEnum.one:
        return '1 Kişilik';
      case HotelPersonNumberEnum.two:
        return '2 Kişilik';
      case HotelPersonNumberEnum.three:
        return '3 Kişilik';
      case HotelPersonNumberEnum.four:
        return '4 Kişilik';
      case HotelPersonNumberEnum.five:
        return '5 Kişilik';
      case HotelPersonNumberEnum.six:
        return '6 Kişilik';
      
      default:
        return '';
    }
  }
}