import 'package:flutter/material.dart';
import 'package:hiremi_version_two/verification_screens/verification_screen3.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class VerificationScreen2 extends StatefulWidget {
  const VerificationScreen2({Key? key}) : super(key: key);

  @override
  State<VerificationScreen2> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen2> {
  final TextEditingController _collegeNameController = TextEditingController();
  final TextEditingController _collegeStateController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _passYearController = TextEditingController();

  bool _collegeNameValid = true;
  bool _collegeStateValid = true;
  bool _branchValid = true;
  bool _degreeValid = true;
  bool _passYearValid = true;

  bool _isAllFieldsValid() {
    setState(() {
      _collegeNameValid = _collegeNameController.text.isNotEmpty;
      _collegeStateValid = _collegeStateController.text.isNotEmpty;
      _branchValid = _branchController.text.isNotEmpty;
      _degreeValid = _degreeController.text.isNotEmpty;
      _passYearValid = _passYearController.text.isNotEmpty;
    });

    return _collegeNameValid &&
        _collegeStateValid &&
        _branchValid &&
        _degreeValid &&
        _passYearValid;
  }

  @override
  void dispose() {
    _collegeNameController.dispose();
    _collegeStateController.dispose();
    _branchController.dispose();
    _degreeController.dispose();
    _passYearController.dispose();
    super.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: screenHeight * 0.05,
                      lineWidth: 6,
                      percent: 0.75,
                      center: const Text(
                        '75%',
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
                'Education Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(
                    controller: _collegeNameController,
                    labelText: 'College Name',
                    isValid: _collegeNameValid,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  _buildTextField(
                    controller: _collegeStateController,
                    labelText: 'College State',
                    isValid: _collegeStateValid,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  _buildTextField(
                    controller: _branchController,
                    labelText: 'Branch',
                    isValid: _branchValid,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  _buildTextField(
                    controller: _degreeController,
                    labelText: 'Degree',
                    isValid: _degreeValid,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  _buildTextField(
                    controller: _passYearController,
                    labelText: 'Passout Year',
                    isValid: _passYearValid,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFC1272D))),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Replace with your error handling logic here
                          },
                          child: Text(
                            '< Edit Previous',
                            style: TextStyle(
                                fontSize: screenHeight * 0.015,
                                color: const Color(0xFFC1272D)),
                          ),
                        ),
                      ),
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
                                  builder: (ctx) =>
                                      const VerificationScreen3()));
                            } else {
                              print('Please fill in all required fields.');
                              // Replace with your error handling logic here
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
                ],
              ),
              const SizedBox(
                height: 64,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required bool isValid,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(labelText),
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
            border: Border.all(
              color: isValid ? Colors.green : Colors.red,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(screenHeight * 0.015),
              errorText: isValid ? null : 'This field cannot be empty',
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
