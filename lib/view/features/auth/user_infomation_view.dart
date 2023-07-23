import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/utils/constants/image.dart';
import 'package:new_chat/utils/utils.dart';
import 'package:new_chat/view_model/auth/auth_view_model.dart';

class UserInformationView extends ConsumerStatefulWidget {
  const UserInformationView({super.key});

  @override
  ConsumerState<UserInformationView> createState() =>
      _UserInformationViewState();
}

class _UserInformationViewState extends ConsumerState<UserInformationView> {
  TextEditingController userNameController = TextEditingController();

  File? image;
  
  void pickeImage() async {
    image = await Utils.pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() {
    String name = userNameController.text;
    if (name.isNotEmpty) {
      ref
          .read(authViewModelProvider)
          .saveUserDataToFirebase(context, name, image);
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Stack(
                children: [
                  image == null
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(
                            ConstImage.defaultImage,
                          ),
                          radius: 60,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(image!),
                          radius: 60,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: pickeImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: storeUserData,
                    icon: const Icon(Icons.done),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
