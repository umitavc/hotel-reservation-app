import 'package:auto_route/auto_route.dart';
import 'package:hotel_reservation_app/features/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:hotel_reservation_app/features/home_screen/home_screen.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/hotel_filter_screen.dart';
import 'package:hotel_reservation_app/features/rooms_screen/rooms_screen.dart';

part 'app_router.gr.dart'; 

@AutoRouterConfig()      
class AppRouter extends _$AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [      

    AutoRoute(page: BottomNavigatorBarRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page,),  
    AutoRoute(page: RoomsRoute.page,), 
    AutoRoute(page: FilterRoute.page,),  
    
   
    
         
    
   ];  
 }