
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import 'Account_page.dart';
import 'Appearance_page.dart';
import 'JobPrefirences_page.dart';
import 'MyResume_page.dart';
import 'Notification_age.dart';

import 'Privacy_age.dart';
import 'SavedJobs_page.dart';
import 'StorageAndDeta_page.dart';


class SettingsPage extends StatelessWidget{
  const SettingsPage ({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor:kFirstColor,
      appBar: AppBar(
        backgroundColor: Color(0XFF006D5F),

        title: Text("Setting",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),


        ),
      ),
      body: Column(
        children: [

          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 25, 16, 25),
            decoration: const BoxDecoration(
              color:kFirstColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [

                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage('assets/profile.jpg'),

                ),
                SizedBox(width: 14),


                Expanded(
                  child:Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                          "Zainab M",
                          style:TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis
                      ),
                      SizedBox(height: 15),
                      Container(
                        padding: EdgeInsets.symmetric (horizontal: 22, vertical: 11),
                        decoration: BoxDecoration(
                          color: Color(0XFF006D5F),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Text(
                          "Be forgiving , Be understand...",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("QR Icon Clicked"),
                            ),
                          );
                        },

                        icon: Icon(
                          Icons.qr_code_scanner,
                          color: Color(0XFF006D5F),
                          size: 35,
                        ),
                      ),
                      IconButton(
                        onPressed:() async{
                          final ImagePicker picker =
                          ImagePicker();

                          await picker.pickImage(
                            source:  ImageSource.gallery,
                          );
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Color(0XFF006D5F),
                          size: 40,
                        ),

                      ),
                    ]
                ),


              ],
            ),
          ),




          Expanded(

            child: Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kFirstColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8),
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.person_add,color: Color(0XFF006D5F),size: 28),
                    title: Text("Account",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AccountPage(),
                        ),
                      );
                    },
                  ),



                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.bar_chart,color: Color(0XFF006D5F),size: 28),
                    title: Text("privacy",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PrivacyPage(),
                      ),
                    );},

                  ),

                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.notifications,color: Color(0XFF006D5F),size: 28),
                    title: Text("Notification",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NotificationScreen(),
                      ),
                    );},

                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.check_circle,color: Color(0XFF006D5F),size: 28),
                    title: Text("My Resume",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyResumeScreen  (),
                      ),
                    );},

                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.location_on,color: Color(0XFF006D5F),size: 28),
                    title: Text("Job Preferences",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            JobPreferencesScreen(),
                      ),
                    );
                    },

                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.chat_bubble,color: Color(0XFF006D5F),size: 28),
                    title: Text("Saved Jobs",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context)=> const
                        SavedJobsPage(),
                      ),
                    );

                    },

                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.person,color: Color(0XFF006D5F),size: 28),
                    title: Text("Appearance",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AppearancePage(),
                      ),
                    );},

                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.language,color: Color(0XFF006D5F),size: 28),
                    title: Text("App Language",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AppearancePage(),
                      ),
                    );},

                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:Icon(Icons.settings,color: Color(0XFF006D5F),size: 28),
                    title: Text("Storage and Data",
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white)),
                    trailing: Icon(Icons.chevron_left, color: Colors.white,size: 26),
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StorageDataPage (),
                        ),
                      );
                    },

                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

}












