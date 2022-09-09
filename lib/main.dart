// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:scaffold_introduction/drawer.dart';
import 'package:scaffold_introduction/modals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const SimpleScaffoldV7Broken(),
    );
  }
}

class ScaffoldScreen extends StatefulWidget {
  const ScaffoldScreen({Key? key}) : super(key: key);

  @override
  State<ScaffoldScreen> createState() => _ScaffoldScreenState();
}

class _ScaffoldScreenState extends State<ScaffoldScreen> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scaffold AppBar'),
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(Icons.call),
              ),
              Tab(
                icon: Icon(Icons.access_alarms),
              ),
            ],
          ),
        ),
        drawer: LocalDrawer(),
        body: IndexedStack(
          index: tabIndex,
          children: [
            const Body1(),
            const Body2(),
          ],
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Modals.showBottomSheet(context);
            },
            child: Icon(Icons.mode_comment),
          );
        }),
        persistentFooterAlignment: AlignmentDirectional.centerStart,
        persistentFooterButtons: [
          TextButton(
            onPressed: () {
              Modals.showSnackBar(context);
            },
            child: Text('SnackBar'),
          ),
          TextButton(
            onPressed: () {
              Modals.showMaterialBanner(context);
            },
            child: Text('MaterialBanner'),
          ),
          // TextButton(
          //   onPressed: () {
          //     Modals.showBottomSheet(context);
          //   },
          //   child: Text('BottomSheet'),
          // ),
          // TextButton(
          //   onPressed: () {
          //     Modals.showOriginalModalBottomSheet(context);
          //   },
          //   child: Text('ModalBottomSheet'),
          // ),
        ],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class Body1 extends StatelessWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
        onPressed: () {},
        child: Text('Scaffold Body - Profile'),
      ),
    );
  }
}

class Body2 extends StatelessWidget {
  const Body2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
        onPressed: () {},
        child: Text('Scaffold Body - Settings'),
      ),
    );
  }
}

class SimpleScaffoldV1 extends StatelessWidget {
  const SimpleScaffoldV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('Scaffold AppBar'),
        ),
        Expanded(
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Text('Simple Scaffold V1'),
            ),
          ),
        ),
      ],
    );
  }
}

class SimpleScaffoldV2 extends StatelessWidget {
  const SimpleScaffoldV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text('Scaffold AppBar'),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Text('Simple Scaffold V2'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SimpleScaffoldV3 extends StatelessWidget {
  const SimpleScaffoldV3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Text('Simple Scaffold V3'),
            ),
          ),
        ),
        AppBar(
          title: Text('Scaffold AppBar'),
        ),
      ],
    );
  }
}

class SimpleScaffoldV4 extends StatelessWidget {
  const SimpleScaffoldV4({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Text('Simple Scaffold V4'),
            ),
          ),
        ),
        SizedBox(
          height: kToolbarHeight,
          child: AppBar(
            title: Text('Scaffold AppBar'),
          ),
        ),
      ],
    );
  }
}

class SimpleScaffoldV5 extends StatelessWidget {
  const SimpleScaffoldV5({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Text('Simple Scaffold V5'),
            ),
          ),
        ),
        SizedBox(
          height: kToolbarHeight + MediaQuery.of(context).viewPadding.top,
          child: AppBar(
            title: Text('Scaffold AppBar'),
          ),
        ),
      ],
    );
  }
}

class SimpleScaffoldV6 extends StatelessWidget {
  const SimpleScaffoldV6({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight =
        kToolbarHeight + MediaQuery.of(context).viewPadding.top;
    return Stack(
      children: [
        Positioned(
          top: appBarHeight,
          child: Container(
            color: Colors.white,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Text('Simple Scaffold V6'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: appBarHeight,
          child: AppBar(
            title: Text('Scaffold AppBar'),
          ),
        ),
      ],
    );
  }
}

class SimpleScaffoldV7 extends StatelessWidget {
  const SimpleScaffoldV7({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight =
        kToolbarHeight + MediaQuery.of(context).viewPadding.top;

    return Stack(
      children: [
        Positioned.fill(
          top: appBarHeight,
          child: Container(
            color: Colors.white,
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Text('Simple Scaffold V7'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: appBarHeight,
          child: AppBar(
            title: Text('Scaffold AppBar'),
          ),
        ),
      ],
    );
  }
}

class SimpleScaffoldV7Broken extends StatelessWidget {
  const SimpleScaffoldV7Broken({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight =
        kToolbarHeight + MediaQuery.of(context).viewPadding.top;

    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Positioned.fill(
            top: appBarHeight,
            child: Container(
              color: Colors.white,
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: Text('Simple Scaffold V7 Broken'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: appBarHeight,
            child: AppBar(
              title: Text('Scaffold AppBar'),
              bottom: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(Icons.call),
                  ),
                  Tab(
                    icon: Icon(Icons.access_alarms),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RealSimpleScaffold extends StatelessWidget {
  const RealSimpleScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Scaffold AppBar'),
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(Icons.call),
              ),
              Tab(
                icon: Icon(Icons.access_alarms),
              ),
            ],
          ),
        ),
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            onPressed: () {},
            child: Text('Real Simple Scaffold'),
          ),
        ),
      ),
    );
  }
}
