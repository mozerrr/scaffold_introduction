import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoScaffoldScreen extends StatelessWidget {
  const CupertinoScaffoldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              ModalRoute.of(context)?.navigator!.maybePop();
            },
            child: const Text('Close'),
          ),
          middle: const Text('CupertinoNavigationBar'),
        ),
        child: Center(
          child: CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      title: const Text('CupertinoActionSheet'),
                      message: const Text('Test route back gesture'),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {
                            ModalRoute.of(context)?.navigator!.maybePop();
                          },
                          child: const Text('and'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            ModalRoute.of(context)?.navigator!.maybePop();
                          },
                          child: const Text('action'),
                        ),
                      ],
                    );
                  });
            },
            child: const Text(
              'CupertinoScaffoldScreen',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
