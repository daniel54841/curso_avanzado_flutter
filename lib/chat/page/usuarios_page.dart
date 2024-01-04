import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final RefreshController _refreshCtrl = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshCtrl.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    debugPrint("Comprobando si hay mas datos en la lista");
    if (mounted) setState(() {});
    _refreshCtrl.loadComplete();
  }

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
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: const TwoLevelHeader(
          completeIcon: Icon(
            Icons.check,
            color: Colors.green,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshCtrl,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.separated(
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
      ),
    );
  }
}
