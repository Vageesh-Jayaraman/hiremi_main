import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
import 'package:hiremi_version_two/Login.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'images/Hiremi_new_Icon.png',
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Create new Password.\n",
                                  style: TextStyle(
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black, // Default text color
                                  ),
                                ),
                                TextSpan(
                                  text: " Make it stronger",
                                  style: TextStyle(
                                    fontSize: 21.0,
                                    // color: Color(0xFF34AD78), // Uncomment if you want to set a different color
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black, // Default text color
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center, // Center align the text
                          ),
                        ),


                        Center(
                          child: Image.asset(
                            'images/ResetPassword.png',
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.35,
                          ),
                        ),
                        CurvedContainer(
                          backgroundColor: Colors.white,
                          borderColor: Colors.black,
                          borderWidth: 0.53,
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0215),

                              SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
                              Padding(
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.611),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Password",
                                          style: TextStyle(
                                              color: Colors.black
                                          )
                                      ),
                                      TextSpan(
                                        text: " *",
                                        style: TextStyle(color: Colors.red), // Red asterisk
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0205),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                child: CurvedTextField(
                                  hintText: "********",
                                  prefixIcon: Icons.lock,
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
                              Padding(
                                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.411),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Confirm new Password",
                                          style: TextStyle(
                                              color: Colors.black
                                          )
                                      ),
                                      TextSpan(
                                        text: " *",
                                        style: TextStyle(color: Colors.red), // Red asterisk
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0205),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                                child: CurvedTextField(
                                  hintText: "********",
                                  prefixIcon: Icons.lock,
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0247),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Password must be ",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "8 digit",
                                      style: TextStyle(color: Colors.blue), // Change text color to blue
                                    ),
                                    TextSpan(
                                      text: " long with combination of\nalphanumeric value",
                                      style: TextStyle(color: Colors.black),
                                    ),


                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.0285),
                              Center(
                                child: CustomElevatedButton(
                                  width: MediaQuery.of(context).size.width * 0.775,
                                  height: MediaQuery.of(context).size.height * 0.0625,
                                  text: 'Reset Password',
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      SlidePageRoute(page: LogIn()),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height * 0.0447),
                            ],
                          ),
                        ),
                      ],
            ),
          ),
      ),
    );
  }
}
