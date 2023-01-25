import '../../data/model/text_model.dart';
import '../reposities/text_completion_repos.dart';

class TextCompletionUseCase {
  final TextCompletionRepository repository;

  TextCompletionUseCase({required this.repository});

  Future<TextCompletionModel> call(String query) async {
    return repository.getTextCompletion(query);
  }
}
