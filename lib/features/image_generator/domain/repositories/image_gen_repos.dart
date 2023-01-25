import '../../data/model/image_model.dart';

abstract class ImageGenerationRepository {
  Future<ImageGenerationModel> getGenerateImages(String query);
}
