import 'package:flutter/material.dart';
import 'package:todo/features/auth/presentation/pages/reset_password_page.dart';

import '../widgets/sign_in_page/sign_in_form.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
              _buildSignUpButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildSignUpButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Forgot Password ?  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Theme.of(context).primaryColorLight)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => ResetPasswordPage()));
                },
                child: Text('Reset !',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New here ?  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Theme.of(context).primaryColorLight)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => SignUpPage()));
                },
                child: Text('Sign Up !',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildForm() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SignInForm(),
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
