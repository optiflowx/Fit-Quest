import 'package:fit_quest/core/exceptions/page_state.dart';

class DashboardState {
  final PageState state;
  final DateTime selectedDate;
  final String username;

  DashboardState({
    required this.state,
    required this.selectedDate,
    required this.username,
  });

  DashboardState copyWith({
    PageState? state,
    DateTime? selectedDate,
    String? username,
  }) {
    return DashboardState(
      state: state ?? this.state,
      selectedDate: selectedDate ?? this.selectedDate,
      username: username ?? this.username,
    );
  }

  // Initial State
  factory DashboardState.initial() {
    return DashboardState(
      state: PageState.initial(),
      selectedDate: DateTime.now(),
      username: '',
    );
  }
}
