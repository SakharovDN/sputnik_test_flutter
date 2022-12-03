import 'package:json_annotation/json_annotation.dart';

part 'following.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Following {
  String login;
  int id;
  String avatarUrl;

  Following({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  factory Following.fromJson(Map<String, dynamic> json) => _$FollowingFromJson(json);

  Map<String, dynamic> toJson() => _$FollowingToJson(this);
}
