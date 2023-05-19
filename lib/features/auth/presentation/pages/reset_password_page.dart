import 'package:flutter/material.dart';
import 'package:todo/features/auth/presentation/widgets/reset_password_page/reset_password_form.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  _buildHeader(),
                  _buildForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Padding _buildForm() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: ResetPasswordForm(),
    );
  }

  Column _buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 80),
        buildLogo(),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
              text: "TODO",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildLogo() {
    return Container(
      height: 100,
      width: 100,
      child: Center(child: Image.asset("assets/images/app-icon.png")),
    );
  }
}
