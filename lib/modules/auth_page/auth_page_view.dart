import 'package:apex_app/extensions/padding.dart';
import 'package:apex_app/modules/auth_page/cubit/auth_page_cubit.dart';
import 'package:apex_app/resourses/colors.dart';
import 'package:apex_app/resourses/images.dart';
import 'package:apex_app/widgets/app_scaffold.dart';
import 'package:apex_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPageView extends StatelessWidget {
  const AuthPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocBuilder<AuthPageCubit, AuthPageState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image(
                    image: apexLogo,
                    height: 95,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    "Введите Origin ID",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.activeColor,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    gamingPlatform: state.selectedPlatform,
                  ).paddingSymmetric(horizontal: 64),
                  const SizedBox(
                    height: 24,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Ink(
                        height: 30,
                        width: 115,
                        decoration: BoxDecoration(
                            color: AppColors.apply,
                            borderRadius: BorderRadius.circular(5)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Войти',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ClipRect(
                child: Image(
                  height: 400,
                  image: mainImage,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
