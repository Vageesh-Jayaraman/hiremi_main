import 'package:flutter/material.dart';

class AppliesScreen extends StatefulWidget {
  const AppliesScreen({Key? key}) : super(key: key);

  @override
  State<AppliesScreen> createState() => _AppliesScreenState();
}

class _AppliesScreenState extends State<AppliesScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Applies",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:  EdgeInsets.all(screenHeight*0.02),
            child:Image.asset('images/Empty-bro.png',height: screenHeight*0.4,),
            ),

          SizedBox(
            height: screenHeight * 0.002,
          ),
          const Text(
            'No Applies, Select from Hiremi’s Featured to',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          const Text(
            'start your journey today.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.all(screenWidth*0.02),
                child: TextButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.orange, width: 2),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 16, horizontal:20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('images/Group 170.png'),

                      SizedBox(width: screenWidth*0.02,),
                      const Text(
                        "Internships",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              Padding(
                padding:  EdgeInsets.all(screenWidth*0.02),
                child: TextButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.red, width: 2),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 16, horizontal:20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('images/Group 170 (1).png'),
                      SizedBox(width: screenWidth*0.02,),
                      const Text(
                        "Fresher Jobs",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),

              ),

              Padding(
                padding: EdgeInsets.all(screenWidth*0.02),
                child: TextButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Colors.purpleAccent, width: 2),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 16, horizontal:20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('images/Group 170 (2).png'),
                      SizedBox(width: screenWidth*0.02,),
                      const Text(
                        "Experienced Jobs",
                        style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),

              )


            ],
          ),
        ],
      ),
    );
  }
}

