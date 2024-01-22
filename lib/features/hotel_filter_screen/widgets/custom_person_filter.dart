import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_bloc.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_state.dart';
import 'package:hotel_reservation_app/core/data/models/person_number_model.dart';

class CustomPersonNumberFilter extends StatelessWidget {
  const CustomPersonNumberFilter({Key? key});

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
          return Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            children: state.filter.personNumberFilters
                .asMap()
                .entries
                .map(
                  (personNumber) => InkWell(
                    onTap: () {
                      

                      context.read<FilterBloc>().add(
                            UpdatePersonNumberFilter(
                              personNumberFilter: state.filter.personNumberFilters[personNumber.key].copyWith(
                                value: !state.filter.personNumberFilters[personNumber.key].value,
                              ),
                            ),
                          );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          width: 1.5,
                          color: state.filter.personNumberFilters[personNumber.key].value ? Colors.white :Colors.black,
                        ),
                        color: state.filter.personNumberFilters[personNumber.key].value ? Colors.grey.shade400 : Colors.white,
                      ),
                      child: Text(
                        state.filter.personNumberFilters[personNumber.key].personNumber.personNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
