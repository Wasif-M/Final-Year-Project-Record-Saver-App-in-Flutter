import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 30,
      itemBuilder: (BuildContext context, int ndex) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(0, 103, 254, 50),
          ),
        );
      },
    );
  }
}
