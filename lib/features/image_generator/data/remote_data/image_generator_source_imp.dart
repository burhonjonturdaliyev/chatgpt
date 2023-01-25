// ignore_for_file: prefer_const_declarations

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/custom_extensions.dart';
import '../../../../core/open_ai_data.dart';
import '../../../global/provider/provider.dart';
import '../model/image_model.dart';
import 'image_generator_data_sourse.dart';

class ImageGenerationRemoteDataSourceImpl
    implements ImageGenerationRemoteDataSource {
  final http.Client httpClient;

  ImageGenerationRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<ImageGenerationModel> getGenerateImages(String query) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final String _endPoint = "images/generations";

    // ['256x256', '512x512', '1024x1024']
    Map<String, dynamic> rowParams = {
      "n": 10,
      "size": "256x256",
      "prompt": query,
    };

    final encodedParams = json.encode(rowParams);

    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encodedParams,
      headers: headerBearerOption(OPEN_AI_KEY),
    );

    if (response.statusCode == 200) {
      return ImageGenerationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Image Generation Server Exception");
    }
  }
}
