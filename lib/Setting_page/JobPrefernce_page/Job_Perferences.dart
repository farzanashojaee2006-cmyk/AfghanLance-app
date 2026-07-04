import 'package:flutter/material.dart';




import '../MyResume/Languages.dart';
import 'Expected_Salary.dart';
import 'Job_Alert.dart';
import 'Perferred_job_title.dart';
import 'Preferred_Company_Size.dart';
import 'Preferred_Industry.dart';
import 'Preferred_Location.dart';
import 'Relocation_Preference.dart';
import 'Work_Schedule.dart';
import 'job_Category.dart';

class JobPreferencesScreen extends StatefulWidget {
  const JobPreferencesScreen({super.key});

  @override
  State<JobPreferencesScreen> createState() =>
      _JobPreferencesScreenState();
}

class _JobPreferencesScreenState extends State<JobPreferencesScreen> {
  bool remoteWork = true;
  bool freelance = false;

  String employmentType = "Full Time";
  String experienceLevel = "Mid Level";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Job Preferences"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            preferenceTile(
                context: context,
                icon: Icons.badge_outlined,
                color: Colors.blue,
                title: "Preferred Job Title",
                subtitle: "Flutter Developer",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    PreferencesJobScreen(),
                    ),
                  );
                }
            ),

            preferenceTile(
                context: context,
                icon: Icons.category_outlined,
                color: Colors.orange,
                title: "Job Category",
                subtitle: "Software Development",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    JobCategoryScreen(),
                    ),
                  );
                }
            ),

            preferenceTile(
                context: context,
                icon: Icons.location_on_outlined,
                color: Colors.red,
                title: "Preferred Location",
                subtitle: "Kabul, Afghanistan",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    PreferredLocationScreen(),
                    ),
                  );
                }
            ),

            switchTile(
              context: context,
              icon: Icons.home_work_outlined,
              color: Colors.green,
              title: "Remote Work",
              value: remoteWork,
              onChanged: (value) {
                setState(() {
                  remoteWork = value;
                });
              },
            ),

            dropdownTile(
              context: context,
              icon: Icons.work_outline,
              color: Colors.purple,
              title: "Employment Type",
              value: employmentType,
              items: const [
                "Full Time",
                "Part Time",
                "Internship",
                "Contract",
              ],
              onChanged: (value) {
                setState(() {
                  employmentType = value!;
                });
              },
            ),

            preferenceTile(
                context: context,
                icon: Icons.payments_outlined,
                color: Colors.teal,
                title: "Expected Salary",
                subtitle: "\$500 - \$1000",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    ExpectedSalaryScreen(),
                    ),
                  );
                }
            ),

            dropdownTile(
              context: context,
              icon: Icons.trending_up_outlined,
              color: Colors.indigo,
              title: "Experience Level",
              value: experienceLevel,
              items: const [
                "Junior",
                "Mid Level",
                "Senior",
              ],
              onChanged: (value) {
                setState(() {
                  experienceLevel = value!;
                });
              },
            ),

            preferenceTile(
                context: context,
                icon: Icons.business_center_outlined,
                color: Colors.deepPurple,
                title: "Preferred Industry",
                subtitle: "Technology",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    PreferredIndustryPage(),
                    ),
                  );
                }
            ),

            preferenceTile(
                context: context,
                icon: Icons.schedule_outlined,
                color: Colors.cyan,
                title: "Work Schedule",
                subtitle: "Morning Shift",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    WorkSchedulePage(),
                    ),
                  );
                }

            ),

            preferenceTile(
                context: context,
                icon: Icons.flight_takeoff_outlined,
                color: Colors.pink,
                title: "Relocation Preference",
                subtitle: "Open to relocate",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    RelocationPage(),
                    ),
                  );
                }
            ),
            preferenceTile(
                context: context,
                icon: Icons.notifications_active_outlined,
                color: Colors.amber,
                title: "Job Alert Frequency",
                subtitle: "Daily Alerts",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const
                    JobAlertPage(),
                    ),
                  );
                }
            ),

            preferenceTile(
                context: context,
                icon: Icons.apartment_outlined,
                color: Colors.brown,
                title: "Preferred Company Size",
                subtitle: "Startup & Medium Company",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => const
                    PreferredCompanySizeScreen(),
                    ),
                  );
                }
            ),

            preferenceTile(
                context: context,
                icon: Icons.language_outlined,
                color: Colors.blueGrey,
                title: "Languages for Work",
                subtitle: "English, Dari",
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>const
                    LanguagesScreen(),
                    ),
                  );
                }
            ),

            switchTile(
              context: context,
              icon: Icons.laptop_mac_outlined,
              color: Colors.green,
              title: "Open to Freelance",
              value: freelance,
              onChanged: (value) {
                setState(() {
                  freelance = value;
                });
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget preferenceTile({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget switchTile({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: color),
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget dropdownTile({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      trailing: DropdownButton<String>(
        value: value,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}