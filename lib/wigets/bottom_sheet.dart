import 'dart:io';

import 'package:contact_app/wigets/custom_text_field.dart';
import 'package:contact_app/wigets/preview_line.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_colors.dart';
import 'custom_button.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  XFile? selectedImage;
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  Future<void> _uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameCtrl.addListener(() => setState(() {}));
    emailCtrl.addListener(() => setState(() {}));
    phoneCtrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///image picker+ user data
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image picker
                  GestureDetector(
                    onTap: _uploadImage,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.goldColor,
                          width: 2,
                        ),
                      ),
                      child: selectedImage == null
                          ? Lottie.asset(
                              "assets/image_picker.json",
                              width: 146,
                              height: 146,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(selectedImage!.path),
                                width: 146,
                                height: 146,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(width: 9),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PreviewLine(
                        text: nameCtrl.text.isEmpty
                            ? "User Name"
                            : nameCtrl.text,
                      ),
                      const SizedBox(height: 15),
                      PreviewLine(
                        text: emailCtrl.text.isEmpty
                            ? "example@email.com"
                            : emailCtrl.text,
                      ),
                      const SizedBox(height: 15),
                      PreviewLine(
                        text: phoneCtrl.text.isEmpty
                            ? "+200000000000"
                            : phoneCtrl.text,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),

              ///text filed +btn
              Column(
                children: [
                  CustomTextField(
                    label: "Enter User Name",
                    controller: nameCtrl,
                  ),
                  const SizedBox(height: 9),

                  CustomTextField(
                    label: "Enter User Email",
                    controller: emailCtrl,
                  ),
                  const SizedBox(height: 9),

                  CustomTextField(
                    label: "Enter User Phone",
                    controller: phoneCtrl,
                  ),
                  const SizedBox(height: 15),

                  CustomButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        "name": nameCtrl.text,
                        "email": emailCtrl.text,
                        "phone": phoneCtrl.text,
                        "image": selectedImage?.path,
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
