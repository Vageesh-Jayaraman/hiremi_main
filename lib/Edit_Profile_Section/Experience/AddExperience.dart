import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import '../widgets/CustomTextField.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({Key? key}) : super(key: key);

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  String experience = '';
  String environment = '';
  final organizationController = TextEditingController();
  final jobTitleController = TextEditingController();
  final skillSetController = TextEditingController();
  final joiningDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: Sizes.responsiveXl(context),
          right: Sizes.responsiveDefaultSpace(context),
          bottom: kToolbarHeight,
          left: Sizes.responsiveDefaultSpace(context),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Experience',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: Sizes.responsiveMd(context),
          ),
          Row(
            children: [
              const Text(
                'Do you have work experience?',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                '*',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'Yes',
                    groupValue: experience,
                    onChanged: (value) => setState(() {
                      experience = value!;
                    }),
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: experience == 'Yes'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'No',
                    groupValue: experience,
                    onChanged: (value) {
                      setState(() {
                        experience = value!;
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: experience == 'No'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What type of work environment do you prefer?',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                '*',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'Full-time',
                    groupValue: environment,
                    onChanged: (value) => setState(() {
                      environment = value!;
                    }),
                  ),
                  Text(
                    'Full-time',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: environment == 'Full-time'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'Remote',
                    groupValue: environment,
                    onChanged: (value) {
                      setState(() {
                        environment = value!;
                      });
                    },
                  ),
                  Text(
                    'Remote',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: environment == 'Remote'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const Text(
                        'Organization Name',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: Sizes.responsiveSm(context),
                    ),
                    CustomTextField(
                      controller: organizationController,
                      hintText: 'eg: Google',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Sizes.responsiveMd(context),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const Text(
                        'Job Title',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: Sizes.responsiveSm(context),
                    ),
                    CustomTextField(
                      controller: jobTitleController,
                      hintText: 'eg: Software Developer',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Sizes.responsiveMd(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Text(
                  'SkillSet Used(Optional)',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ]),
              SizedBox(
                height: Sizes.responsiveSm(context),
              ),
              CustomTextField(
                controller: skillSetController,
                hintText: 'eg: Java, Python etc.',
              ),
            ],
          ),
          SizedBox(height: Sizes.responsiveMd(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Text(
                  'Joining Date',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ]),
              SizedBox(
                height: Sizes.responsiveSm(context),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.radiusXs),
                  border: Border.all(width: 0.37, color: AppColors.black),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.calendar_month_sharp,
                        size: 14,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1.0,
                      width: 0.37,
                      color: AppColors.black,
                    ),
                    Expanded(
                      child: TextField(
                        controller: joiningDateController,
                        cursorColor: AppColors.black,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        expands: false,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: 'DD/MM/YYYY',
                          suffixIconColor: AppColors.secondaryText,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: Sizes.responsiveSm(context),
                            horizontal: Sizes.responsiveMd(context),
                          ),
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryText,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
