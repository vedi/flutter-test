import 'package:meta/meta.dart';
import 'package:motivator/models/user.dart';

@immutable
class AppState {
  final bool isLoading;
  final User user;

  AppState({
    this.isLoading = false,
    this.user,
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      user.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, user: $user}';
  }
}
