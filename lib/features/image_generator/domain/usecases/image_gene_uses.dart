import '../../data/model/image_model.dart';
import '../repositories/image_gen_repos.dart';

class ImageGenerationUseCase {
  final ImageGenerationRepository repository;

  ImageGenerationUseCase({required this.repository});

  Future<ImageGenerationModel> call(String query) async {
    return repository.getGenerateImages(query);
  }
}
