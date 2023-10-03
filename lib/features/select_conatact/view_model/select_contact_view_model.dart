import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/features/select_conatact/repository/select_contacts_repository.dart';

final getContactsPViewModel = FutureProvider((ref) {
  final selectContactsRespository = ref.watch(selectContactRepositoryProvider);
  return selectContactsRespository.getConatcts();
});

final selectContactViewModel = Provider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return SelectContactsViewModel(ref, selectContactRepository);
});

class SelectContactsViewModel {
  final ProviderRef ref;
  final SelectContactRepository selectContactRepository;

  SelectContactsViewModel(this.ref, this.selectContactRepository);

  void selectConatacts(Contact selectedContact, BuildContext context) {
    selectContactRepository.selcetContact(selectedContact, context);
  }
}
