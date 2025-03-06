import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference_service/data/shared_pref_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textValue = ref.watch(textValueHandlerProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textValue.when(
              data:
                  (val) => Text(
                    "${textValue.value}",
                    style: TextStyle(fontSize: 30),
                  ),
              error: (_, __) => Text("Ошибка", style: TextStyle(fontSize: 30)),
              loading: () => CircularProgressIndicator(),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Имя",
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) => ref.read(textValueHandlerProvider.notifier).updateText(val),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  () =>
                      ref.read(textValueHandlerProvider.notifier).saveText(),
              child: Text("Сохранить"),
            ),
          ],
        ),
      ),
    );
  }
}
