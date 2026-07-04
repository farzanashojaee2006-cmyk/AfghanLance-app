

import 'package:flutter/material.dart';

import '../JobPrefernce_page/Languages_for_work.dart';
import 'Certification.dart';
import 'Education.dart';
import 'Portfolio.dart';
import 'Resume_Analytics.dart';
import 'Resume_Preview.dart';
import 'Resume_Visibility.dart';
import 'Skills.dart';
import 'Upload_Resume.dart';
import 'Work_Experience.dart';

class MyResumeScreen extends StatelessWidget {
  const MyResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,

        title: Text(
          "My Resume",
          style: TextStyle(
            color: theme.textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            resumeTile(
                context: context,
                icon: Icons.description_outlined,
                color: Colors.blue,
                title: "Resume Preview",
                subtitle: "Preview your professional resume",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(_)=>
                        ResumePreviewScreen(),
                    ),
                  );
                }


            ),

            resumeTile(
                context: context,
                icon: Icons.upload_file_outlined,
                color: Colors.orange,
                title: "Upload Resume",
                subtitle: "Upload PDF or DOC files",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    UploadResumeScreen(),
                    ),
                  );
                }
            ),
            resumeTile(
                context: context,
                icon: Icons.work_history_outlined,
                color: Colors.green,
                title: "Work Experience",
                subtitle: "Add your job experience",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    WorkExperienceScreen(),
                    ),
                  );
                }
            ),

            resumeTile(
                context: context,
                icon: Icons.school_outlined,
                color: Colors.purple,
                title: "Education",
                subtitle: "Add education details",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    EducationScreen(),
                    ),
                  );
                }
            ),

            resumeTile(
                context: context,
                icon: Icons.psychology_outlined,
                color: Colors.teal,
                title: "Skills",
                subtitle: "Manage your skills",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    SkillsScreen(),
                    ),
                  );
                }
            ),

            resumeTile(
                context: context,
                icon: Icons.workspace_premium_outlined,
                color: Colors.redAccent,
                title: "Certification",
                subtitle: "Certificates and achievements",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    CertificationScreen(),
                    ),
                  );
                }
            ),

            resumeTile(
                context: context,
                icon: Icons.language_outlined,
                color: Colors.indigo,
                title: "Languages",
                subtitle: "Languages you can speak",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    LanguagesScreen(),
                    ),
                  );
                }
            ),

            resumeTile(
                context: context,
                icon: Icons.folder_open_outlined,
                color: Colors.deepPurple,
                title: "Portfolio / Projects",
                subtitle: "Show your projects",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    PortfolioScreen(),
                    ),
                  );
                }
            ),

            resumeTile(
                context: context,
                icon: Icons.visibility_outlined,
                color: Colors.cyan,
                title: "Resume Visibility",
                subtitle: "Control resume visibility",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    ResumeVisibilityScreen(),
                    ),
                  );
                }
            ),

            resumeTile(
                context: context,
                icon: Icons.analytics_outlined,
                color: Colors.pink,
                title: "Resume Analytics",
                subtitle: "Track resume performance",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    ResumeAnalyticsScreen(),
                    ),
                  );
                }
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget resumeTile({
    required BuildContext context,
    required IconData icon,
    required  Color color,
    required String title,
    required String subtitle,
    VoidCallback? onTap,

  }) {
    return ListTile(
      leading: Icon(icon,color: color),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const
      Icon(Icons.arrow_forward_ios),
      onTap: onTap,


    );
  }
}
