import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Edit_Profile_Section/ProfileSummary/ProfileSummary.dart';
import 'package:hiremi_version_two/Utils/colors.dart';


class ProfileSummary extends StatelessWidget {
  const ProfileSummary({Key? key, 
 required this.summary,
  }) : super(key: key);

  bool isValid (){
    return summary.isNotEmpty;
  }
  final String summary;
  @override
  Widget build(BuildContext context) {
    return  OutlinedContainer(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>   AddProfileSummary())),
      title: 'Profile Summary',
      isTrue: isValid(),
      child: Column(
        children: [
          Text(
              summary,
              style: const TextStyle(
                fontSize: 9.0,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              )),
        ],
      ),
    );
  }
}