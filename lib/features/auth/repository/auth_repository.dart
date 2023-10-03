import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/data/firebase_strorage.dart';
import 'package:new_chat/features/auth/model/user_model.dart';
import 'package:new_chat/utils/constants/image.dart';
import 'package:new_chat/utils/responsive/responsive.dart';
import 'package:new_chat/utils/routes/routes_name.dart';
import 'package:new_chat/utils/utils.dart';
import 'package:new_chat/features/mobile/mobile_layout.dart';
import 'package:new_chat/features/web/web_layout.dart';

final authrepositoryProvider = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository(this.auth, this.firestore);

  Future<UserModel?> getCurrentUserData() async {

    var userData =
        await firestore.collection('user').doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

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

  void saveUserDataTOFireBase(
      {required String name,
      required File? profilePic,
      required ProviderRef ref,
      required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = ConstImage.defaultImage;

      if (profilePic != null) {
        photoUrl = await ref
            .read(fireBaseStoragesProvider)
            .storeFileToFireBase("profilePic/$uid", profilePic);
      }

      var user = UserModel(
          name: name,
          uid: uid,
          profilePic: photoUrl,
          isOnline: true,
          phoneNumber: auth.currentUser!.phoneNumber!,
          groupId: []);

      await firestore.collection('user').doc(uid).set(user.toMap());

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const ResponsiveLayout(
          webLayout: WebLayout(),
          mobileLayout: MobileLayout(),
        );
      }), (route) => false);
    } catch (e) {
      Utils.showSnackBar(context: context, content: e.toString());
    }
  }

  Stream<UserModel> userData(String userId){
    return firestore.collection('user').doc(userId).snapshots().map((event) {
      return UserModel.fromMap(event.data()!);
    });
  } 
}
