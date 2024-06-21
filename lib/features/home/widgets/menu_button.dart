import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.rules = false,
    required this.onPressed,
  });

  final bool rules;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(30),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: rules
            ? SvgPicture.asset('assets/icons/rulesbutton.svg')
            : SvgPicture.asset('assets/icons/shopbutton.svg'),
      ),
    );
  }
}
