import '../../data/model/text_model.dart';

abstract class TextCompletionRepository {
  Future<TextCompletionModel> getTextCompletion(String query);
}
