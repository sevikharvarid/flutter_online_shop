import 'package:common/utils/navigation/router/auth_router.dart';
import 'package:component/widget/button/custom_button.dart';
import 'package:component/widget/text_field/custom_text_field.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key});
  final AuthRouter authRouter = sl();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            authRouter.goBack();
          },
          icon: Icon(Icons.arrow_back),
          color: ColorName.orange,
        ),
        centerTitle: false,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: ColorName.orange,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(
            height: 47.h,
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
            height: 20.h,
          ),
          CustomTextField(
            labelText: "Confirm Password",
            controller: confirmPasswordController,
            errorText: "",
            onChanged: (value) => {},
            obscureText: true,
          ),
          SizedBox(
            height: 39.h,
          ),
          CustomButton(
            buttonText: "Sign Up",
            onTap: () => {},
          )
        ],
      ),
    );
  }
}
