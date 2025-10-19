import 'package:flutter/material.dart';
import 'package:trial/practice_file.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final String _pretendUser = "User";
  final String _pretendPass = "pass123";

  bool obsText = true;

  void verifyCredentials() {
    if (_unameController.text == _pretendUser &&
        _passController.text == _pretendPass) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              PracticeFile(),
        ),
      );
    } else if (_unameController.text.isEmpty || _passController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          width: 200,
          elevation: 10,
          backgroundColor: Colors.deepPurpleAccent.shade100,
          content: Text(
            "Enter a valid input",
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          width: 200,
          elevation: 10,
          backgroundColor: Colors.deepPurpleAccent.shade100,
          content: Text(
            "Wrong Credentials",
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  Widget _createLoginForm(screenWidth) {
    return SizedBox(
      width: screenWidth < 1100 ? screenWidth * 0.5 : 500,
      height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              controller: _unameController,
              decoration: InputDecoration(
                hintText: "Username",
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              obscureText: obsText,
              controller: _passController,
              decoration: InputDecoration(
                hintText: "Password",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  tooltip: obsText ? "Show" : "Hide",
                  onPressed: () => setState(() {
                    obsText = !obsText;
                  }),
                  icon: Icon(
                    obsText
                        ? Icons.remove_red_eye_sharp
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: screenWidth < 700 ? screenWidth * 0.45 : 450,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextButton(
              onPressed: verifyCredentials,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late final screenWidth = MediaQuery.of(context).size.width.toInt();
    bool isMobile = screenWidth < 1100;
    debugPrint("Screen WIDTH: $screenWidth");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("U: User | P: pass123", style: TextStyle(fontSize: 10)),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Flex(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              SizedBox(
                width: isMobile ? 500 : (screenWidth / 2) * 0.9,

                child: Image.asset("assets/login_image.png"),
              ),
              SizedBox(height: 20),
              _createLoginForm(screenWidth),
            ],
          ),
        ),
      ),
    );
  }
}
