import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  final Widget child;
  final WillPopCallback onWillPop;

  const AppDialog._internal({
    Key key,
    this.child,
    this.onWillPop,
  }) : super(key: key);

  static void show({
    BuildContext context,
    Widget child,
    WillPopCallback onWillPop,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppDialog._internal(
          child: child,
          onWillPop: onWillPop,
        );
      },
    );
  }

  static bool close(BuildContext context) {
    if (_AppDialogState.stackDialog.length > 0 && context != null) {
      return Navigator.of(context, rootNavigator: true).pop();
    } else {
      return false;
    }
  }

  @override
  State<StatefulWidget> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  static Set<dynamic> stackDialog = Set();

  @override
  void initState() {
    super.initState();
    stackDialog.add(this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Dialog(
        child: widget.child,
      ),
      onWillPop: widget.onWillPop,
    );
  }

  @override
  void dispose() {
    stackDialog.remove(stackDialog.last);
    super.dispose();
  }
}
