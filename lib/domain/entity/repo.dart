import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Repo {
  String name;
  int id;
  int stargazersCount;
  int forksCount;

  Repo({
    required this.name,
    required this.id,
    required this.stargazersCount,
    required this.forksCount,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
