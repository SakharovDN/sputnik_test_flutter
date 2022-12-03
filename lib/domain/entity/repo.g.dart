// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo(
      name: json['name'] as String,
      id: json['id'] as int,
      stargazersCount: json['stargazers_count'] as int,
      forksCount: json['forks_count'] as int,
    );

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'stargazers_count': instance.stargazersCount,
      'forks_count': instance.forksCount,
    };
