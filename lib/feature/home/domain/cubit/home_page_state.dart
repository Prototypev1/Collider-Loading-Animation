import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
sealed class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = HomePageStateInitial;
  const factory HomePageState.loading() = HomePageStateLoading;
  const factory HomePageState.success({required String response}) = HomePageStateSuccess;
  const factory HomePageState.error({required String message}) = HomePageStateError;
}
