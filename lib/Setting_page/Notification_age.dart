
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
        title: Text("Notification"),
      ),

      body: ListView(
        children: [

          SwitchListTile(
            secondary: Icon(Icons.work),
            title: Text("New Job Alerts"),
            value: newJobs,
            onChanged: (value) {
              setState(() {
                newJobs = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.description),
            title: Text("Application Status"),
            value: applicationStatus,
            onChanged: (value) {
              setState(() {
                applicationStatus = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.message),
            title: Text("Messages"),

            value: messages,
            onChanged: (value) {
              setState(() {
                messages = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.video_call),
            title: Text("Interview Invites"),
            value: interviewInvites,
            onChanged: (value) {
              setState(() {
                interviewInvites = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.bookmark),
            title: Text("Saved Jobs Alerts"),
            value: savedJobsAlerts,
            onChanged: (value) {
              setState(() {
                savedJobsAlerts = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.remove_red_eye),
            title: Text("Profile Views"),
            value: profileViews,
            onChanged: (value) {
              setState(() {
                profileViews = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.recommend),
            title: Text("Job Recommendations"),
            value: jobRecommendations,
            onChanged: (value) {
              setState(() {
                jobRecommendations = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.security),
            title: Text("Account Updates"),
            value: accountUpdates,
            onChanged: (value) {
              setState(() {
                accountUpdates = value;
              });
            },
          ),

          SwitchListTile(
            secondary: Icon(Icons.email),
            title: Text("Marketing Emails"),
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
