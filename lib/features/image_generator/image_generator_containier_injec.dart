import 'package:chatgpt/features/image_generator/data/remote_data/image_generator_source_imp.dart';
import 'package:chatgpt/features/image_generator/presentation/cubit/image_generate_cubit.dart';

import '../../injection.dart';
import 'data/remote_data/image_generator_data_sourse.dart';
import 'data/repositories/image_generator_repository_imp.dart';
import 'domain/repositories/image_gen_repos.dart';
import 'domain/usecases/image_gene_uses.dart';

Future<void> imageGenerationInjectionContainer() async {
  //Futures bloc
  sl.registerFactory<ImageGenerationCubit>(
    () => ImageGenerationCubit(
      imageGenerationUseCase: sl.call(),
    ),
  );

  //UseCase
  sl.registerLazySingleton<ImageGenerationUseCase>(() => ImageGenerationUseCase(
        repository: sl.call(),
      ));
  //repository
  sl.registerLazySingleton<ImageGenerationRepository>(
      () => ImageGenerationRepositoryImpl(
            remoteDataSource: sl.call(),
          ));
  //remote data
  sl.registerLazySingleton<ImageGenerationRemoteDataSource>(
      () => ImageGenerationRemoteDataSourceImpl(
            httpClient: sl.call(),
          ));
}
