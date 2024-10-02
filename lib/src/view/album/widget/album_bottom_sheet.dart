import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_memorable/src/service/theme_service.dart';
import 'package:project_memorable/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:project_memorable/theme/component/button/button.dart';
import 'package:project_memorable/util/lang/generated/l10n.dart';

class AlbumBottomSheet extends StatelessWidget {
  const AlbumBottomSheet({
    super.key,
    required this.onGalleryPressed,
    required this.onCameraPressed,
    required this.onFilePressed,
  });

  final void Function() onGalleryPressed;
  final void Function() onCameraPressed;
  final void Function() onFilePressed;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      padding: EdgeInsets.only(
        top: 28,
        // left: 50,
        // right: 50,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '업로드',
              style: context.typo.headline1.copyWith(
                //color: context.color.text,
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // runSpacing: 40,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 30,
                      color: context.color.text,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      '갤러리',
                      style: context.typo.subtitle1.copyWith(
                        color: context.color.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 30,
                      color: context.color.text,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      '카메라',
                      style: context.typo.subtitle1.copyWith(
                        color: context.color.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 30,
                      color: context.color.text,
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      '파일',
                      style: context.typo.subtitle1.copyWith(
                        color: context.color.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Button(
              size: ButtonSize.small,
              backgroundColor: context.color.hint.withOpacity(0.4),
              color: context.color.subtext,
              text: '업로드 목록',
              onPressed: () {
                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (context) => const UserProfileView(),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
