import 'package:flutter/material.dart';
import 'package:hiremi_version_two/AddPersonalDetails.dart';
import 'package:hiremi_version_two/Profile_Screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/widgets_mustufa/TextFieldWithTitle.dart';


class AddProjects extends StatefulWidget {
  const AddProjects({Key? key, }) : super(key: key);

  @override
  State<AddProjects> createState() => _AddProjectsState();
}

class _AddProjectsState extends State<AddProjects> {
  TextEditingController titleController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController projectLinkController = TextEditingController();
  TextEditingController startingDateController = TextEditingController();
  TextEditingController completionDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String projectStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: Sizes.responsiveXl(context),
              right: Sizes.responsiveDefaultSpace(context),
              bottom: kToolbarHeight,
              left: Sizes.responsiveDefaultSpace(context)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Projects',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Row(
              children: [
                Expanded(
                    child: TextFieldWithTitle(
                        controller: titleController,
                        title: 'Project Title',
                        hintText: 'eg: Project Title')),
                SizedBox(
                  width: Sizes.responsiveMd(context),
                ),
                Expanded(
                    child: TextFieldWithTitle(
                        controller: clientController,
                        title: 'Client',
                        hintText: 'eg: Organisation or Client etc.')),
              ],
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            TextFieldWithTitle(
                controller: projectLinkController,
                title: 'Add Project Link',
                hintText: 'eg: paste project link here.'),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            TextFieldWithTitle(
                title: 'Starting Date',
                hintText: 'DD/MM/YYYY',
                spaceBtwTextField: Sizes.responsiveMd(context),
                controller: startingDateController,
                prefix: Icon(
                  Icons.calendar_month_sharp,
                  size: 16,
                  color: AppColors.secondaryText,
                )),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Project Status',
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
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Completed',
                          groupValue: projectStatus,
                          onChanged: (value) => setState(() {
                            projectStatus = value as String;
                          }),
                        ),
                        Text(
                          'Completed',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: projectStatus == 'Completed'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Ongoing',
                          groupValue: projectStatus,
                          onChanged: (value) {
                            setState(() {
                              projectStatus = value as String;
                            });
                          },
                        ),
                        Text(
                          'Ongoing',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: projectStatus == 'Ongoing'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            TextFieldWithTitle(
                title: 'Completion Date, if “Completed” selected above.',
                starNeeded: false,
                hintText: 'DD/MM/YYYY',
                controller: completionDateController,
                spaceBtwTextField: Sizes.responsiveMd(context),
                prefix: Icon(
                  Icons.calendar_month_sharp,
                  size: 16,
                  color: AppColors.secondaryText,
                )),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            TextFieldWithTitle(
                title: 'Project Description',
                hintText: 'Tell us about your project...',
                controller: descriptionController,
                spaceBtwTextField: Sizes.responsiveMd(context),
                maxLines: 3,
            ),
            SizedBox(
              height: Sizes.responsiveMd(context)*2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.radiusSm)),
                      padding: EdgeInsets.symmetric(
                          vertical: Sizes.responsiveHorizontalSpace(context),
                          horizontal: Sizes.responsiveMdSm(context)),
                    ),
                    onPressed: () {
                      if (titleController.text.isNotEmpty && clientController.text.isNotEmpty && projectLinkController.text.isNotEmpty && startingDateController.text.isNotEmpty && projectStatus.isNotEmpty && completionDateController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>  ProfileScreen()));
                      }
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side:   BorderSide(color: AppColors.primary,width: 0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.radiusSm)),
                      padding: EdgeInsets.symmetric(
                          vertical: Sizes.responsiveSm(context),
                          horizontal: Sizes.responsiveMdSm(context)),
                    ),
                    onPressed: () {
                      if (titleController.text.isNotEmpty && clientController.text.isNotEmpty && projectLinkController.text.isNotEmpty && startingDateController.text.isNotEmpty && projectStatus.isNotEmpty && completionDateController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>  const AddPersonalDetails()));
                      }
                    },
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Save & Next',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(
                          width: Sizes.responsiveXs(context),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 11,
                          color: AppColors.primary,
                        )
                      ],
                    )),
              ],
            )

          ]),
        ),
      ),
    );
  }
}

