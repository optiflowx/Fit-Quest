import 'package:fit_quest/core/exceptions/page_state.dart';

class SignInState {
  final PageState pageState;
  final bool isLoggedIn;

  SignInState({
    required this.pageState,
    required this.isLoggedIn,
  });

  /// This method is used to update the state without having to
  /// create a new instance of the state
  SignInState copyWith({
    PageState? pageState,
    bool? isLoggedIn,
  }) {
    return SignInState(
      pageState: pageState ?? this.pageState,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  /// Factory constructor that returns a new instance of the state
  factory SignInState.initial() {
    return SignInState(
      pageState: PageState.initial(),
      isLoggedIn: false,
    );
  }
}
