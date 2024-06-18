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
        padding: const EdgeInsets.fromLTRB(36, 32, 36, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(borderRadiusOut),
                            // color: themeData.colorScheme.primary,
                            gradient: LinearGradient(colors: [
                              themeData.colorScheme.secondary,
                              themeData.colorScheme.primary,
                            ]),
                            // boxShadow: [BoxShadow(blurRadius: 24,color: themeData.colorScheme.primary.withAlpha(150))]
                          ),
                          child: Row(
                            children: [
                              Text(
                                'همین الان شروع کنید',
                                style: themeData.textTheme.bodyMedium!.apply(
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                color: themeData.colorScheme.onPrimary,
                                size: 26,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      width: 1000,
                      height: 800,
                      child:
                          Assets.images.homeViewImage.image(fit: BoxFit.cover))
                ],
              ),
              const SizedBox(
                height: 46,
              ),
              BenefitSection(),
              const SizedBox(
                height: 64,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BenefitSection extends StatelessWidget {
  const BenefitSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Text(
          'چرا باید ترنسلیتور رو انتخاب کنیم؟',
          style: themeData.textTheme.displayMedium,
        ),
        const SizedBox(
          height: 46,
        ),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            BenefitItem(
                icon: Icons.speed_rounded,
                title: 'سرعت',
                text:
                    'ترنسلیتور با استفاده از هوش مصنوعی سرعت ترجمه را به حداقل میرساند.'),
            BenefitItem(
                icon: Icons.ads_click_rounded,
                title: 'سادگی',
                text:
                    'با رابط کاربری ساده و ترجمه با یک دکمه، استفاده از ترنسلیتور نیاز به دانش فنی ندارد.'),
            BenefitItem(
                icon: Icons.center_focus_strong_rounded,
                title: 'دقت',
                text:
                    'با استفاده از هوش مصنوعی پیشرفته، ترنسلیتور ترجمه‌هایی با دقت و صحت بالا ارائه می‌دهد که نیاز به بازبینی دستی را به حداقل می‌رساند.'),
            BenefitItem(
                icon: Icons.security_rounded,
                title: 'امنیت',
                text:
                    'ترنسلیتور با رعایت استانداردهای امنیتی، اطمینان می‌دهد که اطلاعات شخصی شما محفوظ و ایمن باقی می‌ماند و فقط برای ترجمه مورد استفاده قرار می‌گیرد.'),
          ],
        ),
      ],
    );
  }
}

class BenefitItem extends StatelessWidget {
  const BenefitItem(
      {super.key, required this.icon, required this.title, required this.text});

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(32),
      width: 400,
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusOut),
          color: themeData.colorScheme.secondary.withAlpha(40)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusIn),
                color: themeData.colorScheme.primary.withAlpha(30)),
            child: Icon(
              icon,
              size: 38,
              color: themeData.colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            title,
            style: themeData.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: themeData.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
