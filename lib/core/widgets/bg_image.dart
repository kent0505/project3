import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          // image: AssetImage('assets/icons/bg$bgID.png'),
          image: AssetImage('assets/icons/bg$bgId.png'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}
