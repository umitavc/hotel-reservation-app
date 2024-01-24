import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_bloc.dart';
import 'package:hotel_reservation_app/features/hotel_filter_screen/bloc/filter_state.dart';

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
            runSpacing: 10,
            alignment: WrapAlignment.start,
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
                      
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          width: 1.5,
                          color: state.filter.personNumberFilters[personNumber.key].value ? Colors.white :Colors.black,
                        ),
                        color: state.filter.personNumberFilters[personNumber.key].value ? Colors.grey.shade400 : Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                        child: Text(
                          state.filter.personNumberFilters[personNumber.key].personNumber.personNumber,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
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
