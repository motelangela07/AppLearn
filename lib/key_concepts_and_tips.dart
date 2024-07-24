import 'package:flutter/material.dart';

class KeyConceptAndTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key Concepts and Tips'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 96, 171, 233), // Blue color
              Color.fromARGB(255, 233, 132, 166), // Pink color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(height: 16),
              Text(
                'Key Concepts of Time Management:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              buildExpansionTile(
                title: 'Prioritization',
                description:
                    'Determine the most important tasks and focus on those first.',
                icon: Icons.priority_high,
                iconColor: Colors.red,
              ),
              buildExpansionTile(
                title: 'Planning',
                description:
                    'Create a daily, weekly, or monthly schedule to allocate time effectively.',
                icon: Icons.schedule,
                iconColor: Colors.blue,
              ),
              buildExpansionTile(
                title: 'Goal Setting',
                description: 'Define clear, specific, and achievable goals.',
                icon: Icons.flag,
                iconColor: Colors.green,
              ),
              buildExpansionTile(
                title: 'Delegation',
                description:
                    'Assign tasks to others when possible to free up your time.',
                icon: Icons.group,
                iconColor: Colors.orange,
              ),
              buildExpansionTile(
                title: 'Avoiding Procrastination',
                description:
                    'Take action on tasks promptly to avoid last-minute stress.',
                icon: Icons.timer_off,
                iconColor: Colors.purple,
              ),
              buildExpansionTile(
                title: 'Time Blocking',
                description:
                    'Dedicate specific blocks of time to particular tasks or activities.',
                icon: Icons.access_time,
                iconColor: Colors.teal,
              ),
              buildExpansionTile(
                title: 'Limiting Distractions',
                description: 'Identify and minimize sources of distraction.',
                icon: Icons.do_not_disturb_alt,
                iconColor: Colors.yellow,
              ),
              buildExpansionTile(
                title: 'Using Tools',
                description:
                    'Employ tools like calendars, to-do lists, and time-tracking apps to manage time effectively.',
                icon: Icons.apps,
                iconColor: Colors.cyan,
              ),
              SizedBox(height: 16),
              Text(
                'Tips for Better Time Management:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              buildExpansionTile(
                title: 'Start with the most important task (MIT)',
                description:
                    'Tackle your MIT first thing in the morning to set a productive tone for the day.',
                icon: Icons.work,
                iconColor: Colors.brown,
              ),
              buildExpansionTile(
                title: 'Set clear deadlines',
                description:
                    'Deadlines create a sense of urgency and help you stay focused.',
                icon: Icons.calendar_today,
                iconColor: Colors.deepOrange,
              ),
              buildExpansionTile(
                title: 'Break tasks into smaller steps',
                description:
                    'Smaller tasks are less overwhelming and more manageable.',
                icon: Icons.format_list_numbered,
                iconColor: Colors.lime,
              ),
              buildExpansionTile(
                title: 'Learn to say no',
                description:
                    'Protect your time by declining non-essential tasks or commitments.',
                icon: Icons.block,
                iconColor: Colors.redAccent,
              ),
              buildExpansionTile(
                title: 'Regularly review your schedule',
                description:
                    'Reflect on what’s working and adjust your plan as needed.',
                icon: Icons.refresh,
                iconColor: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpansionTile({
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        color: Colors.white, // White background color
        child: ExpansionTile(
          leading: Icon(icon, color: iconColor), // Colored icon for emphasis
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black, // Black text for contrast
              fontWeight: FontWeight.bold, // Bold text for emphasis
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description, style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: KeyConceptAndTips(),
  ));
}
