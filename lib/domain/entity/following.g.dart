// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Following _$FollowingFromJson(Map<String, dynamic> json) => Following(
      login: json['login'] as String,
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$FollowingToJson(Following instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
    };
