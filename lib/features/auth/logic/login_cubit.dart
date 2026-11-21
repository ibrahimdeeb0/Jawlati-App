import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authnRepo;
  LoginCubit(this.authnRepo) : super(const LoginState.initial());
}
