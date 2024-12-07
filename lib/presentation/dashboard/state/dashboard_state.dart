import 'package:fit_quest/core/exceptions/page_state.dart';

class DashboardState {
  final PageState state;

  DashboardState({required this.state});

  // Initial State
  factory DashboardState.initial() {
    return DashboardState(
      state: PageState.initial(),
    );
  }
}
