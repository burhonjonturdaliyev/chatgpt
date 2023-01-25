class TextCompletionData {
  final String text;
  final num index;
  // ignore: non_constant_identifier_names
  final String finish_reason;

  // ignore: non_constant_identifier_names
  TextCompletionData(
      // ignore: non_constant_identifier_names
      {required this.text,
      required this.index,
      // ignore: non_constant_identifier_names
      required this.finish_reason});

  factory TextCompletionData.fromJson(Map<String, dynamic> json) {
    return TextCompletionData(
      text: json['text'],
      index: json['index'],
      finish_reason: json['finish_reason'],
    );
  }
}
