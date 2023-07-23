import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/view_model/auth/auth_view_model.dart';

class OTPView extends ConsumerWidget {
  const OTPView({super.key, required this.verficationId});
  final String verficationId;

  void verfiyOtp(WidgetRef ref, BuildContext context, String userOtp) {
    ref.read(authViewModelProvider).verfiyOTP(context, userOtp, verficationId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verifying your number"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("We have sent an SMS with a code"),
            SizedBox(
              width: size.width * 0.5,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "- - - - - -",
                  hintStyle: TextStyle(fontSize: 40),
                  helperStyle: TextStyle(fontSize: 30),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    verfiyOtp(ref, context, value.trim());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
