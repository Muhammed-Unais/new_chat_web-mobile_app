import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_chat/res/components/error_component.dart';
import 'package:new_chat/res/components/loading.dart';
import 'package:new_chat/features/select_conatact/view_model/select_contact_view_model.dart';

class SelectContactsView extends ConsumerWidget {
  const SelectContactsView({super.key});

  void selectConatact(
      WidgetRef ref, Contact selectedContact, BuildContext context) {
    ref.read(selectContactViewModel).selectConatacts(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contacts"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ref.watch(getContactsPViewModel).when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final contact = data[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(contact.displayName),
                  leading: contact.photo == null
                      ? null
                      : CircleAvatar(
                          backgroundImage: MemoryImage(
                            contact.photo!,
                          ),
                        ),
                  onTap: () {
                    selectConatact(ref, contact, context);
                  },      
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return ErrorComponent(error: error.toString());
        },
        loading: () {
          return const Loading();
        },
      ),
    );
  }
}
