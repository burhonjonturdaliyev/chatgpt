import '../../../../core/custom_extensions.dart';
import '../../domain/usecases/image_gene_uses.dart';

import 'dart:io';
import 'package:bloc/bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';

import 'image_generate_state.dart';

class ImageGenerationCubit extends Cubit<ImageGenerationState> {
  final ImageGenerationUseCase imageGenerationUseCase;
  ImageGenerationCubit({required this.imageGenerationUseCase})
      : super(ImageGenerationInitial());

  Future<void> imagesGenerate({required String query}) async {
    emit(ImageGenerationLoading());
    try {
      final imageGenerationModelData = await imageGenerationUseCase.call(query);
      emit(ImageGenerationLoaded(
          imageGenerationModelData: imageGenerationModelData));
    } on SocketException catch (e) {
      emit(ImageGenerationFailure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(ImageGenerationFailure(errorMsg: e.message));
    }
  }
}
