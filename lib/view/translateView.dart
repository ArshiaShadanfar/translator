import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/vars.dart';
import 'package:translator/widgets/buttons.dart';

class TranslateView extends StatelessWidget {
  const TranslateView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(36, 32, 36, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ItemCount(number: '1'),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'مرحله اول: عکس های خود را آپلود کنید.',
                      style: themeData.textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      height: 80.0,
                      child: DashedLineConnector(
                        color: themeData.colorScheme.primary,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ItemCount(number: '2'),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'مرحله دوم: اطلاعات خواسته شده را بنویسید.',
                      style: themeData.textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      height: 80.0,
                      child: DashedLineConnector(
                        thickness: 2,
                        color: themeData.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ItemCount(number: '3'),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'مرحله آخر: فایل ترجمه را دانلود کنید.',
                      style: themeData.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  height: 800,
                  child: Assets.images.uploadBg.image(fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.all(32),
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadiusIn),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 16)
                        ]),
                    child: Column(
                      children: [
                        
                        Container(
                          alignment: Alignment.center,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(borderRadiusIn),
                              color: themeData.colorScheme.surface),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: themeData.colorScheme.primary
                                        .withAlpha(30)),
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  size: 48,
                                  color: themeData.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                'فایل را رها کنید یا کلیک کنید.',
                                style: themeData.textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32,),
                        TextField(
                          style: themeData.textTheme.bodyMedium,
                          decoration: InputDecoration(
                              labelText: 'نام شخص را وارد کنید',
                              labelStyle: themeData.textTheme.bodyMedium!.apply(
                                  color: themeData.textTheme.bodyMedium!.color!
                                      .withAlpha(150)),
                              filled: true,
                              fillColor: themeData.colorScheme.surface,
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(150)),
                                  borderRadius:
                                      BorderRadius.circular(borderRadiusIn)),
                              focusedBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(150)),
                                  borderRadius:
                                      BorderRadius.circular(borderRadiusIn))),
                        ),
                        const SizedBox(height: 24,),
                        TextField(
                          style: themeData.textTheme.bodyMedium,
                          decoration: InputDecoration(
                              labelText: 'نام خانوادگی شخص را وارد کنید',
                              labelStyle: themeData.textTheme.bodyMedium!.apply(
                                  color: themeData.textTheme.bodyMedium!.color!
                                      .withAlpha(150)),
                              filled: true,
                              fillColor: themeData.colorScheme.surface,
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(150)),
                                  borderRadius:
                                      BorderRadius.circular(borderRadiusIn)),
                              focusedBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(150)),
                                  borderRadius:
                                      BorderRadius.circular(borderRadiusIn))),
                        ),
                        const SizedBox(height: 24,),
                        TextField(
                          style: themeData.textTheme.bodyMedium,
                          decoration: InputDecoration(
                              labelText: 'نام پدر شخص را وارد کنید',
                              labelStyle: themeData.textTheme.bodyMedium!.apply(
                                  color: themeData.textTheme.bodyMedium!.color!
                                      .withAlpha(150)),
                              filled: true,
                              fillColor: themeData.colorScheme.surface,
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(150)),
                                  borderRadius:
                                      BorderRadius.circular(borderRadiusIn)),
                              focusedBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: themeData.colorScheme.primary
                                          .withAlpha(150)),
                                  borderRadius:
                                      BorderRadius.circular(borderRadiusIn))),
                        ),
                        const SizedBox(height: 48,),
                        MyPrimaryButton(title: 'دریافت ترجمه', onTap: (){}, onHover: (b){}, icon: Icons.translate_rounded,)
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemCount extends StatelessWidget {
  const ItemCount({super.key, required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: themeData.colorScheme.primary.withAlpha(30)),
      child: Text(
        number,
        style: themeData.textTheme.bodyLarge!
            .apply(color: themeData.colorScheme.primary),
      ),
    );
  }
}
