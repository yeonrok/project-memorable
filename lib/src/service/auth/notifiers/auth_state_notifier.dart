import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_memorable/src/service/auth/backend/authenticator.dart';
import 'package:project_memorable/src/service/auth/models/auth_result.dart';
import 'package:project_memorable/src/service/auth/models/auth_state.dart';
import 'package:project_memorable/src/service/posts/typedefs/user_id.dart';
import 'package:project_memorable/src/service/user_info/backend/user_info_storage.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(
        userId: userId,
      );
    }
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  Future<void> saveUserInfo({required UserId userId}) =>
      _userInfoStorage.saveUserInfo(
        userId: userId,
        displayName: _authenticator.displayName,
        email: _authenticator.email,
      );
}
