import 'package:equatable/equatable.dart';

import '../../data/model/image_model.dart';

abstract class ImageGenerationState extends Equatable {
  const ImageGenerationState();
}

class ImageGenerationInitial extends ImageGenerationState {
  @override
  List<Object> get props => [];
}

class ImageGenerationLoading extends ImageGenerationState {
  @override
  List<Object> get props => [];
}

class ImageGenerationLoaded extends ImageGenerationState {
  final ImageGenerationModel imageGenerationModelData;

  const ImageGenerationLoaded({required this.imageGenerationModelData});
  @override
  List<Object> get props => [];
}

class ImageGenerationFailure extends ImageGenerationState {
  final String? errorMsg;

  const ImageGenerationFailure({this.errorMsg});
  @override
  List<Object> get props => [];
}
