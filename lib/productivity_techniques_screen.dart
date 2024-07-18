import 'package:flutter/material.dart';

class ProductivityTechniquesScreen extends StatelessWidget {
  final List<TechniqueData> techniques = [
    TechniqueData(
      title: 'Eisenhower Matrix',
      description:
          'Prioritize tasks by urgency and importance, dividing them into four quadrants: Do (urgent and important), Schedule (important but not urgent), Delegate (urgent but not important), and Eliminate (neither urgent nor important).',
      idealFor:
          'Individuals who struggle with prioritizing tasks and need a clear framework to determine what to focus on first.',
      icon: Icons.grid_on,
      color: Colors.redAccent,
    ),
    TechniqueData(
      title: 'Time Blocking',
      description:
          'Allocate specific blocks of time for different tasks or activities throughout your day, ensuring dedicated focus periods.',
      idealFor:
          'People with busy schedules who need to ensure they allocate time for all important activities and minimize distractions.',
      icon: Icons.schedule,
      color: Colors.blueAccent,
    ),
    TechniqueData(
      title: 'Getting Things Done (GTD)',
      description:
          'Capture tasks, clarify what needs to be done, organize tasks into categories, reflect on tasks regularly, and engage with them in a structured manner.',
      idealFor:
          'Professionals managing multiple projects and tasks, requiring a comprehensive system to stay organized.',
      icon: Icons.done_all,
      color: Colors.green,
    ),
    TechniqueData(
      title: 'ABC Method',
      description:
          'Prioritize tasks by labeling them as A (most important), B (important), and C (least important), focusing on completing A tasks first.',
      idealFor:
          'Those who need a simple and straightforward method to quickly prioritize their tasks.',
      icon: Icons.label,
      color: Colors.orange,
    ),
    TechniqueData(
      title: 'Eat That Frog',
      description:
          'Identify and tackle the most challenging and important task first thing in the morning to set a productive tone for the day.',
      idealFor:
          'Individuals who tend to procrastinate on big or difficult tasks and need a strategy to overcome this habit.',
      icon: Icons.fastfood,
      color: Colors.purple,
    ),
    TechniqueData(
      title: 'Pareto Principle (80/20 Rule)',
      description:
          'Focus on the 20% of tasks that will generate 80% of the results, maximizing productivity by prioritizing high-impact activities.',
      idealFor:
          'People looking to maximize efficiency and impact, especially entrepreneurs and business leaders.',
      icon: Icons.bar_chart,
      color: Colors.teal,
    ),
    TechniqueData(
      title: 'Time Tracking',
      description:
          'Use tools or logs to monitor how you spend your time, identifying patterns and areas for improvement.',
      idealFor:
          'Anyone wanting to understand and improve their time management habits, particularly useful for freelancers and remote workers.',
      icon: Icons.timer,
      color: Colors.blue,
    ),
    TechniqueData(
      title: 'Batch Processing',
      description:
          'Group similar tasks together and complete them in a single session to reduce context switching and increase efficiency.',
      idealFor:
          'Those who handle repetitive tasks, such as administrative work or content creation, looking to improve efficiency.',
      icon: Icons.layers,
      color: Colors.cyan,
    ),
    TechniqueData(
      title: 'Two-Minute Rule',
      description:
          'If a task can be done in two minutes or less, do it immediately to prevent small tasks from accumulating.',
      idealFor:
          'Individuals overwhelmed by minor tasks or who often face decision fatigue regarding what to tackle next.',
      icon: Icons.timer_off,
      color: Colors.pink,
    ),
    TechniqueData(
      title: 'Kanban Board',
      description:
          'Visualize tasks on a board divided into columns representing different stages of progress (e.g., To Do, In Progress, Done).',
      idealFor:
          'Teams and individuals who prefer visual organization of tasks, common in project management and software development.',
      icon: Icons.view_column,
      color: Colors.brown,
    ),
    TechniqueData(
      title: 'SMART Goals',
      description:
          'Set Specific, Measurable, Achievable, Relevant, and Time-bound goals to stay focused and organized.',
      idealFor:
          'Goal-oriented individuals and teams seeking to create clear and actionable objectives.',
      icon: Icons.flag,
      color: Colors.indigo,
    ),
    TechniqueData(
      title: 'Mind Mapping',
      description:
          'Use diagrams to organize information, tasks, and ideas visually, facilitating better planning and prioritization.',
      idealFor:
          'Creative thinkers and anyone who benefits from visual representation of ideas and plans.',
      icon: Icons.device_hub,
      color: Colors.amber,
    ),
    TechniqueData(
      title: 'Daily Planning',
      description:
          'Create a daily to-do list, often the night before, to plan your tasks for the next day and stay organized.',
      idealFor:
          'People who thrive with a clear plan for their day and need to ensure they address all necessary tasks.',
      icon: Icons.today,
      color: Colors.deepPurple,
    ),
    TechniqueData(
      title: 'Time Audit',
      description:
          'Regularly review how you spend your time to make adjustments and improvements, ensuring better time allocation.',
      idealFor:
          'Those looking to make significant changes in their time management habits by understanding where their time goes.',
      icon: Icons.assessment,
      color: Colors.deepOrange,
    ),
    TechniqueData(
      title: 'Pomodoro Technique',
      description:
          'Work in focused intervals (usually 25 minutes), followed by short breaks, to maintain productivity and prevent burnout.',
      idealFor:
          'Individuals who have difficulty maintaining focus for long periods or want to avoid burnout, including students and office workers.',
      icon: Icons.av_timer,
      color: Colors.lime,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Productivity Techniques'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: techniques.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: techniques[index].color,
                child: Icon(techniques[index].icon, color: Colors.white),
              ),
              title: Text(
                techniques[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        techniques[index].description,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Ideal For: ${techniques[index].idealFor}',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TechniqueData {
  final String title;
  final String description;
  final String idealFor;
  final IconData icon;
  final Color color;

  TechniqueData({
    required this.title,
    required this.description,
    required this.idealFor,
    required this.icon,
    required this.color,
  });
}
