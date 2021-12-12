import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter_bloc_selector/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is ChangeNameEvent) {
      yield UserLoaded(User(name: event.name, age: state.user.age, email: state.user.email));
    } else if (event is ChangeBirthdayEvent) {
      yield UserLoaded(User(name: state.user.name, age: event.age, email: state.user.email));
    } else if (event is ChangeEmailEvent) {
      yield UserLoaded(User(name: state.user.name, age: state.user.age, email: event.email));
    }
  }
}
