import 'package:chatgpt/features/tex_comparitor/data/model/text_comp.dart';

class TextCompletionModel {
  final num created;
  final List<TextCompletionData> choices;

  TextCompletionModel({required this.created, required this.choices});

  factory TextCompletionModel.fromJson(Map<String, dynamic> json) {
    final textCompletionItems = json['choices'] as List;
    List<TextCompletionData> choices = textCompletionItems
        .map((singleItem) => TextCompletionData.fromJson(singleItem))
        .toList();

    return TextCompletionModel(
      choices: choices,
      created: json['created'],
    );
  }
}
