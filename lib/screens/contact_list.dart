import 'package:flutter/material.dart';
import '../database/dao/contact_dao.dart';
import '../models/contact.dart';
import 'contact_form.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contato"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 15,
                    ),
                    Text("loading...")
                  ],
                ),
              );

            case ConnectionState.active:
              // TODO: Handle this case.
              break;

            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
          }
          return const Text('Unkown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          ).then((value){
            setState(() {
            });
          });
        },
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(
            contact.name,
            style: const TextStyle(fontSize: 22),
          ),
          subtitle: Text(
            contact.accountNumber.toString(),
            style: const TextStyle(fontSize: 16.0),
          )),
    );
  }
}
