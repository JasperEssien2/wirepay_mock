import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wirepay_mock/utils/utils_export.dart';

class WidgetUtil {
  WidgetUtil._();

  static BoxDecoration get buildShimmerBoxDecoration {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    );
  }

  static Widget shimmerColorWidget(Widget child) {
    return Shimmer.fromColors(
      child: child,
      baseColor: Colors.grey[300]!,
      highlightColor: accentColor,
    );
  }

  static bool handleScrollNotification(
      ScrollNotification notification, Function loadMore) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.extentAfter == 0) {
        loadMore();
      }
    }
    return false;
  }

  static Widget bottomListLoadingWidget() {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: CircularProgressIndicator(
          color: accentColor,
        ),
      ),
    );
  }
}
