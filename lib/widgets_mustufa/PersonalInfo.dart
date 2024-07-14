import 'package:flutter/material.dart';
import 'package:hiremi_version_two/AddPersonalDetails.dart';
import 'package:hiremi_version_two/Custom_Widget/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';


class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  OutlinedContainer(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  const AddPersonalDetails())),
      title: 'Personal Details',
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalInfoChild(
            title: 'Gender',
            subtitle: 'Male',
          ),
          PersonalInfoChild(
            title: 'Marital Status',
            subtitle: 'Single / Unmarried',
          ),
          PersonalInfoChild(
            title: 'Date of Birth (DOB)',
            subtitle: '29-10-2002',
          ),
          PersonalInfoChild(
            title: 'Current Address',
            subtitle: 'Sheetal Mega City, Phase - 03, Mandideep, 462046',
          ),
          PersonalInfoChild(
            title: 'Permeant Address',
            subtitle: 'Sheetal Mega City, Phase - 03, Mandideep, 462046',
          ),
          PersonalInfoChild(
            title: 'Career Break',
            subtitle: 'No',
          ),
          PersonalInfoChild(
            title: 'Differently Abled',
            subtitle: 'No',
          ),
          PersonalInfoChild(
            title: 'Native Language',
            subtitle: 'Hindi',
          ),
        ],
      ),
    );
  }
}

class PersonalInfoChild extends StatelessWidget {
  const PersonalInfoChild({Key? key, 
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 9.0,fontWeight: FontWeight.w500,color: Colors.black),),
        SizedBox(
          height: Sizes.responsiveXs(context),
        ),
        Text(subtitle,
            style: TextStyle(fontSize: 9.0,fontWeight: FontWeight.w500,color: AppColors.secondaryText),),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Divider(
          height: 0.25,
          thickness: 0.25,
          color: AppColors.secondaryText,
        ),
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
      ],
    );
  }
}