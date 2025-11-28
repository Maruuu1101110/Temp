import 'package:flutter/material.dart';
import '24_midterm_signin.dart';
import '../widgets/01_textfields.dart';
import '../widgets/02_buttons.dart';
import '../widgets/03_image.dart';

class MidtermRegistration extends StatefulWidget {
  const MidtermRegistration({super.key});

  @override
  State<MidtermRegistration> createState() => _MidtermRegistrationState();
}

class _MidtermRegistrationState extends State<MidtermRegistration> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();

  final Color _primaryColor = Color.fromRGBO(148, 122, 234, 1);

  bool _agreed = false;
  bool _hideSuggestion = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/purple.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              child: Container(
                width: 500,
                height: 700,
                margin: EdgeInsets.all(20),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImage(
                          imagePath: "assets/register_img.png",
                          scale: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Create Account",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: _primaryColor,
                                fontSize: 30,
                                fontFamily: 'Sans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Let’s get you set up in a flash!",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'sans',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield1(
                            controller: _firstNameController,
                            label: "First Name",
                            hinText: "EJ",
                            borderColor: _primaryColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: CustomTextfield1(
                            controller: _lastNameController,
                            label: "Last Name",
                            hinText: "Rosialda",
                            borderColor: _primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomTextfield1(
                      controller: _emailController,
                      label: "Email Adrress",
                      hinText: "your@email.com",
                      borderColor: _primaryColor,
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: 10),
                    CustomTextfield1(
                      controller: _courseController,
                      label: "Course and Year",
                      hinText: "BSCS - 2",
                      borderColor: _primaryColor,
                      prefixIcon: Icons.calendar_today_outlined,
                    ),
                    SizedBox(height: 10),
                    CustomTextfield1(
                      controller: _departmentController,
                      label: "Department",
                      hinText: "Computer Science",
                      borderColor: _primaryColor,
                      prefixIcon: Icons.group_outlined,
                    ),
                    SizedBox(height: 10),
                    CustomTextfield1(
                      controller: _collegeController,
                      label: "College",
                      hinText: "College of Computer Studies",
                      borderColor: _primaryColor,
                      prefixIcon: Icons.school_outlined,
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _agreed,
                            side: BorderSide(color: Colors.white),
                            onChanged: (value) => setState(() {
                              _agreed = !_agreed;
                            }),
                          ),
                          Text(
                            "I agree with the Terms and Conditions.",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),
                    CustomButtons(
                      text: "Create account",
                      fontSize: 18,
                      height: 45,
                      width: screenSize.width,
                      enabled: _agreed,
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
                          builder: (context) => MidtermSignIn(),
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
                        _firstNameController.clear();
                        _lastNameController.clear();
                        _emailController.clear();
                        _courseController.clear();
                        _departmentController.clear();
                        _collegeController.clear();
                      }),
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
