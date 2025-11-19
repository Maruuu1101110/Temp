import 'package:flutter/material.dart';
import '../screens/23_activity3_registration.dart';
import '../widgets/01_textfields.dart';
import '../widgets/02_buttons.dart';
import '../widgets/03_image.dart';

class AddSignInScreen extends StatefulWidget {
  const AddSignInScreen({super.key});

  @override
  State<AddSignInScreen> createState() => _AddSignInScreenState();
}

class _AddSignInScreenState extends State<AddSignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obsText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData(fontFamily: 'sans-serif'),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 30,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login Account",
                      style: TextStyle(
                        color: Color.fromRGBO(94, 87, 223, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans-serif",
                      ),
                    ),
                    SizedBox(height: 20),
                    AddImage(
                      imagePath: "assets/login_demp.png",
                      imageWidth: 700,
                      imageHeight: 300,
                    ),

                    Divider(thickness: 2),
                    SizedBox(height: 10),
                    AddTextFormField(
                      textController: _usernameController,
                      hintText: "user12345",
                      textLabel: "Username",
                      suffixWidget: Icon(Icons.person),
                    ),
                    SizedBox(height: 10),
                    AddTextFormField(
                      textController: _passwordController,
                      textLabel: "Password",
                      obsText: obsText,
                      suffixWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            obsText = !obsText;
                          });
                        },
                        icon: Icon(
                          obsText
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    AddButton(
                      buttonText: "Submit",
                      buttonColor: Color.fromRGBO(105, 97, 249, 1),
                      foregroundColor: Colors.white,
                      onButtonPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddRegistrationScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    AddButton(
                      buttonText: "Clear",
                      onButtonPressed: () {
                        setState(() {
                          setState(() {
                            _usernameController.clear();
                            _passwordController.clear();
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
