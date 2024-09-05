// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProgressBarLevel extends StatelessWidget {
  final int toNextLevelPercent;
  const ProgressBarLevel({
    super.key,
    required this.toNextLevelPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: BeveledRectangleClipper(),
          child: Container(
            color: Colors.black.withOpacity(0.4),
            width: 180,
            height: 16,
          ),
        ),
        ClipPath(
          clipper: BeveledRectangleClipper(),
          child: Container(
            color: Colors.white,
            width: 180 * (toNextLevelPercent / 100),
            height: 16,
          ),
        ),
      ],
    );
  }
}

class BeveledRectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(16, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 16, 16)
      ..lineTo(0, 16)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
