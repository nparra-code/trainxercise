

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photoURL;

  const User({required this.id, this.email, this.name, this.photoURL});

  @override
  List<Object?> get props => [id, email, name, photoURL];

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;
}
