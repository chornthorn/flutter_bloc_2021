import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_2021/data/models/user_model.dart';
import 'package:flutter_bloc_2021/data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  final UserRepository userRepository = new UserRepository();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUserEvent) {
      yield UserLoading();
      try {
        final res = await userRepository.getUserList();
        yield UserLoaded(res);
      } catch (e) {
        yield UserFailure("User can'!");
      }
    }
  }
}
