// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      json['pic'] as String,
      json['url'] as String,
      json['playCount'] as int,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'pic': instance.picImage,
      'url': instance.url,
      'playCount': instance.playCount,
    };
