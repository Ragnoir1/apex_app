import 'package:flutter/material.dart';

extension ToPadding on Widget {
  Widget paddingOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
        top: top ?? 0,
      ),
      child: this,
    );
  }

  Widget paddingSymmetric({
    double? vertical,
    double? horizontal,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      child: this,
    );
  }

  Widget paddingAll(
    double value,
  ) {
    return Padding(
      padding: EdgeInsets.all(
        value,
      ),
      child: this,
    );
  }
}
