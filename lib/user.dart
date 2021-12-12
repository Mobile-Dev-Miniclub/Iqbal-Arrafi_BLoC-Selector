import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String age;
  final String email;
  User({required this.name, required this.age, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age, email];
}
