import '../../domain/repositories/image_gen_repos.dart';
import '../model/image_model.dart';
import '../remote_data/image_generator_data_sourse.dart';

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  final ImageGenerationRemoteDataSource remoteDataSource;

  ImageGenerationRepositoryImpl({required this.remoteDataSource});

  @override
  // ignore: override_on_non_overriding_member
  Future<ImageGenerationModel> getGenerateImages(String query) async =>
      remoteDataSource.getGenerateImages(query);
}
