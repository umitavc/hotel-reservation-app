import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_reservation_app/features/components/custom_button_widget.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/widgets/filter_container_button.dart';
import 'package:hotel_reservation_app/features/shared/colors.dart';


@RoutePage()
class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            child: SvgPicture.asset(
              'assets/svg/chevron-left.svg',
            ),
            onTap: () {
              context.router.pop();
            },
          ),
        ),
        title: const Text(
          'Filters',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: SvgPicture.asset('assets/svg/Filtre-bg.svg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: Text(
                      'Oda Tipi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(10, (index) {
                      return FilterButtonWidget(
                          text: 'Oda',
                          color : Colors.grey ,
                        );
                    }),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Text(
                      'Oda Tipi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(10, (index) {
                      return FilterButtonWidget(
                          text: 'Oda',
                          color : Colors.grey ,
                        );
                    }),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButtonWidget(
                        text: "Temizle",
                        iconActive: false,
                      ),
                      CustomButtonWidget(text: "Uygula"),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
