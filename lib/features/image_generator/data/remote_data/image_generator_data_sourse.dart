import '../model/image_model.dart';

abstract class ImageGenerationRemoteDataSource {
  Future<ImageGenerationModel> getGenerateImages(String query);
}
