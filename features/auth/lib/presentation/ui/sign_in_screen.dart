import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:component/widget/button/custom_button.dart';
import 'package:component/widget/text_field/custom_text_field.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:resources/colors.gen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final AuthRouter _authRouter = sl();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(
            height: 124.h,
          ),
          Text(
            "Sign In",
            style: TextStyle(
                color: ColorName.orange,
                fontSize: 30.sp,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 43.h,
          ),
          CustomTextField(
            labelText: "Username",
            controller: usernameController,
            errorText: "",
            onChanged: (value) => {},
            textInputType: TextInputType.name,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            labelText: "Password",
            controller: passwordController,
            errorText: "",
            onChanged: (value) => {},
            obscureText: true,
          ),
          SizedBox(
            height: 128.h,
          ),
          CustomButton(
            buttonText: "Masuk",
            onTap: () => {},
          ),
          SizedBox(
            height: 34.h,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Belum punya akun ? ",
                style: TextStyle(
                  color: ColorName.textLightGrey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Daftar",
                    style: TextStyle(
                      color: ColorName.textBlack,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _authRouter.navigateToSignUp(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 84.h,
          )
        ],
      ),
    );
  }
}
