import 'package:flutter/material.dart';
import '../screens/23_activity3_signin.dart';
import '../widgets/01_textfields.dart';
import '../widgets/02_buttons.dart';
import '../widgets/03_image.dart';

class AddRegistrationScreen extends StatefulWidget {
  const AddRegistrationScreen({super.key});

  @override
  State<AddRegistrationScreen> createState() => _AddRegistrationScreenState();
}

class _AddRegistrationScreenState extends State<AddRegistrationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();

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
                      "Create Your Account",
                      style: TextStyle(
                        color: Color.fromRGBO(94, 87, 223, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans-serif",
                      ),
                    ),
                    SizedBox(height: 20),
                    AddImage(
                      imagePath: "assets/registration_demp.png",
                      imageWidth: 700,
                      imageHeight: 300,
                    ),

                    Divider(thickness: 2),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AddTextFormField(
                            textController: _firstNameController,
                            hintText: "Juan",
                            textLabel: "First Name",
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: AddTextFormField(
                            textController: _lastNameController,
                            hintText: "Luna",
                            textLabel: "Last Name",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    AddTextFormField(
                      textController: _emailController,
                      hintText: "email@gmail.com",
                      textLabel: "Email Address",
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: 10),
                    AddTextFormField(
                      textController: _courseController,
                      hintText: "BSCS - 2",
                      textLabel: "Course and Year",
                      prefixIcon: Icons.calendar_month_outlined,
                    ),
                    SizedBox(height: 10),
                    AddTextFormField(
                      textController: _departmentController,
                      hintText: "CCS",
                      textLabel: "Department",
                      prefixIcon: Icons.group,
                    ),
                    SizedBox(height: 10),
                    AddTextFormField(
                      textController: _collegeController,
                      hintText: "College of ...",
                      textLabel: "College",
                      prefixIcon: Icons.school,
                    ),
                    SizedBox(height: 20),
                    AddButton(
                      buttonText: "Submit",
                      buttonColor: Color.fromRGBO(105, 97, 249, 1),
                      foregroundColor: Colors.white,
                      onButtonPressed: () {
                        return Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddSignInScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    AddButton(
                      buttonText: "Clear",
                      onButtonPressed: () {
                        setState(() {
                          _collegeController.clear();
                          _courseController.clear();
                          _departmentController.clear();
                          _firstNameController.clear();
                          _lastNameController.clear();
                          _emailController.clear();
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
