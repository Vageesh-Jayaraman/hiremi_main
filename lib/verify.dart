import 'package:flutter/material.dart';
import 'package:hiremi_version_two/verification_screens/verification_screen1.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum Gender { Male, Female, Other }

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  Gender? _selectedGender;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isAllFieldsValid() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _fatherNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _birthPlaceController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review & Verify Your Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      CircularPercentIndicator(
                        radius: screenHeight * 0.05,
                        lineWidth: 6,
                        percent: 0.25,
                        center: const Text(
                          '25%',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        progressColor: Colors.green,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      SizedBox(height: screenHeight * 0.0075),
                      const Text(
                        'Harsh Pawar',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: screenHeight * 0.0075),
                      Container(
                        // height: screenHeight * 0.03,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenWidth * 0.1),
                          border: Border.all(color: const Color(0xFFC1272D)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: const Color(0xFFC1272D),
                                size: screenWidth * 0.02,
                              ),
                              Text(
                                ' Not verified',
                                style: TextStyle(
                                  color: const Color(0xFFC1272D),
                                  fontSize: screenWidth *
                                      0.02, // Adjusted based on screen width
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  height: 1,
                  width: screenWidth,
                  color: Colors.grey,
                ),
                SizedBox(height: screenHeight * 0.04),
                const Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: screenHeight * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Full name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: TextFormField(
                        controller: _fullNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Row(
                      children: [
                        Text(
                          "Father's Full name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: TextFormField(
                        controller: _fatherNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your father\'s full name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Row(
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: Gender.Male,
                              groupValue: _selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            const Text('Male'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Gender.Female,
                              groupValue: _selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            const Text('Female'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Gender.Other,
                              groupValue: _selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            const Text('Other'),
                          ],
                        ),
                      ],
                    ),
                    if (_selectedGender == null)
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Please select a gender',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: screenHeight * 0.02),
                    const Row(
                      children: [
                        Text(
                          'Email Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Row(
                      children: [
                        Text(
                          'Date of Birth',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: TextFormField(
                        controller: _dobController,
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(screenHeight * 0.015),
                          hintText: 'Select your date of birth',
                        ),
                        onTap: () {
                          _selectDate(context);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          // Additional validation for date format can be added here
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Row(
                      children: [
                        Text(
                          'Birth Place',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: TextFormField(
                        controller: _birthPlaceController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your birth place';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFC1272D),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_isAllFieldsValid()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const VerificationScreen1()));
                              } else {
                                setState(() {});
                              }
                            },
                            child: Text(
                              'Review & Verify >',
                              style: TextStyle(
                                  fontSize: screenHeight * 0.015,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 64,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
