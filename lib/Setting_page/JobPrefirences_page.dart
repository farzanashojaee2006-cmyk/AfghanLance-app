import 'package:flutter/material.dart';

class JobPreferencesScreen extends StatefulWidget {
  const JobPreferencesScreen({super.key});

  @override
  State<JobPreferencesScreen> createState() =>
      _JobPreferencesScreenState();
}

class _JobPreferencesScreenState
    extends State<JobPreferencesScreen> {

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
        elevation: 0,
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,

        title: Text(
          "Job Preferences",
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

            preferenceTile(
              context: context,
              icon: Icons.badge_outlined,
              color: Colors.blue,
              title: "Preferred Job Title",
              subtitle: "Flutter Developer",
            ),

            preferenceTile(
              context: context,
              icon: Icons.category_outlined,
              color: Colors.orange,
              title: "Job Category",
              subtitle: "Software Development",
            ),

            preferenceTile(
              context: context,
              icon: Icons.location_on_outlined,
              color: Colors.redAccent,
              title: "Preferred Location",
              subtitle: "Kabul, Afghanistan",
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
            ),

            preferenceTile(
              context: context,
              icon: Icons.schedule_outlined,
              color: Colors.cyan,
              title: "Work Schedule",
              subtitle: "Morning Shift",
            ),
            preferenceTile(
              context: context,
              icon: Icons.flight_takeoff_outlined,
              color: Colors.pink,
              title: "Relocation Preference",
              subtitle: "Open to relocate",
            ),

            preferenceTile(
              context: context,
              icon: Icons.notifications_active_outlined,
              color: Colors.amber,
              title: "Job Alert Frequency",
              subtitle: "Daily Alerts",
            ),

            preferenceTile(
              context: context,
              icon: Icons.apartment_outlined,
              color: Colors.brown,
              title: "Preferred Company Size",
              subtitle: "Startup & Medium Company",
            ),

            preferenceTile(
              context: context,
              icon: Icons.language_outlined,
              color: Colors.blueGrey,
              title: "Languages for Work",
              subtitle: "English, Dari",
            ),

            switchTile(
              context: context,
              icon: Icons.laptop_mac_outlined,
              color: Colors.greenAccent,
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

  Widget switchTile({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required bool value,
    required Function(bool) onChanged,
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
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),

          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
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

    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 6,
      ),

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
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),

          DropdownButton<String>(
            value: value,
            underline: const SizedBox(),

            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),

            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

