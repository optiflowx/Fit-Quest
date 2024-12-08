import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpWidget({
    required Widget widget,
    List<BlocProvider> mockProviders = const [],
  }) {
    return pumpWidget(
      widget: MaterialApp(
        home: MultiBlocProvider(
          providers: mockProviders,
          child: Scaffold(
            body: widget,
          ),
        ),
      ),
    );
  }
}
