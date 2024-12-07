import 'package:fit_quest/core/exceptions/page_state.dart';

class SignUpState {
  final PageState pageState;
  final bool isLoggedIn;

  SignUpState({
    required this.pageState,
    required this.isLoggedIn,
  });

  /// This method is used to update the state without having to
  /// create a new instance of the state
  SignUpState copyWith({
    PageState? pageState,
    bool? isLoggedIn,
  }) {
    return SignUpState(
      pageState: pageState ?? this.pageState,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  /// Factory constructor that returns a new instance of the state
  factory SignUpState.initial() {
    return SignUpState(
      pageState: PageState.initial(),
      isLoggedIn: false,
    );
  }
}
