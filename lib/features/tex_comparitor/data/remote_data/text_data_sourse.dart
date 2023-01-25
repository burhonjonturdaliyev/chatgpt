import '../model/text_model.dart';

abstract class TextCompletionRemoteDataSource {
  Future<TextCompletionModel> getTextCompletion(String query);
}
