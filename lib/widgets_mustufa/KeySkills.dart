import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedContainer/roundedContainer.dart';
import 'package:hiremi_version_two/Edit_Profile_Section/Key%20Skills/AddKeySkills.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';


class KeySkills extends StatelessWidget {
  const KeySkills({Key? key, 
    required this.skills,
  }) : super(key: key);

  final List<String> skills;

  bool isValid (){
    return skills.isNotEmpty;
  }
  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      title: 'Key Skills',
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddKeySkills())),
      isTrue: isValid(),
      child: Wrap(
          runSpacing: 10,
          spacing: Sizes.responsiveSm(context),
          children: skills.map((skill) => RoundedContainer(
                radius: 16,
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.responsiveHorizontalSpace(context),
                  vertical: Sizes.responsiveVerticalSpace(context),
                ),
                border: Border.all(width: 0.5, color: AppColors.primary),
                child: Text(
                  skill,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
              )
          ).toList()
      ),
    );
  }
}
