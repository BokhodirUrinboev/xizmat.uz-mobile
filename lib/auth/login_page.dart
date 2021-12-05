
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xizmat_uz/network/auth_servise.dart';

import 'package:xizmat_uz/ui/registration_page.dart';

enum LoginType { LOGIN, REGISTER }

class LoginPage extends StatefulWidget {
  LoginType loginType;
  AuthService apiService = AuthService();

  LoginPage({Key? key, this.loginType = LoginType.LOGIN}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController loginController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Login"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _inputField(
                        loginController,
                        Icon(Icons.person_outline,
                            size: 30, color: Color(0xffA6B0BD)),
                        "Username",
                        false),
                    _inputField(
                        passwordController,
                        Icon(Icons.lock_outline,
                            size: 30, color: Color(0xffA6B0BD)),
                        "Password",
                        true),
                    _loginBtn(),
                    _signUp()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController controller, Icon prefixIcon,
      String hintText, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xff000912),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, bottom: 50),
      decoration: BoxDecoration(
          color: Color(0xff008FFF),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color(0x60008FFF),
              blurRadius: 10,
              offset: Offset(0, 5),
              spreadRadius: 0,
            ),
          ]),
      child: FlatButton(
        onPressed: () {
          // c.duery(ACCOUNT);

          if (widget.loginType == LoginType.LOGIN)
            widget.apiService.login(
                email: loginController.text,
                password: passwordController.text,
                onComplate: () {
                  Get.offAll(RegistrattionPageWidget());
                });
          else
            widget.apiService.register(
                email: loginController.text,
                password: passwordController.text,
                onComplate: () {
                  Get.offAll(RegistrattionPageWidget());
                });
        },
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "SIGN IN",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

Widget _signUp() {
  return FlatButton(
    onPressed: () => {
      Get.to(LoginPage(
        loginType: LoginType.REGISTER,
      ))
    },
    child: Text(
      "SIGN UP NOW",
      style: TextStyle(
        color: Color(0xFF008FFF),
        fontWeight: FontWeight.w800,
        fontSize: 16,
      ),
    ),
  );
}
