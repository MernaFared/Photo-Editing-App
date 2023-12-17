import 'package:flutter/material.dart';
import '../screens/apply_watermark/apply_watermark_screen.dart';
import '../screens/convert_color_space/convert_color_space_screen.dart';
import '../screens/flip_image/flip_image_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/remove_background/remove_background_screen.dart';
import '../shared/colors.dart';
import '../shared/shared.dart';

import '../screens/binarize_image/binarize_image_screen.dart';
import '../screens/denoise_image/denoise_image_screen.dart';
import '../screens/detect_objects_from_image/detect_objects_from_image_screen.dart';
import '../screens/replace_background/replace_background_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 60,
            color: kBlueColor,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const TestHomeScreen());

            },
          ),
          ListTile(
            leading: const Icon(
              Icons.remove_circle_outline,
            ),
            title: const Text('Remove Background'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const RemoveBackgroundScreen());

            },
          ),
          ListTile(
            leading: const Icon(
              Icons.find_replace_outlined,
            ),
            title: const Text('Replace Background'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const ReplaceBackgroundScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.find_replace_outlined,
            ),
            title: const Text('Image Denoise'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const DenoisingImageScreen());
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.find_replace_outlined,
            ),
            title: const Text('Detect Objects'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const DetectObjectsFromImageScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.find_replace_outlined,
            ),
            title: const Text('Flip Image'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const FlipImageScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.find_replace_outlined,
            ),
            title: const Text('Binarize Image'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const BinarizeImageScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.find_replace_outlined,
            ),
            title: const Text('convert color space Image'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const ConvertColorSpaceScreen());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.find_replace_outlined,
            ),
            title: const Text('Apply Watermark'),
            onTap: () {
              Navigator.pop(context);
              navigateTo(context, const ApplyWatermarkScreen());
            },
          ),
        ],
      ),
    );
  }
}
