import 'dart:io';

import 'package:ai_app_ollama/src/ollama_base.dart';

void main() async {
  // Create an Ollama instance
  final ollama = Ollama();

  // Generate a response from a model
  while (true) {
    stdout.write('AI Generated prompt:  \n');
    stdout.write('Me: ');
    String? question = stdin.readLineSync()!;
    final response = ollama.generate(question, model: 'mistral');

    if (question == "bye") {
      break;
    }

// Print the response
    stdout.write('Ollama: \n');
    await for (final chunk in response) {
      stdout.write(chunk.text);
    }
  }
  exit(0);
}
