import 'package:ecommerce_project/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, // مقدار پیش‌فرض همینه، ولی اگر false باشه، مشکل ایجاد میشه

        backgroundColor: ColorProject.blue,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    width: 100,
                    height: 100,
                    "assets/images/icon_application.png",
                  ),
                  SizedBox(height: 15),
                  Text(
                    "اپل شاپ",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "SB",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _userNameTextController,
                      decoration: InputDecoration(
                        labelText: 'نام کاربری',
                        labelStyle: TextStyle(
                          fontFamily: "SM",
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: ColorProject.blue,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        labelText: 'رمز عبور',
                        labelStyle: TextStyle(
                          fontFamily: "SM",
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: ColorProject.blue,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        if (state is AuthenticationInitial) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontFamily: "SB",
                                fontSize: 20,
                              ),
                              minimumSize: Size(200, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                AuthLoginRequest(
                                  _userNameTextController.text,
                                  _passwordTextController.text,
                                ),
                              );
                            },
                            child: Text("ورود به حساب کاربری "),
                          );
                        }
                        if (state is AuthStateLoading) {
                          return CircularProgressIndicator();
                        }

                        if (state is AuthResponseState) {
                          Text widget = Text("");
                          state.response.fold(
                            (l) {
                              widget = Text(l);
                            },
                            (r) {
                              widget = Text(r);
                            },
                          );
                          return widget;
                        }

                        return Text("خطای نا مشخص");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
