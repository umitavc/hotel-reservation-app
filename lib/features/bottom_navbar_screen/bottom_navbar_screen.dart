import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_app/features/bottom_navbar_screen/bloc/bottom_nav_bar_bloc.dart';
import 'package:hotel_reservation_app/features/bottom_navbar_screen/bottom_nabar_widget.dart';
import 'package:hotel_reservation_app/features/home_screen/home_screen.dart';
import 'package:hotel_reservation_app/features/rooms_screen/rooms_screen.dart';


@RoutePage()
// ignore: must_be_immutabl
class BottomNavigatorBarScreen extends StatefulWidget {
  const BottomNavigatorBarScreen({super.key});

  @override
  State<BottomNavigatorBarScreen> createState() => _BottomNavigatorBarScreenState();
}

class _BottomNavigatorBarScreenState extends State<BottomNavigatorBarScreen> with AutomaticKeepAliveClientMixin {
  late final BottomNavBarBloc _bottomNavBarBloc;

  late final PageController _pageController;
  final List<Widget> _bottomNavScreen = <Widget>[
    const HomeScreen(),
    const RoomsScreen(),
    const RoomsScreen(),
    const RoomsScreen(),
  ];

  @override
  void initState() {
    _bottomNavBarBloc = BlocProvider.of<BottomNavBarBloc>(context);

    _pageController = PageController(initialPage: _bottomNavBarBloc.state.tabIndex);
    super.initState();
  }

  @override
  void dispose() {
    // _homeScreenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocListener<BottomNavBarBloc, BottomNavBarState>(
        bloc: _bottomNavBarBloc,
        listenWhen: (previous, current) {
          if (previous.tabIndex != current.tabIndex) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          _pageController.jumpToPage(state.tabIndex);
        },
        child: PageView.custom(
          controller: _pageController,
          onPageChanged: (index) {
            _bottomNavBarBloc.add(TabChange(tabIndex: index));
          },
          physics: const NeverScrollableScrollPhysics(),
          childrenDelegate: SliverChildListDelegate.fixed(_bottomNavScreen),
        ),
      ),
      bottomNavigationBar: CoreBottomNavigationBarWidget(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
