import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen ({super.key});

  @override
  State<NotificationScreen> createState()
  =>
      _NotificationScreenState();
}
class _NotificationScreenState
    extends State<NotificationScreen> {


  bool newJobs = true;
  bool applicationStatus = true;
  bool messages = true;
  bool interviewInvites = true;
  bool savedJobsAlerts = false;
  bool profileViews = true;
  bool jobRecommendations = false;
  bool accountUpdates = true;
  bool marketingEmails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),

      body: ListView(
        children: [

          SwitchListTile(
            secondary: const Icon(Icons.work),
            title: const Text("New Job Alerts"),
            value: newJobs,
            onChanged: (value) {
              setState(() {
                newJobs = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.description),
            title: const Text("Application Status"),
            value: applicationStatus,
            onChanged: (value) {
              setState(() {
                applicationStatus = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.message),
            title: const Text("Messages"),

            value: messages,
            onChanged: (value) {
              setState(() {
                messages = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.video_call),
            title: const Text("Interview Invites"),
            value: interviewInvites,
            onChanged: (value) {
              setState(() {
                interviewInvites = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.bookmark),
            title: const Text("Saved Jobs Alerts"),
            value: savedJobsAlerts,
            onChanged: (value) {
              setState(() {
                savedJobsAlerts = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.remove_red_eye),
            title: const Text("Profile Views"),
            value: profileViews,
            onChanged: (value) {
              setState(() {
                profileViews = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.recommend),
            title: const Text("Job Recommendations"),
            value: jobRecommendations,
            onChanged: (value) {
              setState(() {
                jobRecommendations = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.security),
            title: const Text("Account Updates"),
            value: accountUpdates,
            onChanged: (value) {
              setState(() {
                accountUpdates = value;
              });
            },
          ),

          SwitchListTile(
            secondary: const Icon(Icons.email),
            title: const Text("Marketing Emails"),
            value: marketingEmails,
            onChanged: (value) {
              setState(() {
                marketingEmails = value;
              });
            },
          ),

        ],
      ),
    );
  }
}
