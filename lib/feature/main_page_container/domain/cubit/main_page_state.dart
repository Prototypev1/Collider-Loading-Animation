import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_state.freezed.dart';

@freezed
sealed class MainPageState with _$MainPageState {
  const factory MainPageState.initial({required int page}) = MainPageStateInitial;
  const factory MainPageState.loading({required int page}) = MainPageStateLoading;
  const factory MainPageState.ready({required int page}) = MainPageStateReady;
  const factory MainPageState.success({required int page}) = MainPageStateSuccess;
  const factory MainPageState.error({required String message, required int page}) = MainPageStateError;
}
