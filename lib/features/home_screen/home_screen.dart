import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_reservation_app/core/data/models/filter_model.dart';
import 'package:hotel_reservation_app/core/enums/person_number_enum.dart';
import 'package:hotel_reservation_app/core/enums/room_type_enum.dart';
import 'package:hotel_reservation_app/core/routers/app_router.dart';
import 'package:hotel_reservation_app/features/components/custom_button_widget.dart';
import 'package:hotel_reservation_app/features/components/custom_container_filter.dart';
import 'package:hotel_reservation_app/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:hotel_reservation_app/features/home_screen/bloc/home_screen_event.dart';
import 'package:hotel_reservation_app/features/home_screen/bloc/home_screen_state.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_state.dart';
import 'package:hotel_reservation_app/features/shared/colors.dart';


@RoutePage()
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc()..add(FetchDataEvent()),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          debugPrint('HomeScreen: $state');
          if (state is HomeScreenLoading) {
            return const Center(
              child: Column(
                children: [CircularProgressIndicator(), Text('Loading...')],
              ),
            );
          } else if (state is DataLoadedState) {
            final hotelFilteredList = state.filteredHotels;

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
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                title: const Text(
                  'MekMeet',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      child: SvgPicture.asset(
                        'assets/svg/Sort.svg',
                      ),
                      onTap: () {
                        context.router.push(const FilterRoute()).then((value) => {
                          if(value != null && value is Filter){
                            context.read<HomeScreenBloc>().add(FetchDataEvent(filter: value))
                          }

                        });
                      },
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                  
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: hotelFilteredList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: Image.asset(
                                        'assets/images/OffisMekan-isim.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      child: Image.asset(
                                        'assets/images/rooms.png',
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.09,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 16, top: 16),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      hotelFilteredList[index].roomType.displayString,
                                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                                                    ),
                                                    
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset('assets/svg/people.svg'),
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          hotelFilteredList[index].personNumber.displayString,
                                                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16, top: 16),
                                                child: CustomButtonWidget(
                                                  text: 'Rezerve Et',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
