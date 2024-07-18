import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity Tools',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductivityToolsScreen(),
    );
  }
}

class ProductivityToolsScreen extends StatelessWidget {
  final List<ToolData> tools = [
    ToolData(
      title: 'Trello',
      description:
          'A visual collaboration tool that organizes your projects into boards, making it easy to manage tasks and workflows.',
      idealFor:
          'Teams and individuals who need to track progress and collaborate on projects.',
      icon: Icons.dashboard,
      color: Colors.blue,
    ),
    ToolData(
      title: 'Asana',
      description:
          'A task management tool that helps teams orchestrate their work, from daily tasks to strategic initiatives.',
      idealFor:
          'Teams who need a comprehensive tool to manage tasks, projects, and workflows.',
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    ToolData(
      title: 'Todoist',
      description:
          'A powerful task manager that helps you organize and prioritize your tasks and projects.',
      idealFor:
          'Individuals who need a simple yet powerful task manager to stay organized.',
      icon: Icons.list,
      color: Colors.redAccent,
    ),
    ToolData(
      title: 'RescueTime',
      description:
          'A time management app that tracks your digital activity to help you understand your habits and improve productivity.',
      idealFor:
          'Anyone looking to gain insights into their digital habits and improve time management.',
      icon: Icons.timer,
      color: Colors.blueAccent,
    ),
    ToolData(
      title: 'Microsoft OneNote',
      description:
          'A digital note-taking app that lets you capture and organize notes, ideas, and tasks in one place.',
      idealFor:
          'Students, professionals, and anyone who needs a versatile note-taking tool.',
      icon: Icons.note,
      color: Colors.purple,
    ),
    ToolData(
      title: 'Slack',
      description:
          'A messaging app for teams that integrates with many other tools and services, helping you streamline communication.',
      idealFor: 'Teams who need to improve communication and collaboration.',
      icon: Icons.message,
      color: Colors.orange,
    ),
    ToolData(
      title: 'Google Calendar',
      description:
          'A time-management and scheduling calendar service that helps you keep track of important events and appointments.',
      idealFor:
          'Anyone who needs a reliable tool for scheduling and managing time.',
      icon: Icons.calendar_today,
      color: Colors.teal,
    ),
    ToolData(
      title: 'Focus@Will',
      description:
          'A productivity music service designed to improve focus and increase productivity.',
      idealFor:
          'Individuals who find it challenging to concentrate and want to enhance their focus with music.',
      icon: Icons.music_note,
      color: Colors.amber,
    ),
    ToolData(
      title: 'Evernote',
      description:
          'A note-taking app that helps you capture and organize ideas, notes, and tasks in one place.',
      idealFor:
          'Individuals who need a versatile tool for note-taking and organizing information.',
      icon: Icons.note_add,
      color: Colors.greenAccent,
    ),
    ToolData(
      title: 'Notion',
      description:
          'An all-in-one workspace that combines notes, tasks, databases, and wikis, allowing you to customize your workflow.',
      idealFor:
          'Teams and individuals who need a highly flexible and customizable productivity tool.',
      icon: Icons.apps,
      color: Colors.brown,
    ),
    ToolData(
      title: 'Clockify',
      description:
          'A time tracking tool that allows you to track hours across projects and tasks, ensuring accurate billing and time management.',
      idealFor:
          'Freelancers and businesses that need to track work hours for billing and productivity analysis.',
      icon: Icons.access_time,
      color: Colors.indigo,
    ),
    ToolData(
      title: 'Habitica',
      description:
          'A habit-building and productivity app that turns your tasks and goals into a fun RPG game.',
      idealFor:
          'Individuals who enjoy gamification and need motivation to complete tasks and build habits.',
      icon: Icons.videogame_asset,
      color: Colors.red,
    ),
    ToolData(
      title: 'Forest',
      description:
          'A focus app that helps you stay off your phone and stay focused on your work by growing a virtual tree.',
      idealFor:
          'Individuals who need to reduce phone usage and stay focused on tasks.',
      icon: Icons.nature,
      color: Colors.green,
    ),
    ToolData(
      title: 'Zapier',
      description:
          'An automation tool that connects your apps and automates workflows, saving you time on repetitive tasks.',
      idealFor:
          'Anyone looking to automate workflows and integrate various apps for increased efficiency.',
      icon: Icons.sync,
      color: Colors.blueGrey,
    ),
    ToolData(
      title: 'ClickUp',
      description:
          'A productivity platform that provides tools for task management, goal tracking, and collaboration.',
      idealFor:
          'Teams and individuals looking for an all-in-one productivity and project management tool.',
      icon: Icons.task_alt,
      color: Colors.pink,
    ),
    ToolData(
      title: 'Monday.com',
      description:
          'A work operating system that enables teams to manage projects, workflows, and daily tasks effectively.',
      idealFor:
          'Teams seeking a highly customizable and visual project management tool.',
      icon: Icons.work,
      color: Colors.yellow,
    ),
    ToolData(
      title: 'Basecamp',
      description:
          'A project management and team collaboration tool that keeps all your project communication and files in one place.',
      idealFor:
          'Teams needing a centralized platform for project management and communication.',
      icon: Icons.group_work,
      color: Colors.deepPurple,
    ),
    ToolData(
      title: 'OmniFocus',
      description:
          'A task management app designed for managing complex projects and tasks with powerful organization features.',
      idealFor:
          'Professionals needing advanced task management capabilities, particularly those using Apple devices.',
      icon: Icons.assignment,
      color: Colors.deepOrange,
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
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: tools[index].color,
                child: Icon(tools[index].icon, color: Colors.white),
              ),
              title: Text(
                tools[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tools[index].description,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Ideal For: ${tools[index].idealFor}',
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

class ToolDetailScreen extends StatelessWidget {
  final ToolData tool;

  ToolDetailScreen({required this.tool});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tool.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: tool.color,
              child: Icon(tool.icon, color: Colors.white),
              radius: 30.0,
            ),
            SizedBox(height: 16.0),
            Text(
              tool.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Ideal For: ${tool.idealFor}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToolData {
  final String title;
  final String description;
  final String idealFor;
  final IconData icon;
  final Color color;

  ToolData({
    required this.title,
    required this.description,
    required this.idealFor,
    required this.icon,
    required this.color,
  });
}
