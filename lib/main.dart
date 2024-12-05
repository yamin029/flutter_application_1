import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Activity List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const ActivityListPage(),
    );
  }
}

class ActivityListPage extends StatefulWidget {
  const ActivityListPage({super.key});

  @override
  State<ActivityListPage> createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {
  final List<Map<String, dynamic>> mainTasks = [
    {"task": "Ambient", "icon": Icons.wb_sunny, "completed": false},
    {"task": "Coffee", "icon": Icons.local_cafe, "completed": false},
    {"task": "Oven", "icon": Icons.kitchen, "completed": false},
    {"task": "Coolroom", "icon": Icons.ac_unit, "completed": false},
    {"task": "Toilet", "icon": Icons.cleaning_services, "completed": false},
  ];

  final List<Map<String, dynamic>> restockTasks = [
    {"task": "Coffee", "icon": Icons.coffee_maker, "completed": false},
    {"task": "Cups", "icon": Icons.local_drink, "completed": false},
    {"task": "Straws/Cutlery", "icon": Icons.restaurant, "completed": false},
    {"task": "Sugar", "icon": Icons.bakery_dining, "completed": false},
    {"task": "Napkins/Bags", "icon": Icons.shopping_bag, "completed": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Activity List'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saturday, 30-11-24',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    // Add date picker functionality here
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Main Tasks Section
            const Text(
              'Main Tasks',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: mainTasks.length,
                itemBuilder: (context, index) {
                  final task = mainTasks[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Icon(task['icon'], color: Colors.deepPurple),
                      title: Text(task['task']),
                      trailing: Checkbox(
                        value: task['completed'],
                        onChanged: (value) {
                          setState(() {
                            task['completed'] = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // Restock Tasks Section
            const SizedBox(height: 20),
            const Text(
              'Restock',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: restockTasks.length,
                itemBuilder: (context, index) {
                  final task = restockTasks[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: Icon(task['icon'], color: Colors.orange),
                      title: Text(task['task']),
                      trailing: Checkbox(
                        value: task['completed'],
                        onChanged: (value) {
                          setState(() {
                            task['completed'] = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add new tasks
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
