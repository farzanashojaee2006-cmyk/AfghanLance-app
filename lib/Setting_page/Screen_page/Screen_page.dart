import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Account_page/Account.dart';
import '../Appearance_page/Appearance.dart';
import '../JobPrefernce_page/Job_Perferences.dart';
import '../MyResume/MyResume.dart';
import '../Notification_page/Notification_page.dart';
import '../Praivacy_page/Praivacy.dart';
import '../SavedJobs/Saved job _page.dart';
import '../Storage_and_Data/Storage_&_Data.dart';



class SettingsPage extends StatelessWidget{
  const SettingsPage ({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Color(0XFF9ED9D2),
      appBar: AppBar(
        backgroundColor: Color(0XFF006D5F),

        title: const Text("Setting",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),


        ),
      ),
      body: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
            decoration: const BoxDecoration(
              color: Color(0XFF9ED9D2),
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
                const SizedBox(width: 14),


                Expanded(
                  child:Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                          "Zainab M",
                          style:const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric (horizontal: 22, vertical: 11),
                        decoration: BoxDecoration(
                          color: const Color(0XFF006D5F),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: const Text(
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

                        icon: const Icon(
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
                        icon: const Icon(
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
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0XFF9ED9D2),
                borderRadius: BorderRadius.circular(28),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.person_add,color: Color(0XFF006D5F),size: 28),
                    title: const Text("Account",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.bar_chart,color: Color(0XFF006D5F),size: 28),
                    title: const Text("privacy",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.notifications,color: Color(0XFF006D5F),size: 28),
                    title: const Text("Notification",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.check_circle,color: Color(0XFF006D5F),size: 28),
                    title: const Text("My Resume",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.location_on,color: Color(0XFF006D5F),size: 28),
                    title: const Text("Job Preferences",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.chat_bubble,color: Color(0XFF006D5F),size: 28),
                    title: const Text("Saved Jobs",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.person,color: Color(0XFF006D5F),size: 28),
                    title: const Text("Appearance",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.language,color: Color(0XFF006D5F),size: 28),
                    title: const Text("App Language",
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
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                    leading:const Icon(Icons.settings,color: Color(0XFF006D5F),size: 28),
                    title: const Text("Storage and Data",
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
















