import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hotel_reservation_app/core/data/models/hotel_model.dart';
import 'package:hotel_reservation_app/core/data/models/filter_model.dart';
import 'package:hotel_reservation_app/core/data/models/new_filter_model/new_filter_model.dart' as newFilter;
import 'dart:convert';

import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenLoading()) {
    on<HomeScreenEvent>((event, emit) async {
      if (event is FetchDataEvent) {
        await _fetchData(emit,filter: event.filter);
      }
     
    });
  }

    Future<void> _fetchData(Emitter<HomeScreenState> emit,{Filter? filter})async{
        try {
        // await _test();
         //return;
          emit(HomeScreenLoading());
        await readJson();
       
        emit(DataLoadedState (filteredHotelList(filter: filter)));
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    }


  List<Hotel> items = List<Hotel>.empty(growable: true);

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assets/json/hotel.json");
    final data = await json.decode(response);

    items = (data["items"] as List).map((data) =>
        Hotel.fromJson(data as Map<String, dynamic>)).toList();
  }

  List<Hotel> filteredHotelList({Filter? filter}) {
    if (filter != null &&
        (filter.categoryFilters.any((element) => element.value) ||
            filter.personNumberFilters.any((element) => element.value))) {
      final categoryFilter =
          filter.categoryFilters.where((element) => element.value == true);
      final personFilter =
          filter.personNumberFilters.where((element) => element.value == true);
      return items.where((hotel) {
        final bool eachOtherOK = (categoryFilter.isEmpty
                ? true
                : categoryFilter.any(
                    (cf) => cf.category.roomType == hotel.roomType)) &&
            (personFilter.isEmpty
                ? true
                : personFilter.any(
                    (pf) => pf.personNumber.personNumberEnum ==
                        hotel.personNumber));

        if (eachOtherOK) {
          return true;
        } else {
          return categoryFilter.isNotEmpty &&
              (personFilter.isEmpty
                  ? false
                  : personFilter.any((pf) =>
                      pf.personNumber.personNumberEnum == hotel.personNumber));
        }
      }).toList();
    } else {
      return items;
    }
  }



  Future<void> _test ()async
  {

    try {
      final   data = await json.decode(_testdata);


      final filter =newFilter.Filter.fromJson(data);


      print(filter.resultMessage.toJson());
      print(filter.result .toJson());


      print(filter.result.filter.map((e) => print(e.sectionName + "\n")));


      filter.result.filter.map((e) => Column(
        children: [
          Text(e.sectionName),
          Wrap(
            children: e.values.map((e) => Text(e.name)).toList(),
          ),
        ],
      )).toList();

    } catch (e) {
      debugPrint(e.toString());
    }
  } 




  String get _testdata => """{
  "result_message" : {
    "type" : "success",
    "title" : "Bilgi",
    "message" : "Başarılı"
  },
  "result" : {
    "filter" : [
      {
        "sectionName" : "Etkinlik Çeşidi",
        "type" : "single",
        "col" : "tag",
        "values" : [
          {
            "id" : "finansal",
            "name" : "Finansal",
            "isSelected" : false
          },
          {
            "id" : "teknoloji",
            "name" : "Teknoloji",
            "isSelected" : false
          },
          {
            "id" : "yasam",
            "name" : "Yaşam",
            "isSelected" : false
          },
          {
            "id" : "cocuklar",
            "name" : "Çocuklar",
            "isSelected" : false
          },
          {
            "id" : "saglik",
            "name" : "Sağlık",
            "isSelected" : false
          }
        ]
      },
      {
        "sectionName" : "Bilet Fiyatı",
        "type" : "multi",
        "col" : "price",
        "values" : [
          {
            "id" : "0",
            "name" : "0₺",
            "isSelected" : false
          },
          {
            "id" : "1",
            "name" : "1₺",
            "isSelected" : false
          },
          {
            "id" : "2",
            "name" : "2₺",
            "isSelected" : false
          },
          {
            "id" : "3",
            "name" : "3₺",
            "isSelected" : false
          },
          {
            "id" : "5",
            "name" : "5₺",
            "isSelected" : false
          },
          {
            "id" : "10",
            "name" : "10₺",
            "isSelected" : false
          },
          {
            "id" : "12",
            "name" : "12₺",
            "isSelected" : false
          },
          {
            "id" : "30",
            "name" : "30₺",
            "isSelected" : false
          },
          {
            "id" : "40",
            "name" : "40₺",
            "isSelected" : false
          },
          {
            "id" : "50",
            "name" : "50₺",
            "isSelected" : false
          },
          {
            "id" : "80",
            "name" : "80₺",
            "isSelected" : false
          },
          {
            "id" : "123",
            "name" : "123₺",
            "isSelected" : false
          },
          {
            "id" : "500",
            "name" : "500₺",
            "isSelected" : false
          }
        ]
      }
    ],
    "sort" : {
      "sectionName" : "Sırala",
      "type" : "single",
      "col" : "startTime",
      "values" : [
        {
          "isSelected" : true,
          "id" : "startTime",
          "name" : "Tarihe Göre Artan",
          "col" : "startTime"
        },
        {
          "isSelected" : false,
          "id" : "-startTime",
          "name" : "Tarihe Göre Azalan",
          "col" : "startTime"
        }
   ]
}
}
}""";
}