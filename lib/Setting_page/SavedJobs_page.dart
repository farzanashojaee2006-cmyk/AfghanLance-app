import 'package:flutter/material.dart';


class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Saved Jobs"),
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
              margin: const EdgeInsets.all(12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: Padding(
                padding: const EdgeInsets.all(14),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        const Text(
                          "Flutter Developer",

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        IconButton(

                          icon: const Icon(
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

                    const SizedBox(height: 10),

                    const Row(
                      children: [

                        Icon(Icons.business),

                        SizedBox(width: 8),

                        Text("Google"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      children: [

                        Icon(Icons.location_on,
                            color: Colors.red),

                        SizedBox(width: 8),

                        Text("Kabul, Afghanistan"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      children: [

                        Icon(Icons.attach_money,
                            color: Colors.green),

                        SizedBox(width: 8),

                        Text("\$1200 / month"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      children: [

                        Icon(Icons.work,
                            color: Colors.blue),

                        SizedBox(width: 8),

                        Text("Full Time"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      children: [

                        Icon(Icons.access_time,
                            color: Colors.orange),

                        SizedBox(width: 8),

                        Text("Posted 2 days ago"),
                      ],
                    ),

                    const SizedBox(height: 20),

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
                            const Text("Apply Now"),
                          ),
                        ),

                        const SizedBox(width: 10),

                        IconButton(

                          icon: const Icon(
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
