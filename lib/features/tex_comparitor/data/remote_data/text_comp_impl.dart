// ignore_for_file: override_on_non_overriding_member, prefer_const_declarations

import 'dart:convert';

import 'package:chatgpt/features/tex_comparitor/data/remote_data/text_data_sourse.dart';
import 'package:http/http.dart' as http;

import '../../../../core/custom_extensions.dart';
import '../../../../core/open_ai_data.dart';
import '../../../global/provider/provider.dart';
import '../model/text_model.dart';

class TextCompletionRemoteDataSourceImpl
    implements TextCompletionRemoteDataSource {
  final http.Client httpClient;

  TextCompletionRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final String _endPoint = "completions";

    Map<String, String> rowParams = {
      "model": "text-davinci-003",
      "prompt": query,
    };

    final encodedParams = json.encode(rowParams);

    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encodedParams,
      headers: headerBearerOption(OPEN_AI_KEY),
    );

    if (response.statusCode == 200) {
      return TextCompletionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Text Completion Server Exception");
    }
  }
}
