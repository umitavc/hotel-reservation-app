// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterImpl _$$FilterImplFromJson(Map<String, dynamic> json) => _$FilterImpl(
      resultMessage: ResultMessage.fromJson(
          json['result_message'] as Map<String, dynamic>),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FilterImplToJson(_$FilterImpl instance) =>
    <String, dynamic>{
      'result_message': instance.resultMessage.toJson(),
      'result': instance.result.toJson(),
    };

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      filter: (json['filter'] as List<dynamic>)
          .map((e) => Sort.fromJson(e as Map<String, dynamic>))
          .toList(),
      sort: Sort.fromJson(json['sort'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'filter': instance.filter.map((e) => e.toJson()).toList(),
      'sort': instance.sort.toJson(),
    };

_$SortImpl _$$SortImplFromJson(Map<String, dynamic> json) => _$SortImpl(
      sectionName: json['sectionName'] as String,
      type: json['type'] as String,
      col: json['col'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SortImplToJson(_$SortImpl instance) =>
    <String, dynamic>{
      'sectionName': instance.sectionName,
      'type': instance.type,
      'col': instance.col,
      'values': instance.values.map((e) => e.toJson()).toList(),
    };

_$ValueImpl _$$ValueImplFromJson(Map<String, dynamic> json) => _$ValueImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool,
      col: json['col'] as String?,
    );

Map<String, dynamic> _$$ValueImplToJson(_$ValueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelected': instance.isSelected,
      'col': instance.col,
    };

_$ResultMessageImpl _$$ResultMessageImplFromJson(Map<String, dynamic> json) =>
    _$ResultMessageImpl(
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ResultMessageImplToJson(_$ResultMessageImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
    };
