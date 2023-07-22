import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/repository/auth_repository.dart';

final authViewModelProvider = Provider((ref) {
  final authRepository = ref.watch(authrepositoryProvider);
  return AuthViewModel(authRepository: authRepository);
});

class AuthViewModel {
  final AuthRepository authRepository;

  AuthViewModel({required this.authRepository});

  void signinWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signinWithPhone(context, phoneNumber);
  }

  void verfiyOTP(BuildContext context, String userOtp, String verificationId) {
    authRepository.verfiyOTP(
      context,
      userOtp,
      verificationId,
    );
  }
}
