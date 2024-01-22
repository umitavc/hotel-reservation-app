import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_reservation_app/core/routers/app_router.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_bloc.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_state.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/widgets/custom_category_filter.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/widgets/custom_person_filter.dart';
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
                  const CustomCategoryFilter(),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Text(
                      'Oda Saysısı',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const CustomPersonNumberFilter(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BlocBuilder<FilterBloc, FilterState>(
                        builder: (context, state) {
                          if (state is FilterLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is FilterLoaded) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  backgroundColor: AppColors.buttonColor),
                              child: const Text(
                                'Apply',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                var categories = state.filter.categoryFilters.where((filter) => filter.value).map((filter) => filter.category).toList();

                                var personNumbers = state.filter.personNumberFilters.where((filter) => filter.value).map((filter) => filter.personNumber).toList();

                                context.router.push(const HomeRoute());
                              },
                            );
                          } else {
                            return const Text('Something went wrong.');
                          }
                        },
                      ),
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
