import 'dart:io';

import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';

import '../constants/app_colors.dart';
import '../wigets/bottom_sheet.dart';
import '../wigets/contact_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> contacts = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.darkBlueColor,
        appBar: AppBar(
          backgroundColor: AppColors.darkBlueColor,
          elevation: 0,
          centerTitle: false,
          title: Image.asset("assets/Group 6.png", width: 115, height: 37),
        ),

        body: SafeArea(
          child: contacts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        "assets/empty_list.json",
                        width: 300,
                        height: 220,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "There is No Contacts Added Here",
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: contacts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 180 / 310,
                  ),
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ContactCard(
                      name: contact["name"],
                      email: contact["email"],
                      phone: contact["phone"],
                      image: contact["image"] != null
                          ? File(contact["image"])
                          : null,
                      onDelete: () {
                        setState(() {
                          contacts.removeAt(index);
                        });
                      },
                    );
                  },
                ),
        ),

        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// DELETE LAST CONTACT
            if (contacts.isNotEmpty)
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  setState(() {
                    contacts.removeLast();
                  });
                },
                child: Icon(Icons.delete, color: AppColors.darkBlueColor),
              ),

            if (contacts.isNotEmpty) const SizedBox(height: 12),

            /// ADD CONTACT
            FloatingActionButton(
              backgroundColor: AppColors.goldColor,
              onPressed: () async {
                final result = await showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.darkBlueColor,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  builder: (_) => const AddContactSheet(),
                );

                if (result != null) {
                  setState(() {
                    contacts.add(result);
                  });
                }
              },
              child: Icon(Icons.add, color: AppColors.darkBlueColor),
            ),
          ],
        ),
      ),
    );
  }
}
