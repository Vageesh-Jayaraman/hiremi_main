import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedContainer/roundedContainer.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/widgets_mustufa/AddProjects.dart';


class Projects extends StatelessWidget {
  const Projects({Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  const AddProjects())),
      title: 'Projects',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProjectsChild(
            title: 'Responsive Personal Portfolio Website',
            duration: 'Aug 2023 - Sept 2023',
            description:
                'I’m a fresher and looking for internships, I\'ve a skillset including Web Development from frontend work to backend work, Development from frontend work to backend work.',
            link: 'https://github.com/hyperdgx/Toggle-Dark-Light-Mode',
          ),
          SizedBox(
            height: Sizes.responsiveDefaultSpace(context),
          ),
          const ProjectsChild(
            title: 'Animated Personal Portfolio Website',
            duration: 'Aug 2023 - Sept 2023',
            description:
                'I’m a fresher and looking for internships, I\'ve a skillset including Web Development from frontend work to backend work, Development from frontend work to backend work.',
            link: 'https://github.com/hyperdgx/Toggle-Dark-Light-Mode',
          ),
        ],
      ),
    );
  }
}

class ProjectsChild extends StatelessWidget {
  const ProjectsChild({Key? key, 
    required this.title,
    required this.duration,
    required this.description,
    required this.link,
  }) : super(key: key);

  final String title, duration, description, link;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 9.0,fontWeight: FontWeight.w500,color: Colors.black),
        ),
        SizedBox(
          height: Sizes.responsiveXs(context),
        ),
        Text(
          duration,
          style:  TextStyle(fontSize: 6.0,fontWeight: FontWeight.w500,color: AppColors.secondaryText)
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 9.0,fontWeight: FontWeight.w500,color: Colors.black),
        ),
         SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        RoundedContainer(
          color: Colors.blue[100],
          radius: 2,
          padding: EdgeInsets.all(Sizes.responsiveXs(context)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.attach_file,
                color: Colors.blue,
                size: 8,
              ),
               SizedBox(
                width: Sizes.responsiveXxs(context),
              ),
              Text(
                link,
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Divider(
          height: 0.25,
          thickness: 0.25,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}
