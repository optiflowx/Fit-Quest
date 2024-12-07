import 'package:firebase_core/firebase_core.dart';
import 'package:fit_quest/app/app.dart';
import 'package:fit_quest/firebase_options_original.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'fitQuest',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FitQuestApp());
}
