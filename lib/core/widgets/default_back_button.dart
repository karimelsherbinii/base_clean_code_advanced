import 'dart:io';

import 'package:flutter/material.dart';

class DefaultBackButton extends StatelessWidget {
  final Color? color;
  const DefaultBackButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: color ?? Colors.white),
      ),
    );
  }
}
