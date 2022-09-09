import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_introduction/cupertino_scaffold_screen.dart';
import 'package:scaffold_introduction/main.dart';

class LocalDrawer extends StatelessWidget {
  const LocalDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Scaffold introduction'),
            accountEmail: Text('designed by Flutter'),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            title: const Text('CupertinoScaffoldScreen'),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const CupertinoScaffoldScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('ScaffoldScreen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScaffoldScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('back'),
            onTap: () {
              Navigator.maybePop(context);
            },
          ),
        ],
      ),
    );
  }
}
