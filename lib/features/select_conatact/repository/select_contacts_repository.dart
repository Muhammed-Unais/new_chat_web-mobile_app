import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/features/auth/model/user_model.dart';
import 'package:new_chat/utils/routes/routes_name.dart';
import 'package:new_chat/utils/utils.dart';

final selectContactRepositoryProvider = Provider((ref) {
  return SelectContactRepository(firestore: FirebaseFirestore.instance);
});

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({required this.firestore});

  Future<List<Contact>> getConatcts() async {
    List<Contact> conatacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        conatacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return conatacts;
  }

  void selcetContact(Contact selcetedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('user').get();
      bool isFound = false;

      for (var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());

        RegExp regExp = RegExp(r'[ -]');
        var selectedContactNumber =
            selcetedContact.phones[0].number.replaceAll(regExp, "");

        if ("+91$selectedContactNumber" == userData.phoneNumber ||
            selectedContactNumber == userData.phoneNumber) {
          isFound = true;
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(
            context,
            RoutesName.mobileChatScreen,
            arguments: <String, dynamic>{
              "name": userData.name,
              "uid": userData.uid
            },
          );
        }

        if (!isFound) {
          // ignore: use_build_context_synchronously
          Utils.showSnackBar(
              context: context,
              content: "This number does not exist on this app");
        }
      }
    } catch (e) {
      Utils.showSnackBar(context: context, content: e.toString());
    }
  }
}
