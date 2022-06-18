part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthButtonIsClicked extends AuthEvent {
  final String username;
  final String password;

  const AuthButtonIsClicked(this.username, this.password);
}

class AuthModeChangeIsClicked extends AuthEvent {}

class AuthStarted extends AuthEvent {}
