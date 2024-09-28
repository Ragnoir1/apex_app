import 'package:apex_app/data/api/api_client.dart';
import 'package:apex_app/modules/auth_page/cubit/auth_page_cubit.dart';
import 'package:apex_app/resourses/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final FocusNode focusNode = FocusNode();

class CustomTextfield extends StatelessWidget {
  CustomTextfield({super.key, required this.gamingPlatform});
  final GamingPlatform gamingPlatform;
  final api = ApiClient();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: context.read<AuthPageCubit>().textEditingController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                border: Border.all(color: Colors.white, width: 2)),
            child: PopupMenuButton(
              offset: const Offset(2, -2),
              icon: context
                  .read<AuthPageCubit>()
                  .getImageSelectedPlatform(gamingPlatform),
              constraints: const BoxConstraints(maxWidth: 56),
              initialValue: gamingPlatform,
              itemBuilder: (context) => <PopupMenuEntry<GamingPlatform>>[
                PopupMenuItem(
                  value: GamingPlatform.pc,
                  padding: const EdgeInsets.only(left: 18),
                  onTap: () {
                    context
                        .read<AuthPageCubit>()
                        .changePlatform(GamingPlatform.pc);
                    print(gamingPlatform);
                  },
                  child: Image(
                    image: windowsIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
                PopupMenuItem(
                  value: GamingPlatform.ps,
                  padding: const EdgeInsets.only(left: 18),
                  onTap: () {
                    context
                        .read<AuthPageCubit>()
                        .changePlatform(GamingPlatform.ps);
                    print(gamingPlatform);
                  },
                  child: Image(
                    image: playstationIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
                PopupMenuItem(
                  value: GamingPlatform.xbox,
                  padding: const EdgeInsets.only(left: 18),
                  onTap: () {
                    context
                        .read<AuthPageCubit>()
                        .changePlatform(GamingPlatform.xbox);
                    print(focusNode);
                  },
                  child: Image(
                    image: xboxIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
    );
  }
}
