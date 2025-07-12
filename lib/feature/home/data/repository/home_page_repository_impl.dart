import 'package:collider_loading/config.dart';
import 'package:collider_loading/core/domain/repository/api_repository.dart';
import 'package:collider_loading/feature/home/data/repository/home_page_repository.dart';
import 'package:logger_service/logger_service.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  HomePageRepositoryImpl(this._baseApiRepository);

  final BaseApiRepository _baseApiRepository;

  static const _huggingfaceUrl = 'https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.1';
  @override
  Future<String> askHugface(String prompt) async {
    try {
      final responseMap = await _baseApiRepository.basePost(
        _huggingfaceUrl,
        {'inputs': prompt},
        headers: {
          'Authorization': 'Bearer ${Config.huggingFaceApiKey}',
          'Content-Type': 'application/json',
        },
      );

      if (responseMap is List && responseMap.isNotEmpty) {
        final generatedText = responseMap[0]['generated_text'] as String?;
        if (generatedText != null && generatedText.isNotEmpty) {
          return generatedText;
        }
      }

      Log().w('Unexpected response format from HuggingFace: $responseMap');
      return 'No valid response received.';
    } catch (e, stack) {
      Log().e('Failed to get response from HuggingFace', e, stack);
      rethrow;
    }
  }
}
