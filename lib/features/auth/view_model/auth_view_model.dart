import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/features/auth/model/user_model.dart';
import 'package:new_chat/features/auth/repository/auth_repository.dart';

final authViewModelProvider = Provider((ref) {
  final authRepository = ref.watch(authrepositoryProvider);
  return AuthViewModel(authRepository: authRepository, ref: ref);
});

final userDataAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authViewModelProvider);
  return authController.getUserData();
});

class AuthViewModel {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthViewModel({required this.ref, required this.authRepository});

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepository.getCurrentUserData();
    return user;
  }

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

  void saveUserDataToFirebase(BuildContext context, String name, File? pic) {
    authRepository.saveUserDataTOFireBase(
      name: name,
      profilePic: pic,
      ref: ref,
      context: context,
    );
  }

  Stream<UserModel> userDataById(String userId) {
    return authRepository.userData(userId);
  }
}
