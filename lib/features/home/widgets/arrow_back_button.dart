import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import 'coins_count.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 35),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(14),
          ),
          child: CupertinoButton(
            onPressed: () {
              context.pop();
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: const Color(0xff6F089D),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xffC119EB),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(),
        const CoinsCount(),
        const SizedBox(width: 35),
      ],
    );
  }
}
