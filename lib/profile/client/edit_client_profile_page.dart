import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:afghanlance/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../models/client_profile_model.dart';

class EditClientProfilePage extends StatefulWidget {
  final ClientProfileModel profile;

  const EditClientProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditClientProfilePage> createState() => _EditClientProfilePageState();
}

class _EditClientProfilePageState extends State<EditClientProfilePage> {
  ImageProvider profileImage = const AssetImage('assets/images/profile.png');
  File? selectedImageFile;
  final ImagePicker _picker = ImagePicker();

  late TextEditingController companyController;
  late TextEditingController ownerController;
  late TextEditingController locationController;
  late TextEditingController aboutController;
  late TextEditingController categoryController;

  late List<String> categories;

  @override
  void initState() {
    super.initState();

    companyController = TextEditingController(text: widget.profile.companyName);
    ownerController = TextEditingController(text: widget.profile.ownerName);
    locationController = TextEditingController(text: widget.profile.location);
    aboutController = TextEditingController(text: widget.profile.about);
    categoryController = TextEditingController();

    categories = List.from(widget.profile.categories);
  }

  @override
  void dispose() {
    companyController.dispose();
    ownerController.dispose();
    locationController.dispose();
    aboutController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  bool get isValid {
    return companyController.text.trim().isNotEmpty &&
        ownerController.text.trim().isNotEmpty &&
        locationController.text.trim().isNotEmpty &&
        aboutController.text.trim().isNotEmpty &&
        categories.isNotEmpty;
  }

  void addCategory() {
    final text = categoryController.text.trim();

    if (text.isEmpty) return;

    if (!categories.contains(text)) {
      setState(() {
        categories.add(text);
      });
    }

    categoryController.clear();
  }

  void removeCategory(String category) {
    setState(() {
      categories.remove(category);
    });
  }

  Future<void> changeProfileImage() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedImage == null) return;

    setState(() {
      selectedImageFile = File(pickedImage.path);
      profileImage = FileImage(selectedImageFile!);
    });
  }

  Future<void> saveProfile() async {
    if (!isValid) return;

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception("User not logged in");
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'companyName': companyController.text.trim(),
        'ownerName': ownerController.text.trim(),
        'country': locationController.text.trim(),
        'about': aboutController.text.trim(),
        'categories': categories,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      final updated = widget.profile.copyWith(
        companyName: companyController.text.trim(),
        ownerName: ownerController.text.trim(),
        location: locationController.text.trim(),
        about: aboutController.text.trim(),
        categories: categories,
      );

      if (!mounted) return;

      Navigator.pop(context, updated);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDark ? const Color(0xFF121212) : kFirstColor,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          "Edit Client Profile",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 110),
        child: Column(
          children: [
            _avatar(isDark),
            SizedBox(height: 28),

            _sectionCard(
              isDark: isDark,
              child: Column(
                children: [
                  _input(
                    label: "Company Name",
                    controller: companyController,
                    icon: Icons.business_outlined,
                    isDark: isDark,
                  ),
                  SizedBox(height: 18),
                  _input(
                    label: "Owner Name",
                    controller: ownerController,
                    icon: Icons.person_outline_rounded,
                    isDark: isDark,
                  ),
                  SizedBox(height: 18),
                  _input(
                    label: "Location",
                    controller: locationController,
                    icon: Icons.location_on_outlined,
                    isDark: isDark,
                  ),
                  SizedBox(height: 18),
                  _input(
                    label: "About Company",
                    controller: aboutController,
                    icon: Icons.info_outline_rounded,
                    isDark: isDark,
                    maxLines: 4,
                  ),
                ],
              ),
            ),

            SizedBox(height: 18),

            _sectionCard(
              isDark: isDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Project Categories", isDark),
                  SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categories.map((category) {
                      return Chip(
                        label: Text(category),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () => removeCategory(category),
                        backgroundColor: isDark
                            ? const Color(0xFF233A3A)
                            : const Color(0xFFE4F1F0),
                        labelStyle: TextStyle(
                          color: isDark
                              ? const Color(0xFFA8DDD8)
                              : kThirdColor,
                          fontWeight: FontWeight.w700,
                        ),
                        deleteIconColor:
                        isDark ? Colors.white60 : kThirdColor,
                        side: BorderSide.none,
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: categoryController,
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          decoration: _decoration(
                            label: "Add category",
                            icon: Icons.add_circle_outline,
                            isDark: isDark,
                          ),
                          onSubmitted: (_) => addCategory(),
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 0, 20, 18),
        child: SizedBox(
          height: 58,
          child: ElevatedButton(
            onPressed: isValid ? saveProfile : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: kThirdColor,
              disabledBackgroundColor:
              isDark ? Colors.white12 : Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Save Changes",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatar(bool isDark) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 62,
            backgroundColor: isDark ? const Color(0xFF242424) : Colors.white,
            child: CircleAvatar(
              radius: 57,
              backgroundImage: profileImage,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 5,
            child: InkWell(
              onTap: () => changeProfileImage(),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: kThirdColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? const Color(0xFF121212) : kFirstColor,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required bool isDark,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF222629) : Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? .25 : .06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _sectionTitle(String text, bool isDark) {
    return Text(
      text,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _input({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required bool isDark,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w500,
      ),
      onChanged: (_) => setState(() {}),
      decoration: _decoration(
        label: label,
        icon: icon,
        isDark: isDark,
      ),
    );
  }

  InputDecoration _decoration({
    required String label,
    required IconData icon,
    required bool isDark,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: kThirdColor,
      ),
      filled: true,
      fillColor: isDark ? const Color(0xFF242424) : Colors.white,
      labelStyle: TextStyle(
        color: isDark ? Colors.white60 : Colors.grey[600],
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 18,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(
          color: isDark ? Colors.white10 : const Color(0xFFE6EEEE),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: kThirdColor,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}