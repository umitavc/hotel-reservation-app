import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/features/shared/colors.dart';

class CustomContainerFilter extends StatelessWidget {
  const CustomContainerFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: AppColors.appBarColor,
    );
  }
}