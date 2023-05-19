import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/widgets/loading_widget.dart';
import 'package:todo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo/features/auth/presentation/pages/sign_up_page.dart';
import 'package:todo/features/todo/presentation/bloc/get_todos/todo_bloc.dart';
import 'package:todo/features/todo/presentation/pages/todos_page.dart';
import 'package:todo/injection_container.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          Timer(Duration(seconds: 2), () {
            if (state is LoadedUserState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => BlocProvider<TodoBloc>(
                        create: (context) =>
                            sl<TodoBloc>()..add(GetAllTodosEvent()),
                        child: TodosPage(),
                      )));
            } else if (state is AuthInitial) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => SignUpPage()));
            }
          });
        },
        child: _buildSplashScreen(),
      ),
    );
  }

  Column _buildSplashScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(child: Image.asset('assets/images/app-icon.png', width: 100)),
        LoadingWidget(),
      ],
    );
  }
}
