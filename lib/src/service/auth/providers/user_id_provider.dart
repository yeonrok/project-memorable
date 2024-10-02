import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_memorable/src/service/auth/providers/auth_state_provider.dart';
import 'package:project_memorable/src/service/posts/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
