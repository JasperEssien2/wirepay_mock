import 'package:flutter/material.dart';
import 'package:wirepay_mock/utils/utils_export.dart';

import 'custom_button.dart';

class ErrorInfoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final String? icon;
  final double? iconSize;
  final String? caption;
  final String? actionText;
  final Function? btnAction;

  const ErrorInfoWidget({
    Key? key,
    this.caption,
    this.height,
    this.width,
    this.backgroundColor,
    this.icon,
    this.iconSize,
    this.actionText,
    this.btnAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Container(
        width: width ?? constraint.maxWidth,
        height: height ?? constraint.maxHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor ?? Colors.grey[200]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.hourglass_empty_outlined,
                      size: 100,
                      color: appColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      caption ?? 'Empty list',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                if (btnAction != null)
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: CustomButton(
                      text: actionText ?? 'CONTINUE',
                      onPressed: () => btnAction!(),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
