// ignore_for_file: override_on_non_overriding_member

import '../../domain/reposities/text_completion_repos.dart';
import '../model/text_model.dart';
import '../remote_data/text_data_sourse.dart';

class TextCompletionRepositoryImpl implements TextCompletionRepository {
  final TextCompletionRemoteDataSource remoteDataSource;

  TextCompletionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async =>
      remoteDataSource.getTextCompletion(query);
}
