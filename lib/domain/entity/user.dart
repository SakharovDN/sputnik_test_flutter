import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  String login;
  int id;
  String avatarUrl;
  String? name;
  String? company;
  String? email;
  String? bio;

  User({
    required this.login,
    required this.id,
    required this.avatarUrl,
    this.name,
    this.company,
    this.email,
    this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
