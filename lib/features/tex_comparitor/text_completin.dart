import 'package:chatgpt/features/tex_comparitor/presentaion/cubit/text_comple_cubit.dart';

import '../../injection.dart';
import 'data/remote_data/text_comp_impl.dart';
import 'data/remote_data/text_data_sourse.dart';
import 'data/repositi/text_reposi_impl.dart';
import 'domain/reposities/text_completion_repos.dart';
import 'domain/usecases/text_completion_usecase.dart';

Future<void> textCompletionInjectionContainer() async {
  //Futures bloc
  sl.registerFactory<TextCompletionCubit>(
    () => TextCompletionCubit(
      textCompletionUseCase: sl.call(),
    ),
  );

  //UseCase
  sl.registerLazySingleton<TextCompletionUseCase>(() => TextCompletionUseCase(
        repository: sl.call(),
      ));
  //repository
  sl.registerLazySingleton<TextCompletionRepository>(
      () => TextCompletionRepositoryImpl(
            remoteDataSource: sl.call(),
          ));
  //remote data
  sl.registerLazySingleton<TextCompletionRemoteDataSource>(
      () => TextCompletionRemoteDataSourceImpl(
            httpClient: sl.call(),
          ));
}
