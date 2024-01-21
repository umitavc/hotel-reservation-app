import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_reservation_app/core/data/hotel_model.dart';
import 'package:hotel_reservation_app/core/routers/app_router.dart';
import 'package:hotel_reservation_app/features/components/custom_button_widget.dart';
import 'package:hotel_reservation_app/features/components/custom_container_filter.dart';
import 'package:hotel_reservation_app/features/shared/colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/json/hotel.json");
    final data = await json.decode(response);

    setState(() {
      items = data["items"].map((data) => Hotel.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

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
                  context.router.push(const FilterRoute());
                },
              ),
            ),
          ],
        ),
        body :SafeArea(
                child: Column(
                children: [
                  const CustomContainerFilter(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  'assets/images/OffisMekan-isim.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Image.asset(
                                'assets/images/rooms.png',
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                              Container(
                                height: 71,
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
                                                items[index].name,
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
                                                    items[index].personNumber,
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
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ))
            );
  }
}
