import 'package:fit_quest/core/repository/authentication_repository.dart';
import 'package:fit_quest/presentation/dashboard/state/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  final _authRepository = AuthenticationRepository();

  void init() async {
    final user = await _authRepository.getCurrentUser();

    emit(state.copyWith(username: user?.displayName ?? ''));
  }

  void onDateChange(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }
}
