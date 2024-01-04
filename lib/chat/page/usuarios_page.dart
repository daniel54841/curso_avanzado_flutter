import 'package:flutter/material.dart';

import '../models/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [
    User(online: true, email: "maria@test.com", nombre: "Maria", uid: "1"),
    User(online: false, email: "miguel@test.com", nombre: "Miguel", uid: "2"),
    User(online: true, email: "angel@test.com", nombre: "Angel", uid: "3"),
    User(online: false, email: "timoti@test.com", nombre: "Timoti", uid: "4"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi nombre"),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.exit_to_app,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            child: Icon(
              Icons.check_circle,
              color: Colors.blue[400],
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${users[index].nombre}"),
            leading: CircleAvatar(
              child: Text(users[index].nombre!.substring(0, 2)),
            ),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: users[index].online! ? Colors.green[300] : Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: users.length,
      ),
    );
  }
}
