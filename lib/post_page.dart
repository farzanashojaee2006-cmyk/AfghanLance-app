import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'package:afghanlance/services/firebase_notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CreatePostScreen extends StatefulWidget {

  const CreatePostScreen({super.key});


  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();

}



class _CreatePostScreenState extends State<CreatePostScreen> {


  final TextEditingController postController =
  TextEditingController();


  File? selectedFile;


  String postType = '';


  final ImagePicker picker = ImagePicker();



  Future<void> pickImage() async {

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );


    if (image != null) {

      setState(() {

        selectedFile = File(image.path);

        postType = 'image';

      });

    }

  }




  Future<void> pickVideo() async {

    final XFile? video = await picker.pickVideo(
      source: ImageSource.gallery,
    );


    if (video != null) {

      setState(() {

        selectedFile = File(video.path);

        postType = 'video';

      });

    }

  }




  Future<void> pickFile() async {

    FilePickerResult? result =
    await FilePicker.platform.pickFiles();


    if (result != null) {

      setState(() {

        selectedFile =
            File(result.files.single.path!);

        postType = 'file';

      });

    }

  }




  void showPickerOptions() {


    showModalBottomSheet(

      context: context,

      builder: (context) {


        return SafeArea(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [


              ListTile(

                leading: Icon(Icons.image,color:k4Color),

                title: Text(
                  "Pick Image",
                  style: TextStyle(color:k4Color),
                ),

                onTap: () {

                  Navigator.pop(context);

                  pickImage();

                },

              ),



              ListTile(

                leading: Icon(Icons.video_library,color:k4Color),

                title: Text(
                  "Pick Video",
                  style: TextStyle(color:k4Color),
                ),

                onTap: () {

                  Navigator.pop(context);

                  pickVideo();

                },

              ),



              ListTile(

                leading: Icon(Icons.insert_drive_file,color:k4Color),

                title: Text(
                  "Pick File",
                  style: TextStyle(color:k4Color),
                ),

                onTap: () {

                  Navigator.pop(context);

                  pickFile();

                },

              ),


            ],

          ),

        );

      },

    );


  }




  Future<void> uploadPost() async {


    if(postController.text.trim().isEmpty &&
        selectedFile == null){


    if (postController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Write something')),
      );
      return;
    }

    try {

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) return;

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();


      final data = userDoc.data();


      await FirebaseFirestore.instance.collection('posts').add({

        'caption': postController.text.trim(),

        'likes': 0,

        'likedBy': [],

        'type': 'text',

        'username':
        "${data?['firstName'] ?? ''} ${data?['lastName'] ?? ''}",

        'userId': user.uid,

        'createdAt': Timestamp.now(),

      });


      postController.clear();


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post uploaded successfully'),
        ),
      );


      return;

    }

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return;
    }


    await FirebaseFirestore.instance
        .collection('posts')
        .add({

      'userId': user.uid,

      'text': postController.text.trim(),

      'type': postType,

      'createdAt': Timestamp.now(),

    });
    print("UPLOAD FUNCTION STARTED");

    await FirebaseNotificationService.addNotification(

      "New Post",

      "A new project has been added",

    );
    print("CALLING FIREBASE NOTIFICATION");



    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
            "Post Uploaded Successfully"
        ),

      ),

    );


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: kFirstColor,


      appBar: AppBar(

        backgroundColor: k4Color,

        elevation: 0,

        centerTitle: true,


        title: const Text(
          "Create a Post",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),


        actions: [

          ElevatedButton(

            style: ElevatedButton.styleFrom(

              backgroundColor: kFirstColor,

              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(15),

              ),

            ),


            onPressed: () {

              print("POST BUTTON CLICKED");

              uploadPost();

            },

            child: Text(

              "Post",

              style: TextStyle(

                fontSize: 18,

                color: k4Color,

              ),

            ),

          ),

        ],


        leading: IconButton(

          icon: const Icon(

            Icons.arrow_back,

            color: Colors.white,

          ),

          onPressed: () {

            Navigator.pop(context);

          },

        ),

      ),



      floatingActionButton: FloatingActionButton(

        backgroundColor: k4Color,


        onPressed: showPickerOptions,


        child: const Icon(

          Icons.add,

          color: Colors.white,

        ),

      ),




      body: Padding(

        padding: const EdgeInsets.all(20),


        child: Column(

          children: [


            Container(

              padding: const EdgeInsets.all(12),


              height: 250,


              width: double.infinity,


              decoration: BoxDecoration(

                color: Colors.grey.shade100,

                borderRadius: BorderRadius.circular(15),

                border: Border.all(

                  color: Colors.grey.shade400,

                ),

              ),



              child: TextField(


                controller: postController,


                maxLines: null,


                expands: true,


                decoration: const InputDecoration(

                  hintText: "Share your thoughts...",


                  border: InputBorder.none,


                ),


              ),


            ),



            const SizedBox(height: 20),




            if(selectedFile != null)


              Container(

                height: 200,


                width: double.infinity,


                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15),

                ),



                child: postType == "image"


                    ? ClipRRect(

                  borderRadius:
                  BorderRadius.circular(15),


                  child: Image.file(

                    selectedFile!,

                    fit: BoxFit.cover,

                  ),

                )

                    : Center(

                  child: Text(

                    selectedFile!.path
                        .split("/")
                        .last,

                  ),

                ),

              ),


          ],


        ),


      ),


    );

  }


}