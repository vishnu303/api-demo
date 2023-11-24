import 'package:api_demo/model/post_model.dart';
import 'package:api_demo/repo/api_call.dart';
import 'package:api_demo/screens/home_screen.dart';
import 'package:api_demo/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Post? posts;

  void getPostresponse() async {
    posts = await ApiCall.postData();
    setState(() {});
  }

  @override
  void initState() {
    getPostresponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: sHeight,
        width: sWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                              .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    labelText: 'Email',
                    obscureText: false,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the password';
                      }
                      return null;
                    },
                    controller: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (emailController.text == posts!.title &&
                      passwordController.text == posts!.body) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('incorrect email or password ')));
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
