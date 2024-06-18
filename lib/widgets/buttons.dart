import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:translator/vars.dart';

class MyPrimaryButton extends StatelessWidget {
  const MyPrimaryButton(
      {super.key,
      required this.title,
      this.icon,
      required this.onTap,
      required this.onHover});

  final String title;
  final SvgPicture? icon;
  final Function() onTap;
  final Function(bool) onHover;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      borderRadius: BorderRadius.circular(borderRadiusOut),
      child: Container(
        height: buttonHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiusOut),
            color: themeData.colorScheme.primary),
        padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
        child: Row(
          children: [
            icon ?? SizedBox(),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: themeData.textTheme.bodySmall!
                  .apply(color: themeData.colorScheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBorderedButton extends StatelessWidget {
  const MyBorderedButton(
      {super.key,
      required this.title,
      this.icon,
      required this.onTap,
      required this.onHover});

  final String title;
  final SvgPicture? icon;
  final Function() onTap;
  final Function(bool) onHover;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      borderRadius: BorderRadius.circular(borderRadiusOut),
      child: Container(
        height: buttonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiusOut),
            border: Border.all(width: 2, color: themeData.colorScheme.primary)),
        padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? SizedBox(),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: themeData.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton(
      {super.key,
      required this.title,
      this.icon,
      required this.onTap,
      required this.onHover});

  final String title;
  final SvgPicture? icon;
  final Function() onTap;
  final Function(bool) onHover;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      borderRadius: BorderRadius.circular(borderRadiusOut),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Row(
          children: [
            icon ?? SizedBox(),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: themeData.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
