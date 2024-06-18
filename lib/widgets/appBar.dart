

import 'package:flutter/material.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/widgets/buttons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(width: 20, height: 20, color: Colors.red,),
              const SizedBox(width: 16,),
              Text('ترنسلیتور', style: themeData.textTheme.bodyMedium,),
            ],
          ),
          Row(
            children: [
              MyTextButton(title: 'خانه', icon: Assets.icons.home.svg(), onTap: (){}, onHover: (b){}),
              MyTextButton(title: 'ترجمه', icon: Assets.icons.translate.svg(), onTap: (){}, onHover: (b){}),
              MyTextButton(title: 'تعرفه ها', icon: Assets.icons.pricing.svg(), onTap: (){}, onHover: (b){}),
              MyTextButton(title: 'درباره ما', icon: Assets.icons.about.svg(), onTap: (){}, onHover: (b){}),
            ],
          ),
          Row(
            children: [
              MyPrimaryButton(title: 'ثبت نام', icon: Assets.icons.home.svg(), onTap: (){}, onHover: (b){}),
              MyBorderedButton(title: 'ورود', icon: Assets.icons.home.svg(), onTap: (){}, onHover: (b){}),
            ],
          )
        ],
      ),
    );
  }
}
