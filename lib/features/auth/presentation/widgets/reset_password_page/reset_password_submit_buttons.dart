import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';

class ResetPasswordSubmitButtons extends StatelessWidget {
  const ResetPasswordSubmitButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.email,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Map authData = {
                  "email": email,
                };
                BlocProvider.of<AuthBloc>(context)
                    .add(ResetPasswordEvent(authData));
              }
            },
            child: const Text('Reset'),
          ),
        ),
      ],
    );
  }
}
