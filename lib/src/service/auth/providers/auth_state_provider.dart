import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_memorable/src/service/auth/models/auth_state.dart';
import 'package:project_memorable/src/service/auth/notifiers/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
