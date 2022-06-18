import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikki_shop/generated/assets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const onBackground = Colors.white;
    return Theme(
      data: themeData.copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size.fromHeight(56)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary)),
          ),
          colorScheme: themeData.colorScheme.copyWith(onSurface: onBackground),
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: onBackground),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: onBackground, width: 1),
                  borderRadius: BorderRadius.circular(12)))),
      child: Scaffold(
        backgroundColor: themeData.colorScheme.secondary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesNikeLogo,
                color: Colors.white,
                width: 120,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                isLogin ? 'خوش آمدید' : 'ثبت نام ',
                style: TextStyle(color: onBackground, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  isLogin
                      ? 'لطفا وارد حساب کاربری خود شوید'
                      : 'لطفا ثبت نام كنيد',
                  style: TextStyle(color: onBackground, fontSize: 14)),
              SizedBox(
                height: 16,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(label: Text('آدرس ایمیل'))),
              SizedBox(
                height: 16,
              ),
              _PasswordTextField(onBackground: onBackground),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {}, child: Text(isLogin ? "ورود" : "ثبت نام")),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLogin ? "حساب كاربري نداريد؟" : "حساب كاربري داريد؟",
                      style: TextStyle(color: onBackground),
                    ),
                    SizedBox(width: 4),
                    Text(
                      isLogin ? "ثبت نام " : "ورود",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    Key? key,
    required this.onBackground,
  }) : super(key: key);

  final Color onBackground;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          label: Text('رمز عبور'),
          suffixIcon: IconButton(
            icon: Icon(
                obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
            color: widget.onBackground.withOpacity(0.6),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          )),
    );
  }
}
