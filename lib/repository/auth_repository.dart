import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/utils/routes/routes_name.dart';
import 'package:new_chat/utils/utils.dart';

final authrepositoryProvider = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository(this.auth, this.firestore);

  void signinWithPhone(BuildContext context, String phoneNumber) async {
    try {
      auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException error) {
          log(error.message!);
          throw Exception(error.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.pushNamed(context, RoutesName.otpScreen,
              arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.message ?? "Unknown Error",
      );
    }
  }

  void verfiyOTP(
      BuildContext context, String userOtp, String verficationId) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verficationId, smsCode: userOtp);
      await auth.signInWithCredential(phoneAuthCredential);
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.userInformationScreen, (route) => false);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(
        context: context,
        content: e.message ?? "Unknown Error",
      );
    }
  }
}
