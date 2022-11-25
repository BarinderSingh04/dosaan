import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

final userProvider = StateProvider<User?>((ref) => null);

@JsonSerializable()
class User {
  final String name;
  final int id;
  final String email;

  User(this.name, this.id, this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
