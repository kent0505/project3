import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/coins_count.dart';
import '../widgets/shop_rules.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShopRules(
        title: 'Shop',
        children: [
          const SizedBox(height: 10),
          const CoinsCount(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShopSecItem(
                sec: 5,
                price: 50,
                onPressed: () {},
              ),
              ShopSecItem(
                sec: 10,
                price: 100,
                onPressed: () {},
              ),
              ShopSecItem(
                sec: 15,
                price: 150,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShopSecItem(
                sec: 20,
                price: 250,
                onPressed: () {},
              ),
              ShopBgItem(
                bgID: 1,
                price: 300,
                bought: true,
                onPressed: () async {},
              ),
              ShopBgItem(
                bgID: 2,
                price: 300,
                bought: false,
                onPressed: () async {},
              ),
            ],
          ),
          const SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShopBgItem(
                bgID: 3,
                price: 350,
                bought: false,
                onPressed: () async {},
              ),
              ShopBgItem(
                bgID: 4,
                price: 450,
                bought: false,
                onPressed: () async {},
              ),
              ShopBgItem(
                bgID: 5,
                price: 500,
                bought: false,
                onPressed: () async {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShopSecItem extends StatelessWidget {
  const ShopSecItem({
    super.key,
    required this.sec,
    required this.price,
    required this.onPressed,
  });

  final int sec;
  final int price;
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
        SvgPicture.asset('assets/icons/${price}coins.svg'),
      ],
    );
  }
}

class ShopBgItem extends StatelessWidget {
  const ShopBgItem({
    super.key,
    required this.bgID,
    required this.price,
    required this.bought,
    required this.onPressed,
  });

  final int bgID;
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
            ? const SizedBox(height: 26)
            : SvgPicture.asset('assets/icons/${price}coins.svg'),
      ],
    );
  }
}
