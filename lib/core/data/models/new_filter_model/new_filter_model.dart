import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'new_filter_model.freezed.dart';
part 'new_filter_model.g.dart';

@freezed
class Filter with _$Filter {
    const factory Filter({
        @JsonKey(name: "result_message")
        required ResultMessage resultMessage,
        @JsonKey(name: "result")
        required Result result,
    }) = _Filter;

    factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}

@freezed
class Result with _$Result {
    const factory Result({
        @JsonKey(name: "filter")
        required List<Sort> filter,
        @JsonKey(name: "sort")
        required Sort sort,
    }) = _Result;

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Sort with _$Sort {
    const factory Sort({
        @JsonKey(name: "sectionName")
        required String sectionName,
        @JsonKey(name: "type")
        required String type,
        @JsonKey(name: "col")
        required String col,
        @JsonKey(name: "values")
        required List<Value> values,
    }) = _Sort;

    factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
}

@freezed
class Value with _$Value {
    const factory Value({
        @JsonKey(name: "id")
        required String id,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "isSelected")
        required bool isSelected,
        @JsonKey(name: "col")
        String? col,
    }) = _Value;

    factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@freezed
class ResultMessage with _$ResultMessage {
    const factory ResultMessage({
        @JsonKey(name: "type")
        required String type,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "message")
        required String message,
    }) = _ResultMessage;

    factory ResultMessage.fromJson(Map<String, dynamic> json) => _$ResultMessageFromJson(json);
}
