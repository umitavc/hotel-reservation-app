import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_bloc.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_state.dart';
import 'package:hotel_reservation_app/features/shared/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({Key? key, this.text = '', this.iconActive = true, this.onPressed}) : super(key: key);

  final String text;
  final bool iconActive;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      
      builder: (context, state) {

        if (state is FilterLoading) {
          return const Center(
              child: Column(
            children: [CircularProgressIndicator(), Text('...olmadı')],
          ));
        }
        if (state is FilterLoaded) {
          return InkWell(
          onTap: onPressed,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: iconActive ? AppColors.buttonColor : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: iconActive ? null : Border.all(color: AppColors.buttonColor, width: 1.5),
            ),
            child: Padding(
              padding: iconActive ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8) : const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
        } else  {
          return const Text('Something went wrong.');
        } 
       
      },
    );
  }
}
