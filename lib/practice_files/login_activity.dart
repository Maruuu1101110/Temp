import 'package:flutter/material.dart';
import 'package:trial/widgets/text_field_custom.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 350,
              child: Column(
                children: [
                  // use this if you have the asset: (uncomment lang)
                  // Image.asset('assets/welcome-cat.gif', scale: 2),
                  Image.network(
                    'https://cdn.dribbble.com/userupload/27506803/file/original-e44f127cefc05e9ace22c254a5ebc140.gif',
                    scale: 2,
                  ),

                  Divider(thickness: 5),
                  SizedBox(height: 50),
                  CustomTextField(
                    controller: _emailController,
                    label: "Email Address",
                    hintText: "email@gmail.com",
                    suffix: Icon(Icons.mail),
                    obscure: false,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: isObs ? '********' : "password",
                    suffix: IconButton(
                      onPressed: () => setState(() {
                        isObs = !isObs;
                      }),
                      tooltip: isObs ? "Show" : "Hide",
                      icon: Icon(
                        isObs
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                      ),
                    ),
                    obscure: isObs,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
