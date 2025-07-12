import 'package:collider_loading/feature/home/data/repository/home_page_repository.dart';
import 'package:collider_loading/feature/home/domain/cubit/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._homePageRepository) : super(const HomePageState.initial());

  final HomePageRepository _homePageRepository;

  Future<void> askAi({required String prompt}) async {
    emit(const HomePageState.loading());
    try {
      final response = await _homePageRepository.askHugface(prompt);
      if (response.isNotEmpty && response != null) {
        emit(HomePageState.success(response: response));
      } else {
        emit(const HomePageState.error(message: 'Empty response from AI'));
      }
    } catch (e) {
      emit(HomePageState.error(message: 'Error: ${e.toString()}'));
    }
  }
}
