part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<UserModel> data;

  UserLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class UserFailure extends UserState {
  final String message;

  UserFailure(this.message);
  @override
  List<Object> get props => [message];
}
