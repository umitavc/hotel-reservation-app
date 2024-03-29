import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_app/core/routers/app_router.dart';
import 'package:hotel_reservation_app/features/bottom_navbar_screen/bloc/bottom_nav_bar_bloc.dart';
import 'package:hotel_reservation_app/features/home_screen/bloc/home_screen_bloc.dart';
import 'package:hotel_reservation_app/features/home_screen/bloc/home_screen_event.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_bloc.dart';
import 'package:hotel_reservation_app/features/shared/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBarBloc>(
          create: (_) => BottomNavBarBloc(),
        ),
        BlocProvider(
          create: (context) => FilterBloc()..add(LoadFilter()),
        ),
        BlocProvider(
          create: (context) => HomeScreenBloc()..add(FetchDataEvent()),
        ),
        

        // Diğer BlocProvider'ları buraya ekleyin.
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData,
        title: 'Hotel Reservation Case',
        routerConfig: appRouter.config(),
      ),
    );
  }
}
