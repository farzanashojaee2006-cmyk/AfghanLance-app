

import 'package:flutter/material.dart';

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
),

resumeTile(
context: context,
icon: Icons.upload_file_outlined,
color: Colors.orange,
title: "Upload Resume",
subtitle: "Upload PDF or DOC files",
),

resumeTile(
context: context,
icon: Icons.work_history_outlined,
color: Colors.green,
title: "Work Experience",
subtitle: "Add your job experience",
),

resumeTile(
context: context,
icon: Icons.school_outlined,
color: Colors.purple,
title: "Education",
subtitle: "Add education details",
),

resumeTile(
context: context,
icon: Icons.psychology_outlined,
color: Colors.teal,
title: "Skills",
subtitle: "Manage your skills",
),

resumeTile(
context: context,
icon: Icons.workspace_premium_outlined,
color: Colors.redAccent,
title: "Certification",
subtitle: "Certificates and achievements",
),

resumeTile(
context: context,
icon: Icons.language_outlined,
color: Colors.indigo,
title: "Languages",
subtitle: "Languages you can speak",
),

resumeTile(
context: context,
icon: Icons.folder_open_outlined,
color: Colors.deepPurple,
title: "Portfolio / Projects",
subtitle: "Show your projects",
),

resumeTile(
context: context,
icon: Icons.visibility_outlined,
color: Colors.cyan,
title: "Resume Visibility",
subtitle: "Control resume visibility",
),

resumeTile(
context: context,
icon: Icons.analytics_outlined,
color: Colors.pink,
title: "Resume Analytics",
subtitle: "Track resume performance",
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
  required Color color,
  required String title,
  required String subtitle,
}) {

  final theme = Theme.of(context);

  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(14),

    decoration: BoxDecoration(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(18),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),

    child: Row(
      children: [

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
          ),

          child: Icon(
            icon,
            color: color,
            size: 26,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
        ),

        Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: theme.iconTheme.color,
        ),
      ],
    ),
  );
}
}

