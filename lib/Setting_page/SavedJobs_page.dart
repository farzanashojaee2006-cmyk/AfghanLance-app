import 'package:flutter/material.dart';


class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Saved Jobs"),
      ),
      body: ListView(
        children: [

          InkWell(

            onTap: () {

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Job Opened"),
                ),
              );

            },

            child: Card(
              margin: EdgeInsets.all(12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: Padding(
                padding: EdgeInsets.all(14),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          "Flutter Developer",

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        IconButton(

                          icon: Icon(
                            Icons.bookmark,
                            color: Colors.teal,
                          ),

                          onPressed: () {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content:
                                Text("Job Saved"),
                              ),
                            );

                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [

                        Icon(Icons.business),

                        SizedBox(width: 8),

                        Text("Google"),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [

                        Icon(Icons.location_on,
                            color: Colors.red),

                        SizedBox(width: 8),

                        Text("Kabul, Afghanistan"),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [

                        Icon(Icons.attach_money,
                            color: Colors.green),

                        SizedBox(width: 8),

                        Text("\$1200 / month"),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [

                        Icon(Icons.work,
                            color: Colors.blue),

                        SizedBox(width: 8),

                        Text("Full Time"),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [

                        Icon(Icons.access_time,
                            color: Colors.orange),

                        SizedBox(width: 8),

                        Text("Posted 2 days ago"),
                      ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      children: [

                        Expanded(

                          child: ElevatedButton(

                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Application Sent"),
                                ),
                              );

                            },

                            child:
                            Text("Apply Now"),
                          ),
                        ),

                        SizedBox(width: 10),

                        IconButton(

                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),

                          onPressed: () {

                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Saved Job Removed"),
                              ),
                            );

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
