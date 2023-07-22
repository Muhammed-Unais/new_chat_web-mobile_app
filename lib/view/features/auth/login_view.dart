import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/res/components/costum_button.dart';
import 'package:new_chat/res/style/color.dart';
import 'package:new_chat/utils/utils.dart';
import 'package:new_chat/view_model/auth/auth_view_model.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final phoneNumberController = TextEditingController();
  Country? _country;

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _country = country;
        });
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneNumberController.text.trim();

    if (_country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authViewModelProvider)
          .signinWithPhone(context, "+${_country?.phoneCode}$phoneNumber");
    } else {
      Utils.showSnackBar(context: context, content: "Fill out all field");
    }
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Enter Your Phone number"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "New Chat Will need to verify your phone number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: pickCountry,
                  child: const Text("Pick Country"),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("+${_country?.phoneCode ?? 91}"),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextFormField(
                        controller: phoneNumberController,
                        decoration:
                            const InputDecoration(hintText: "phone number"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 90,
                child: CustomButton(
                  text: "NEXT",
                  onPressed: sendPhoneNumber,
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
