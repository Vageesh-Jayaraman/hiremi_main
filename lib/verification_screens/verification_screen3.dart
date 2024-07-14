import 'package:flutter/material.dart';
import 'package:hiremi_version_two/verified_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class VerificationScreen3 extends StatefulWidget {
  const VerificationScreen3({Key? key}) : super(key: key);

  @override
  State<VerificationScreen3> createState() => _VerificationScreen3State();
}

class _VerificationScreen3State extends State<VerificationScreen3> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();

  bool _idValid = true;
  bool _domainValid = true;

  bool _isAllFieldsValid() {
    setState(() {
      _idValid = _idController.text.isNotEmpty;
      _domainValid = _domainController.text.isNotEmpty;
    });

    return _idValid && _domainValid;
  }

  @override
  void dispose() {
    _idController.dispose();
    _domainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verification Details',
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
                      percent: 0.95,
                      center: const Text(
                        '95%',
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
                'Last Step Verification',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Enrollment Number / Roll Number / College ID / UAN Number etc.',
                          style: TextStyle(fontSize: 11),
                        ),
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
                      border: Border.all(color: _idValid ? Colors.green : Colors.red),
                    ),
                    child: TextField(
                      controller: _idController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        errorText: _idValid ? null : 'This field cannot be empty',
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Row(
                    children: [
                      
                         Text(
                          'Interest Domain',
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
                      border: Border.all(color: _domainValid ? Colors.green : Colors.red),
                    ),
                    child: TextField(
                      controller: _domainController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(screenHeight * 0.015),
                        errorText: _domainValid ? null : 'This field cannot be empty',
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (_isAllFieldsValid()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const VerifiedPage()));
                          } else {
                            print('Please fill in all required fields.');
                            // Replace with your error handling logic here
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/new_releases (1).png'),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'Submit and Proceed Payment >',
                              style: TextStyle(
                                  fontSize: screenHeight * 0.015,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
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
    );
  }
}
