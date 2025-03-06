import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preference_service/features/text_saver/data/providers/shared_pref_provider.dart';

class TextSaverPage extends ConsumerWidget {
  const TextSaverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textValue = ref.watch(textValueHandlerProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textValue.when(
              data: (val) => Text(val, style: TextStyle(fontSize: 30)),
              error: (_, __) => Text("Ошибка", style: TextStyle(fontSize: 30)),
              loading: () => CircularProgressIndicator(),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Имя",
                  border: OutlineInputBorder(),
                ),
                onChanged:
                    (val) => ref
                        .read(textValueHandlerProvider.notifier)
                        .updateText(val),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  () => ref.read(textValueHandlerProvider.notifier).saveText(),
              child: Text("Сохранить"),
            ),
          ],
        ),
      ),
    );
  }
}
