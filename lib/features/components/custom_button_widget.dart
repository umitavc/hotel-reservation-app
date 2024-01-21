import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_reservation_app/features/shared/colors.dart';


class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({Key? key, this.text = '', this.iconActive = true, this.onPressed}) : super(key: key);

  final String text;
  final bool iconActive;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // onPressed'ı InkWell'ın onTap özelliğine atama
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: iconActive ? AppColors.buttonColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: iconActive ? null : Border.all(color: AppColors.buttonColor, width: 1.5),
        ),
        child: Padding(
          padding: iconActive
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
              : const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: iconActive ? Colors.white : AppColors.buttonColor),
              ),
              const SizedBox(
                width: 10,
              ),
              iconActive ? SvgPicture.asset('assets/svg/chevron-right.svg') : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
