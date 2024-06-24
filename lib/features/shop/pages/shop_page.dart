import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils.dart';
import '../../home/bloc/home_bloc.dart';
import '../../home/widgets/coins_count.dart';
import '../../home/widgets/shop_rules.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ShopRules(
            title: 'Shop',
            children: [
              const SizedBox(height: 10),
              const CoinsCount(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ShopSecItem(
                    sec: 5,
                    price: 50,
                    bought: sec5,
                    onPressed: () async {
                      await changeSec(5).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                  _ShopSecItem(
                    sec: 10,
                    price: 100,
                    bought: sec10,
                    onPressed: () async {
                      await changeSec(10).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                  _ShopSecItem(
                    sec: 15,
                    price: 150,
                    bought: sec15,
                    onPressed: () async {
                      await changeSec(15).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ShopSecItem(
                    sec: 20,
                    price: 250,
                    bought: sec20,
                    onPressed: () async {
                      await changeSec(20).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                  _ShopBgItem(
                    bgID: 1,
                    price: 300,
                    bought: true,
                    currentBg: bgId == 1,
                    onPressed: () async {
                      await changeBackground(1).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                  _ShopBgItem(
                    bgID: 2,
                    price: 300,
                    bought: bg2,
                    currentBg: bgId == 2,
                    onPressed: () async {
                      await changeBackground(2).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ShopBgItem(
                    bgID: 3,
                    price: 350,
                    bought: bg3,
                    currentBg: bgId == 3,
                    onPressed: () async {
                      await changeBackground(3).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                  _ShopBgItem(
                    bgID: 4,
                    price: 450,
                    bought: bg4,
                    currentBg: bgId == 4,
                    onPressed: () async {
                      await changeBackground(4).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                  _ShopBgItem(
                    bgID: 5,
                    price: 500,
                    bought: bg5,
                    currentBg: bgId == 5,
                    onPressed: () async {
                      await changeBackground(5).then((value) {
                        context.read<HomeBloc>().add(GetCoinsEvent());
                      });
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ShopSecItem extends StatelessWidget {
  const _ShopSecItem({
    required this.sec,
    required this.price,
    required this.bought,
    required this.onPressed,
  });

  final int sec;
  final int price;
  final bool bought;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          child: Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42),
            ),
            child: Stack(
              children: [
                SvgPicture.asset('assets/icons/sec_bg.svg'),
                Center(
                  child: Text(
                    '+$sec\nsec',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 2),
        bought
            ? const SizedBox(height: 26)
            : SvgPicture.asset('assets/icons/${price}coins.svg'),
      ],
    );
  }
}

class _ShopBgItem extends StatelessWidget {
  const _ShopBgItem({
    required this.bgID,
    required this.price,
    required this.bought,
    required this.currentBg,
    required this.onPressed,
  });

  final int bgID;
  final int price;
  final bool bought;
  final bool currentBg;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: 84,
            height: 84,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(42),
              child: Image.asset(
                'assets/icons/bg$bgID.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        bought
            ? SizedBox(
                height: 26,
                child: Center(
                  child: currentBg
                      ? const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                        )
                      : Container(),
                ),
              )
            : SvgPicture.asset('assets/icons/${price}coins.svg'),
      ],
    );
  }
}
