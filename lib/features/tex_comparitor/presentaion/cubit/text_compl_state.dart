// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

import '../../data/model/text_model.dart';

abstract class TextCompletionState extends Equatable {
  const TextCompletionState();
}

class TextCompletionInitial extends TextCompletionState {
  @override
  List<Object> get props => [];
}

class TextCompletionLoading extends TextCompletionState {
  @override
  List<Object> get props => [];
}

class TextCompletionLoaded extends TextCompletionState {
  final TextCompletionModel textCompletionModelData;

  TextCompletionLoaded({required this.textCompletionModelData});
  @override
  List<Object> get props => [];
}

class TextCompletionFailure extends TextCompletionState {
  final String? errorMsg;

  TextCompletionFailure({this.errorMsg});
  @override
  List<Object> get props => [];
}
