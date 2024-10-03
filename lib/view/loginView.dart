import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/main.dart';
import 'package:translator/vars.dart';
import 'package:translator/view/translateView.dart';
import 'package:translator/widgets/buttons.dart';
import 'package:translator/widgets/fields.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.translate.svg(width: 50, height: 50),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'ترنسلیتور',
                      style: themeData.textTheme.displayMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  width: 500,
                  height: 500,
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadiusOut),
                      boxShadow: [
                        BoxShadow(blurRadius: 32, color: Colors.black12)
                      ],
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'خوش آمدید',
                        style: themeData.textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      MyInputField(
                          label: 'نام کاربری', controller: usernameController),
                      const SizedBox(
                        height: 24,
                      ),
                      MyInputField(
                          label: 'رمز عبور', controller: passwordController),
                      const SizedBox(
                        height: 32,
                      ),
                      MyPrimaryButton(
                          title: 'ورود',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.off(() => const MainScreen());
                            }
                          },
                          onHover: (b) {}),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
