import 'package:flutter/material.dart';
import '../widgets/sign_up_page/sign%20up_form.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: <Widget>[
                    _buildHeader(),
                    _buildForm(),
                  ],
                ),
              ),
              _buildSignInButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Already here  ?  ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).primaryColorLight,
                )),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => SignInPage()));
              },
              child: Text(' Sign In !',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ],
    );
  }

  Padding _buildForm() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SignUpForm(),
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
