import 'dart:io';

import 'package:ai_app/src/ollama_base.dart';

void main() async {
  // Create an Ollama instance
  final ollama = Ollama();

  // Generate a response from a model
  while (true) {
    stdout.write('AI Generated prompt:  \n');
    stdout.write('Query: ');
    String? question = stdin.readLineSync()!;
    final response = await ollama.generate(question, model: 'mistral');

    if (question == "bye") {
      break;
    }

// Print the response
    stdout.write('Answer: \n');
    await for (final chunk in response) {
      stdout.write(chunk.text);
    }
  }
  exit(0);
}
