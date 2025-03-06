import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference_service/features/text_saver/data/providers/shared_pref_provider.dart';
import 'package:shared_preference_service/features/text_saver/presentations/pages/text_saver_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TextSaverPage());
  }
}


