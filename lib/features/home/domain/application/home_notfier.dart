import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final int selectedSection;
  final bool isLoading;
  final String error;

  const HomeState({
    this.selectedSection = 0,
    this.isLoading = false,
    this.error = '',
  });

  HomeState copyWith({
    int? selectedSection,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      selectedSection: selectedSection ?? this.selectedSection,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.selectedSection == selectedSection &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  @override
  int get hashCode =>
      selectedSection.hashCode ^ isLoading.hashCode ^ error.hashCode;
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
      (ref) => HomeNotifier(),
);

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  void selectSection(int index) {
    state = state.copyWith(selectedSection: index);
  }

  Future<void> loadData() async {
    try {
      state = state.copyWith(isLoading: true, error: '');
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void clearError() {
    state = state.copyWith(error: '');
  }
}