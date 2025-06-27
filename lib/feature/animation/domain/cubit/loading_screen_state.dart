import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_screen_state.freezed.dart';

@freezed
class LoadingScreenState with _$LoadingScreenState {
  const factory LoadingScreenState.initial() = LoadingScreenStateInitial;
  const factory LoadingScreenState.loading() = LoadingScreenStateLoading;
  const factory LoadingScreenState.successfulCollision() = LoadingScreenStateSuccessfulCollision;
  const factory LoadingScreenState.flashSpread() = LoadingScreenStateFlashSpread;
  const factory LoadingScreenState.success() = LoadingScreenStateSuccess;
  const factory LoadingScreenState.error({required String message}) = LoadingScreenStateError;
}
