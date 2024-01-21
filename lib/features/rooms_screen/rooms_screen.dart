import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class RoomsScreen extends StatelessWidget {
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Rooms Screen'),
      )
    );
  }
}