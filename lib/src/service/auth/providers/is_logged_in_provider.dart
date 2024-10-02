import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_memorable/src/service/auth/models/auth_result.dart';
import 'package:project_memorable/src/service/auth/providers/auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});
