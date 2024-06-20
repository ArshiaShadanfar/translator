import 'dart:io';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'package:translator/gen/assets.gen.dart';
import 'package:translator/vars.dart';
import 'package:translator/widgets/buttons.dart';
import 'package:path/path.dart';

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
  List<Map<String, dynamic>> files = [];

  Future<void> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );

      if (result != null) {
        setState(() {
          files = result.files
              .map((file) => {
                    'name': file.name,
                    'bytes': file.bytes,
                  })
              .toList();
        });
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

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
                  InkWell(
                    onTap: () {
                      pickFiles();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: themeData.colorScheme.surface,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          files.isEmpty
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
                                        color: themeData.colorScheme.primary
                                            .withAlpha(30),
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
                                  child: Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: files.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.info_outline,
                                                  color: themeData
                                                      .colorScheme.onSurface
                                                      .withAlpha(150),
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  'برای آپلود دوباره کلیک کنید.',
                                                  style: themeData
                                                      .textTheme.bodySmall!
                                                      .apply(
                                                          color: themeData
                                                              .colorScheme
                                                              .onSurface
                                                              .withAlpha(160)),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                borderRadiusOut),
                                            color: Colors.white,
                                          ),
                                          margin:
                                              EdgeInsets.fromLTRB(16, 8, 16, 8),
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        borderRadiusIn),
                                                child: Image.memory(
                                                  fit: BoxFit.cover,
                                                  files[index - 1]['bytes']
                                                      as Uint8List,
                                                  width: 160,
                                                  height: 90,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Icon(
                                                        Icons.broken_image);
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              SizedBox(
                                                width: 400,
                                                child: Text(
                                                  files[index - 1]['name'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
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
                      // change the fields
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
                  MyInputField(
                    label: 'نام شخص',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyInputField(
                    label: 'نام خانوادگی شخص',
                    controller: lastNameController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyInputField(
                    label: 'نام پدر شخص',
                    controller: fatherNameController,
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              MyPrimaryButton(
                title: 'دریافت ترجمه',
                onTap: () {
                  // validation images
                  if (files.isEmpty) {
                    // Get.defaultDialog(
                    //   backgroundColor: Colors.red.shade300,
                    //   title: 'خطا',
                    //   middleText: 'باید عکس ها را آپلود کنید'
                    // );
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
                    } else if (docType == 'ریز نمرات') {
                      // Handle Transcripts document
                    }
                  }
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

class MyInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const MyInputField({
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextFormField(
      controller: controller,
      style: themeData.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: themeData.textTheme.bodyMedium!.apply(
            color: themeData.textTheme.bodyMedium!.color!.withAlpha(150)),
        filled: true,
        fillColor: themeData.colorScheme.surface,
        border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                width: 2, color: themeData.colorScheme.primary.withAlpha(20)),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
        errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(width: 2, color: Colors.red.shade400),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                width: 2, color: themeData.colorScheme.primary.withAlpha(20)),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                width: 2, color: themeData.colorScheme.primary.withAlpha(150)),
            borderRadius: BorderRadius.circular(borderRadiusIn)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'این فیلد نمی‌تواند خالی باشد';
        }
        return null;
      },
    );
  }
}

// class PickFileContainer extends StatefulWidget {
//   PickFileContainer({super.key, required this.files});
//   List<Map<String, dynamic>> files;

//   @override
//   State<PickFileContainer> createState() => _PickFileContainerState();
// }

// class _PickFileContainerState extends State<PickFileContainer> {
//   Future<void> pickFiles() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['jpg', 'png'],
//       );

//       if (result != null) {
//         setState(() {
//           widget.files = result.files
//               .map((file) => {
//                     'name': file.name,
//                     'bytes': file.bytes,
//                   })
//               .toList();
//         });
//       } else {
//         // User canceled the picker
//         print('User canceled the picker');
//       }
//     } catch (e) {
//       print('Error picking files: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);
//     return InkWell(
//       onTap: () {
//         pickFiles();
//       },
//       child: Container(
//         alignment: Alignment.center,
//         height: 400,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: themeData.colorScheme.surface,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             widget.files.isEmpty
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         width: 100,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: themeData.colorScheme.primary.withAlpha(30),
//                         ),
//                         child: Icon(
//                           Icons.file_upload_outlined,
//                           size: 48,
//                           color: themeData.colorScheme.primary,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 32,
//                       ),
//                       Text(
//                         'برای آپلود کلیک کنید.',
//                         style: themeData.textTheme.bodySmall,
//                       ),
//                     ],
//                   )
//                 : SizedBox(
//                     height: 400,
//                     child: Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: widget.files.length + 1,
//                         itemBuilder: (context, index) {
//                           if (index == 0) {
//                             return Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.info_outline,
//                                     color: themeData.colorScheme.onSurface
//                                         .withAlpha(150),
//                                   ),
//                                   const SizedBox(
//                                     width: 6,
//                                   ),
//                                   Text(
//                                     'برای آپلود دوباره کلیک کنید.',
//                                     style: themeData.textTheme.bodySmall!.apply(
//                                         color: themeData.colorScheme.onSurface
//                                             .withAlpha(160)),
//                                   )
//                                 ],
//                               ),
//                             );
//                           }
//                           return Container(
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.circular(borderRadiusOut),
//                               color: Colors.white,
//                             ),
//                             margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
//                             padding: const EdgeInsets.all(16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius:
//                                       BorderRadius.circular(borderRadiusIn),
//                                   child: Image.memory(
//                                     fit: BoxFit.cover,
//                                     widget.files[index - 1]['bytes']
//                                         as Uint8List,
//                                     width: 160,
//                                     height: 90,
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Icon(Icons.broken_image);
//                                     },
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 SizedBox(
//                                   width: 400,
//                                   child: Text(
//                                     widget.files[index - 1]['name'],
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
