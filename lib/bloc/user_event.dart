part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class ChangeNameEvent extends UserEvent {
  final String name;
  ChangeNameEvent(this.name);
}

class ChangeBirthdayEvent extends UserEvent {
  final String age;
  ChangeBirthdayEvent(this.age);
}

class ChangeEmailEvent extends UserEvent {
  final String email;
  ChangeEmailEvent(this.email);
}
