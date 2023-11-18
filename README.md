Ollama ai application library for dart and flutter

uses:

Get up and running with large language models locally.

Linux: 

curl https://ollama.ai/install.sh | sh

Quickstart:

To run and chat with Llama 2:

ollama run llama2


Model library
Ollama supports a list of open-source models available on ollama.ai/library

Here are some example open-source models that can be downloaded:

Model	Parameters	Size	Download
Mistral	7B	4.1GB	ollama run mistral
Llama 2	7B	3.8GB	ollama run llama2

If you want to generate response from a model, you can use the ask method. This method takes a prompt and a model name, and returns a CompletionChunk object.


void main() async {
  // Create an Ollama instance
  final ollama = Ollama();

  // Generate a response from a model
  final response = await ollama.ask('Tell me about llamas', model: 'llama2');

  // Print the response
  print(response.text);
}


Stream responses can be generated using the generate method. This method takes a prompt and a model name, and returns a Stream<CompletionChunk>.


void main() async {
  // Create an Ollama instance
  final ollama = Ollama();

  // Generate a response from a model
  final response = ollama.generate('Tell me about llamas', model: 'llama2');

  // Print the response
  await for (final chunk in response) {
    stdout.write(chunk.text);
  }
}
