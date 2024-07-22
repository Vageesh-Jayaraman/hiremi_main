import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/HomePage.dart';
import 'package:hiremi_version_two/SplashScreen.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'API_Integration/Register/apiServices.dart';

class Registers extends StatefulWidget {
  const Registers({Key? key}) : super(key: key);

  @override
  _RegistersState createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  final _formKey = GlobalKey<FormState>();
  Gender? _selectedGender = Gender.Male;
  DateTime? _selectedDate;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _collegeNameController = TextEditingController();
  final TextEditingController _collegeStateController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _passingYearController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  RegisterService _apiService = RegisterService();

  void _handleGenderChange(Gender? value) {
    setState(() {
      _selectedGender = value;
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _fatherNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _birthPlaceController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _collegeNameController.dispose();
    _collegeStateController.dispose();
    _branchController.dispose();
    _degreeController.dispose();
    _passingYearController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      String genderValue = _selectedGender.toString().split('.').last;
      var user = {
        "full_name": _fullNameController.text,
        "father_name": _fatherNameController.text,
        "email": _emailController.text,
        "date_of_birth": _dobController.text,
        "birth_place": _birthPlaceController.text,
        "phone_number": _phoneController.text,
        "whatsapp_number": _whatsappController.text,
        "college_name": _collegeNameController.text,
        "college_state": _collegeStateController.text,
        "branch_name": _branchController.text,
        "degree_name": _degreeController.text,
        "passing_year": _passingYearController.text,
        "password": _passwordController.text,
        "gender": genderValue,
      };
      var profileId = await _apiService.registerUser(user);
      if (profileId != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('profileId', profileId);
        print('Profile ID stored: $profileId');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );

      } else {
        print('Registration failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.6;
    double imageHeight = MediaQuery.of(context).size.height * 0.157;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'images/Hiremi_new_Icon.png',
                width: imageSize,
                height: imageHeight,
              ),
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Register to get started\n",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Start your journey with us ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0425),
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 0.53),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.045),
                    buildSectionHeader("Personal Information"),
                    buildLabeledTextField(
                      context,
                      "Full Name",
                      "John Doe",
                      controller: _fullNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Father's Full Name",
                      "Robert Dave",
                      controller: _fatherNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your father\'s full name';
                        }
                        return null;
                      },
                    ),
                    buildGenderField(),
                    buildLabeledTextField(
                      context,
                      "Email Address",
                      "yourEmail@gmail.com",
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Date Of Birth",
                      "YYYY-MM-DD",
                      controller: _dobController,
                      validator: (value) {
                        if (_selectedDate == null) {
                          return 'Please select your date of birth';
                        }
                        return null;
                      },
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                          });
                        }
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Birth Place",
                      "Enter Birth Place",
                      controller: _birthPlaceController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your birth place';
                        }
                        return null;
                      },
                    ),
                    buildSectionHeader("Contact Information"),
                    buildLabeledTextField(
                      context,
                      "Phone Number",
                      "+91",
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "WhatsApp Number",
                      "+91",
                      keyboardType: TextInputType.phone,
                      controller: _whatsappController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your WhatsApp number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid WhatsApp number';
                        }
                        return null;
                      },
                    ),
                    buildSectionHeader("Educational Information"),
                    buildLabeledTextField(
                      context,
                      "College Name",
                      "Enter College Name",
                      controller: _collegeNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your college name';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "College State",
                      "Enter College State",
                      controller: _collegeStateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your college state';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Branch",
                      "Enter Branch",
                      controller: _branchController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your branch';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Degree",
                      "Enter Degree",
                      controller: _degreeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your degree';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Passing Year",
                      "Enter Passing Year",
                      keyboardType: TextInputType.number,
                      controller: _passingYearController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your passing year';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Password",
                      "Enter Password",
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Confirm Password",
                      "Enter Confirm Password",
                      obscureText: true,
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.050),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _registerUser,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildLabeledTextField(
      BuildContext context,
      String label,
      String hintText, {
        required TextEditingController controller,
        bool obscureText = false,
        TextInputType keyboardType = TextInputType.text,
        required String? Function(String?)? validator,
        void Function()? onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            validator: validator,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Radio<Gender>(
              value: Gender.Male,
              groupValue: _selectedGender,
              onChanged: _handleGenderChange,
            ),
            Text('Male'),
            Radio<Gender>(
              value: Gender.Female,
              groupValue: _selectedGender,
              onChanged: _handleGenderChange,
            ),
            Text('Female'),
            Radio<Gender>(
              value: Gender.Other,
              groupValue: _selectedGender,
              onChanged: _handleGenderChange,
            ),
            Text('Other'),
          ],
        ),
      ],
    );
  }
}

enum Gender { Male, Female, Other }
