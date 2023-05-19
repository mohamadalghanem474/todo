import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Icon(
      Icons.signal_wifi_off,
      size: MediaQuery.of(context).size.width / 2,
    ));
  }
}
