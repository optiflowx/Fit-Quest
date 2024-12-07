import 'failure.dart';
import 'success.dart';

class PageState {
  final bool isLoading;
  final bool isLoaded;
  final bool isError;

  /// [Failure]
  final Failure? failure;

  /// C [Success]
  final Success? success;

  const PageState({
    this.isLoading = false,
    this.isLoaded = false,
    this.isError = false,
    this.failure,
    this.success,
  });

  /// [loading] factory constructor
  factory PageState.loading() => const PageState(isLoading: true);

  /// [loaded] factory constructor
  factory PageState.success({String? message}) {
    return PageState(
      isLoaded: true,
      success: message != null ? Success(message: message) : null,
    );
  }

  /// [error] factory constructor
  factory PageState.error({
    required String message,
    StackTrace? stackTrace,
  }) {
    return PageState(
      isError: true,
      failure: Failure(message: message, stackTrace: stackTrace),
    );
  }

  // Default factory constructor
  factory PageState.initial() => const PageState();
}
