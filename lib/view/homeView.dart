import 'package:flutter/material.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/vars.dart';
import 'package:translator/widgets/buttons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ترجمۀ مدارک به راحتی یک کلیــــــــــک!',
                  style: themeData.textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                    'ترجمۀ کارت ملی، ریز نمرات و ... با هوش مصنوعی در سریع ترین زمان ممکن'),
                const SizedBox(
                  height: 36,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(borderRadiusOut),
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadiusOut),
                      color: themeData.colorScheme.primary,
                      boxShadow: [BoxShadow(blurRadius: 16,color: themeData.colorScheme.primary.withAlpha(150))]
                    ),
                    child: Row(
                      children: [
                        Text('همین الان شروع کنید', style: themeData.textTheme.bodyMedium!.apply(color: themeData.colorScheme.onPrimary),),
                        const SizedBox(width: 16,),
                        Icon(Icons.arrow_right_rounded, color: themeData.colorScheme.onPrimary,size: 26,),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
                width: 1000,
                height: 800,
                child: Assets.images.homeViewImage.image(fit: BoxFit.cover))
          ],
        ),
      ),
    );
  }
}
