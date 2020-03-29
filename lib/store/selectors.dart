import '../models/app_state.dart';
import '../models/user.dart';

User getUser(AppState state) => state.user;
bool isAuthenticated(AppState state) => state.user != null;
