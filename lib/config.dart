class Config {
  static var huggingFaceApiKey = 'https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.1';

  static String baseUrl(String? flavor) {
    switch (flavor) {
      case 'prod':
        return 'https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.1';
      case 'dev':
      case null:
        return 'https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.1';
    }
    return 'https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.1';
  }
}
