import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils.dart';
import '../bloc/home_bloc.dart';

class CoinsCount extends StatelessWidget {
  const CoinsCount({super.key, this.coin = 0});

  final int coin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 93,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              height: 24,
              width: 78,
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xff260037),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Spacer(),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Text(
                        coin != 0 ? '$coin' : '$coins',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/coin.svg'),
        ],
      ),
    );
  }
}
