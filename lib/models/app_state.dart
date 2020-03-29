import 'package:meta/meta.dart';
import 'package:motivator/models/user.dart';
import 'package:motivator/routes.dart';

@immutable
class AppState {
  final bool isLoading;
  List<String> route;
  final User user;

  AppState({
    this.isLoading = false,
    this.user,
    List<String> route,
  }) {
    if (route != null) {
      this.route = route;
    } else {
      this.route = [this.user != null ? Routes.home : Routes.login];
    }
  }

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<String> route,
    User user,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      route: route ?? this.route,
      user: user ?? this.user,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      route.hashCode ^
      user.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              route == other.route &&
              user == other.user;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, route: $route, user: $user}';
  }
}
