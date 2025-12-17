import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final File? image;
  final VoidCallback? onDelete;

  const ContactCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///image + name
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: image != null
                    ? Image.file(
                        image!,
                        height: 177,
                        width: 177,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 150,
                        width: double.infinity,
                        color: AppColors.darkBlueColor,
                        child: const Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    name.isEmpty ? "User Name" : name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// email and phone
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _infoRow(
                  Icons.email,
                  email.isEmpty ? "example@email.com" : email,
                ),
                const SizedBox(height: 8),
                _infoRow(Icons.phone, phone.isEmpty ? "+200000000000" : phone),
                const SizedBox(height: 12),

                /// delete btn
                SizedBox(
                  width: double.infinity,
                  height: 31,
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(
                      Icons.delete,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.darkBlueColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: AppColors.darkBlueColor),
          ),
        ),
      ],
    );
  }
}
