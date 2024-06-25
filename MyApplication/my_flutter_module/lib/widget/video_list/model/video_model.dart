import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  String picImage = '';
  String url = '';
  int playCount = 0;

  VideoModel(this.picImage, this.url, this.playCount);

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

  Map<String, dynamic> toJson(VideoModel model) => _$VideoModelToJson(model);
}
