import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool isLoginMode;


  AuthBloc({required this.isLoginMode}) : super(AuthInitial(isLoginMode)) {
    on<AuthEvent>((event, emit) {
   /*   if(event is AuthButtonIsClicked){
        emit(AuthLoading(isLoginMode));
        if()
      }*/

    });
  }
}
