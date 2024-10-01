import 'package:apex_app/data/session_data_provider.dart';
import 'package:apex_app/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class LegendsPageView extends StatelessWidget {
  const LegendsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          // MaterialButton(
          //   color: Colors.blue,
          //   child: Text("Запись"),
          //   onPressed: () {
          //     SessionDataProvider().savePlayer("Иван");
          //   },
          // ),
          // MaterialButton(
          //   color: Colors.blue,
          //   child: Text("Удаление"),
          //   onPressed: () {
          //     SessionDataProvider().deletPlayer();
          //   },
          // ),
          // MaterialButton(
          //   color: Colors.blue,
          //   child: Text("Проверка"),
          //   onPressed: () {
          //     SessionDataProvider().checkAuth();
          //   },
          // ),
        ],
      ),
    );
  }
}
