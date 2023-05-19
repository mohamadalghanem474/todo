import 'package:todo/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/snackbar_message.dart';
import '../../../../../core/widgets/loading_widget.dart';

import '../../bloc/auth_bloc.dart';
import 'reset_password_submit_buttons.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;

  SizedBox space = const SizedBox(height: 15);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: 'Email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some Email';
              }
              return null;
            },
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 15,
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthErrorState) {
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              } else if (state is ResetPasswordSuccessState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                Future.delayed(Duration(seconds: 5), () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                      (_) => false);
                });
              }
            },
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return LoadingWidget();
              }
              return ResetPasswordSubmitButtons(
                  formKey: _formKey, email: email);
            },
          )
        ],
      ),
    );
  }
}
