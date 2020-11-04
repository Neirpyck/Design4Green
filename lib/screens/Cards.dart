import 'package:flutter/material.dart';

class RowCards extends StatelessWidget {
  const RowCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(),
        Card(),
        Card(),
      ],
    );
  }
}
