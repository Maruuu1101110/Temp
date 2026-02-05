import 'package:flutter/material.dart';
import '24_midterm_registration.dart';

import '../widgets/03_image.dart';
import '../widgets/01_textfields.dart';
import '../widgets/02_buttons.dart';

class MidtermSignIn extends StatefulWidget {
  const MidtermSignIn({super.key});

  @override
  State<MidtermSignIn> createState() => _MidtermSignInState();
}

class _MidtermSignInState extends State<MidtermSignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Color _primaryColor = Color.fromRGBO(148, 122, 234, 1);
  bool _obsText = true;
  bool _hideSuggestion = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.width < 600;
    final bool hasCreds =
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: screenSize.width <= 600
          ? AppBar(
              title: _hideSuggestion
                  ? null
                  : Text(
                      "Better on Landscape...",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              actions: [
                IconButton(
                  onPressed: () => setState(() {
                    _hideSuggestion = !_hideSuggestion;
                  }),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.message_outlined, color: _primaryColor),
                  ),
                ),
              ],
            )
          : null,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/purple.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
                minWidth: 500,
                minHeight: 600,
              ),
              child: Container(
                height: 600,
                margin: isPortrait
                    ? EdgeInsets.only(bottom: 20, right: 20, left: 20)
                    : EdgeInsets.only(bottom: 20, top: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImage(
                        imagePath: "assets/login_stars_img.png",
                        scale: 10,
                      ),
                      Text(
                        "Login Account",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: _primaryColor,
                          fontSize: 30,
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Welcomeback explorer!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'sans',
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomTextfield1(
                        controller: _usernameController,
                        label: "Username",
                        hinText: "user1010",
                        borderColor: _primaryColor,
                        prefixIcon: Icons.person_outlined,
                        onChanged: (value) => setState(() {}),
                      ),
                      SizedBox(height: 10),
                      CustomTextfield1(
                        controller: _passwordController,
                        obs: _obsText,
                        label: "Password",
                        hinText: "* * * * * * *",
                        borderColor: _primaryColor,
                        prefixIcon: Icons.lock_outlined,
                        suffix: TextButton(
                          onPressed: () => setState(() {
                            _obsText = !_obsText;
                          }),
                          child: Text(_obsText ? "Show" : "Hide"),
                        ),
                        onChanged: (value) => setState(() {}),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => MidtermRegistration(),
                                  ),
                                ),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                      CustomButtons(
                        text: "Sign In",
                        enabled: hasCreds,
                        fontSize: 18,
                        height: 45,
                        width: screenSize.width,
                        gradient: LinearGradient(
                          end: AlignmentGeometry.bottomCenter,
                          begin: AlignmentGeometry.topCenter,
                          colors: [
                            Color.fromRGBO(183, 145, 248, 1),
                            Color.fromRGBO(116, 102, 234, 1),
                          ],
                        ),
                        onPress: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MidtermRegistration(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButtons(
                        text: "Clear",
                        height: 45,
                        width: screenSize.width,
                        color: Color.fromRGBO(23, 22, 40, 1),
                        onPress: () => setState(() {
                          _usernameController.clear();
                          _passwordController.clear();
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
