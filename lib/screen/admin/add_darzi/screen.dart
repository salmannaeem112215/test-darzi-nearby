// ignore_for_file: unnecessary_import, unused_import, prefer_const_constructors

import 'dart:io';

import 'package:darzi_nearby/app/icon_config.dart';
import 'package:darzi_nearby/app/utility/image_picker.dart';
import 'package:darzi_nearby/darzi_nearby.dart';
import 'package:darzi_nearby/screen/admin/add_darzi/select_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AddDarziScreen extends StatefulWidget {
  const AddDarziScreen({super.key});
  @override
  State<AddDarziScreen> createState() => _AddDarziScreenState();
}

class _AddDarziScreenState extends State<AddDarziScreen> {
  final controller = Get.find<AddDarziController>();
  @override
  void initState() {
    super.initState();
  }

  void _setAvatar() {
    Get.back();
    Get.to(() => SelectAvatar(
        setAvatar: (val) =>
            controller.form.darziImage.value = FileOrImgUrl(val)));
  }

  void _uploadDImage() async {
    Get.back();
    final image =
        await MyImagePicker().getImage(maxSize: 200, context: context);
    if (image != null) {
      controller.form.darziImage.value = FileOrImgUrl(image);
    }
  }

  void _uploadDarziImage() {
    Get.bottomSheet(BottomSheet(
        onClosing: () {},
        enableDrag: false,
        showDragHandle: false,
        backgroundColor: Colors.white,
        builder: (context) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyTile(
                    icon: IconConfigX.user,
                    text: 'Upload Avatar',
                    onTap: _setAvatar,
                  ),
                  MyTile(
                    icon: IconConfigX.gallery,
                    text: 'Upload Image',
                    onTap: _uploadDImage,
                  ),
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Btn.floating(
        titleText: 'Add Darzi',
        onTap: controller.addDarzi,
      ),
      appBar: AppBar(
        title: Text(
          "Add Darzi",
          style: MyTextStyles.r24LightBrown,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageUploader.profile(
              controller.form.darziImage,
              onTap: _uploadDarziImage,
            ),
            DarziOptionalUploadImages(
              images: controller.form.darziMediaImages,
            ),
            Form(
              key: controller.form.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyInputField(controller.form.fullname),
                  MyInputField(controller.form.phoneNo),
                  MyInputField(controller.form.address),
                  MyInputField(controller.form.addressUrl),
                  Row(
                    children: [
                      Expanded(
                        child: MyInputField(controller.form.latitude),
                      ),
                      Expanded(
                        child: MyInputField(controller.form.longitude),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  HeaderTile(title: 'Services'),
                  Obx(() {
                    final service = controller.form.service;

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:
                            List.generate(service.data.length + 1, (index) {
                          if (index == service.data.length) {
                            return ServiceFormHeaderTile.add(
                              index,
                              service.add,
                              onTileTap: service.add,
                            );
                          }
                          return ServiceFormTile(
                            items: service,
                            count: index,
                          );
                        }));
                  }),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
