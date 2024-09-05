import 'package:apex_app/extensions/padding.dart';
import 'package:apex_app/resourses/colors.dart';
import 'package:apex_app/resourses/images.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool? hideAppBar;
  final String? title;
  const AppScaffold(
      {super.key,
      required this.body,
      this.hideAppBar = false,
      this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: hideAppBar == true
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                title!,
                style: const TextStyle(
                    fontFamily: "Apex", fontSize: 36, color: Colors.white),
              ),
              centerTitle: true,
            ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: body.paddingOnly(top: kToolbarHeight + 24),
        ),
      ),
    );
  }
}
