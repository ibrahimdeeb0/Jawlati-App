import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/logic/login_state.dart';
import '../data/repo/home_repo.dart';

class HomeCubit extends Cubit<LoginState> {
  final HomeRepo authnRepo;
  HomeCubit(this.authnRepo) : super(const LoginState.initial());
}
