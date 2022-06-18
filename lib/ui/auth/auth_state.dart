part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isLoginMode;

  AuthState(this.isLoginMode);

  @override
  List<Object> get props => [isLoginMode];
}

class AuthInitial extends AuthState {
  AuthInitial(super.isLoginMode);
}

class AuthSuccess extends AuthState {
  AuthSuccess(super.isLoginMode);
}

class AuthError extends AuthState {
  AuthError(super.isLoginMode);
}

class AuthLoading extends AuthState {
  AuthLoading(super.isLoginMode);
}
