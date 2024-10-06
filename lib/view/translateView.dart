import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:translator/controller/filePickerController.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/vars.dart';
import 'package:translator/widgets/buttons.dart';
import 'package:path/path.dart';
import 'package:translator/widgets/fields.dart';

class TranslateView extends StatefulWidget {
  const TranslateView({super.key});

  @override
  State<TranslateView> createState() => _TranslateViewState();
}

class _TranslateViewState extends State<TranslateView> {
  final List<String> genderItems = [
    'کارت ملی',
    'ریز نمرات',
  ];

  String? docType;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController serialController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  FilePickerController filePickerController = Get.put(FilePickerController());

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  PickFiles(themeData: themeData),
                  const SizedBox(
                    height: 32,
                  ),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'نوع مدرک',
                      labelStyle: themeData.textTheme.bodyMedium!.apply(
                          color: themeData.textTheme.bodyLarge!.color!
                              .withAlpha(150)),
                      filled: true,
                      fillColor: themeData.colorScheme.surface,

                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                              width: 2,
                              color:
                                  themeData.colorScheme.primary.withAlpha(20)),
                          borderRadius: BorderRadius.circular(borderRadiusIn)),
                      errorBorder: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide:
                              BorderSide(width: 2, color: Colors.red.shade400),
                          borderRadius: BorderRadius.circular(borderRadiusIn)),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                              width: 2,
                              color:
                                  themeData.colorScheme.primary.withAlpha(20)),
                          borderRadius: BorderRadius.circular(borderRadiusIn)),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: BorderSide(
                              width: 2,
                              color:
                                  themeData.colorScheme.primary.withAlpha(150)),
                          borderRadius: BorderRadius.circular(borderRadiusIn)),
                      // Add more decoration..
                    ),
                    style: themeData.textTheme.bodyMedium,
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item,
                                  style: themeData.textTheme.bodyMedium),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'نوع مدرک را انتخاب کنید';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        docType = value.toString();
                      });
                    },
                    onSaved: (value) {
                      docType = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 35,
                      padding: EdgeInsets.only(bottom: 8, right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadiusOut),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  docType == 'کارت ملی' || docType == 'ریز نمرات'
                      ? MyInputField(
                          label: 'نام شخص',
                          controller: nameController,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 24,
                  ),
                  docType == 'کارت ملی' || docType == 'ریز نمرات'
                      ? MyInputField(
                          label: 'نام خانوادگی شخص',
                          controller: lastNameController,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 24,
                  ),
                  docType == 'کارت ملی' || docType == 'ریزنمرات'
                      ? MyInputField(
                          label: 'نام پدر شخص',
                          controller: fatherNameController,
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              MyPrimaryButton(
                title: 'دریافت ترجمه',
                onTap: () {
                  // validation images
                  if (filePickerController.files.isEmpty) {
                    Get.showSnackbar(GetSnackBar(
                      backgroundColor: Colors.red.shade400,
                      duration: Duration(seconds: 2),
                      icon: Icon(Icons.error_rounded),
                      messageText: Text('عکس ها را انتخاب کنید.'),
                    ));
                  }
                  // validation the forms
                  else if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (docType == 'کارت ملی') {
                      // Handle National ID document
                      if (filePickerController.files.length > 2) {
                        Get.showSnackbar(GetSnackBar(
                          backgroundColor: Colors.red.shade400,
                          duration: Duration(seconds: 2),
                          icon: Icon(Icons.error_rounded),
                          messageText: Text(
                              'عکس‌های کارت ملی نباید بیشتر از دو عدد باشند.'),
                        ));
                        return;
                      }
                      nationalIdController.text = '123412341234';
                      birthDayController.text = '1378-05-25';
                      serialController.text = '123412341234';
                      expirationDateController.text = '1405-05-24';

                      Get.dialog(SingleChildScrollView(
                        child: AlertDialog(
                          title: Text(
                            "تایید اطلاعات",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          content: Column(
                            children: [
                              Row(
                                children: List.generate(
                                  filePickerController.files.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.memory(
                                      filePickerController.files[index]['bytes']
                                          as Uint8List,
                                      width: 500,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              MyInputField(
                                label: 'کد ملی',
                                controller: nationalIdController,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              MyInputField(
                                label: 'تاریخ تولد',
                                controller: birthDayController,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              MyInputField(
                                label: 'تاریخ انقضا',
                                controller: birthDayController,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              MyInputField(
                                label: 'سریال شناسنامه',
                                controller: serialController,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  MyTextButton(
                                      title: "لغو",
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      onHover: (h) {}),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  MyPrimaryButton(
                                      title: "تایید و ارسال",
                                      onTap: () {
                                        Navigator.pop(context);
                                        // show download link to the user
                                        Get.dialog(SingleChildScrollView(
                                          child: AlertDialog(
                                            title: Text(
                                              "دانلود فایل ترجمه",
                                              style:
                                                  themeData.textTheme.bodyLarge,
                                            ),
                                            content: Column(
                                              children: [
                                                Text(
                                                  'فایل ترجمه آماده‌ی دانلود است و می‌توانید با زدن روی دکمه‌ی زیر فایل را دانلود کنید.',
                                                  style: themeData
                                                      .textTheme.bodyMedium,
                                                ),
                                                const SizedBox(
                                                  height: 24,
                                                ),
                                                MyPrimaryButton(
                                                    title: 'دانلود فایل',
                                                    onTap: () {},
                                                    onHover: (h) {}),
                                                const SizedBox(
                                                  height: 24,
                                                ),
                                                MyTextButton(
                                                    title: "بستن",
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    onHover: (h) {}),
                                              ],
                                            ),
                                          ),
                                        ));
                                      },
                                      onHover: (h) {}),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                    } else if (docType == 'ریز نمرات') {
                      // Handle Transcripts document
                    }
                  }

                  // print the information
                  print(filePickerController.files[0].keys);
                },
                onHover: (b) {},
                icon: Icons.download_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PickFiles extends StatelessWidget {
  PickFiles({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;
  final FilePickerController controller = Get.put(FilePickerController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.pickFiles();
      },
      child: Container(
        alignment: Alignment.center,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeData.colorScheme.surface,
        ),
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.files.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: themeData.colorScheme.primary.withAlpha(30),
                          ),
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
                          'برای آپلود کلیک کنید.',
                          style: themeData.textTheme.bodySmall,
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 400,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: themeData.colorScheme.onSurface
                                        .withAlpha(150),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'برای آپلود دوباره کلیک کنید.',
                                    style: themeData.textTheme.bodySmall!.apply(
                                        color: themeData.colorScheme.onSurface
                                            .withAlpha(160)),
                                  )
                                ],
                              ),
                            ),
                            Wrap(
                                runSpacing: 16,
                                spacing: 16,
                                children: List.generate(
                                  controller.files.length,
                                  (index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius: BorderRadius.circular(
                                            borderRadiusIn),
                                        child: controller.files.isNotEmpty &&
                                                controller.files[index]
                                                        ['bytes'] !=
                                                    null
                                            ? Image.memory(
                                                controller.files[index]['bytes']
                                                    as Uint8List,
                                                fit: BoxFit.cover,
                                                width: 300,
                                                height: 200,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Icon(
                                                      Icons.broken_image,
                                                      size: 60);
                                                },
                                              )
                                            : Icon(Icons.broken_image,
                                                size: 60),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: 300,
                                        child: Center(
                                          child: Text(
                                            controller.files[index]['name'],
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        }),
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
