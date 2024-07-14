import 'package:flutter/material.dart';
import 'package:hiremi_version_two/verification_screens/verifiaction_screen2.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class VerificationScreen1 extends StatefulWidget {
  const VerificationScreen1({Key? key}) : super(key: key);

  @override
  State<VerificationScreen1> createState() => _VerificationScreen1State();
}

class _VerificationScreen1State extends State<VerificationScreen1> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _whatsappNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _whatsappNumberController.dispose();
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
                        percent: 0.50,
                        center: const Text(
                          '50%',
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
                                  fontSize: screenWidth * 0.02,
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
                  'Contact Information',
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
                          'Phone Number',
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
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Please enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Row(
                      children: [
                        Text(
                          'WhatsApp Number',
                          style: TextStyle(),
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
                        controller: _whatsappNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your WhatsApp number';
                          } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Please enter a valid 10-digit WhatsApp number';
                          }
                          return null;
                        },
                      ),
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
                              if (_formKey.currentState?.validate() ?? false) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => const VerificationScreen2()));
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
