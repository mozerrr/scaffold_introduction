import 'package:flutter/material.dart';

class Modals {
  static void showSnackBar(BuildContext context) {
    final entry = LocalHistoryEntry(onRemove: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
    ModalRoute.of(context)?.addLocalHistoryEntry(entry);
    final snackBarController = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 999),
        content: const Text('This is ScaffoldMessenger SnackBar!'),
        action: SnackBarAction(
          label: 'close',
          onPressed: () {},
        ),
      ),
    );
    snackBarController.closed.whenComplete(() => entry.remove());
  }

  static void showMaterialBanner(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text('This is ScaffoldMessenger MaterialBanner!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Navigator.pop'),
          ),
          Builder(builder: (context) {
            return TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text('hideCurrentMaterialBanner'),
            );
          }),
        ],
      ),
    );
  }

  static void showBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (context) {
        return getBottomSheet('This is Scaffold bottomSheet!');
      },
      enableDrag: true,
    );
  }

  static void showOriginalModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return getBottomSheet('This is Navigator modalBottomSheet!');
      },
    );
  }

  static Widget getBottomSheet(String title) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      backgroundColor: Colors.blueAccent.shade200,
      builder: (context) {
        return SizedBox(
          height: 150,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'wow, $title',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: const Text('close BottomSheet'),
              )
            ],
          ),
        );
      },
    );
  }
}
