import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/image_generator/image_generator_containier_injec.dart';
import 'features/tex_comparitor/text_completin.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final http.Client httpClient = http.Client();

  sl.registerLazySingleton<http.Client>(() => httpClient);

  await textCompletionInjectionContainer();
  await imageGenerationInjectionContainer();
}
