import 'package:apex_app/data/session_data_provider.dart';
import 'package:apex_app/routes/app_pages.dart';
import 'package:apex_app/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: MaterialButton(
        color: Colors.blue,
        child: Text("Выйти"),
        onPressed: () async {
          await SessionDataProvider().deletPlayer();
          Navigator.of(context).pushReplacementNamed(AppPages.authPage);
        },
      ),
    );
  }
}
