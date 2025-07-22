import 'package:flutter/material.dart';
import 'package:pta_contrib/core/theme/app_theme.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';
import 'package:pta_contrib/shared/widgets/card.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final List<Project> _allProjects = [
    Project(
      id: '1',
      title: 'Community Well Project',
      description: 'Providing clean and safe drinking water to rural communities.',
      targetAmount: 15000.0,
      currentAmount: 8500.0,
      imageUrl: 'https://placehold.co/600x400/5A3A2B/F5E5D4?text=Well+Project',
    ),
    Project(
      id: '2',
      title: 'School Renovation Fund',
      description: 'Renovating dilapidated classrooms to create a better learning environment.',
      targetAmount: 20000.0,
      currentAmount: 12000.0,
      imageUrl: 'https://placehold.co/600x400/D4AF37/5A3A2B?text=School+Renovation',
    ),
    Project(
      id: '3',
      title: 'Medical Camp Initiative',
      description: 'Organizing free medical check-ups and treatment for underserved populations.',
      targetAmount: 10000.0,
      currentAmount: 9500.0,
      imageUrl: 'https://placehold.co/600x400/5A3A2B/F5E5D4?text=Medical+Camp',
    ),
    Project(
      id: '4',
      title: 'Youth Empowerment Program',
      description: 'Providing vocational training and mentorship to unemployed youth.',
      targetAmount: 18000.0,
      currentAmount: 5000.0,
      imageUrl: 'https://placehold.co/600x400/D4AF37/5A3A2B?text=Youth+Empowerment',
    ),
  ];


  final List<Project> _chosenProjects = [];


  
  void _chooseProject(Project project) {
    setState(() {
      if (!_chosenProjects.contains(project)) {
        _chosenProjects.add(project);
       
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${project.title} added to your chosen projects!'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${project.title} is already in your chosen projects.'),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
         
            Image.asset(
              'assets/logo.png', 
              height: 40,
              width: 40,
              errorBuilder: (context, error, stackTrace) {
       
                return CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: const Icon(Icons.volunteer_activism, color: Colors.white),
                );
              },
            ),
            const SizedBox(width: 10),
        
            Text(
              'Impact Fund',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ],
        ),
        centerTitle: false, 
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
              child: Text(
                'Explore Projects',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
           
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.85), 
                itemCount: _allProjects.length,
                itemBuilder: (context, index) {
                  final project = _allProjects[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ProjectCard(
                      project: project,
                      onChooseProject: () => _chooseProject(project),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

           
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
              child: Text(
                'My Chosen Projects',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
        
            _chosenProjects.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: Text(
                        'You haven\'t chosen any projects yet. Select one from above!',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.darkText.withAlpha((0.7 * 255).toInt()),
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true, 
                    physics: const NeverScrollableScrollPhysics(), 
                    itemCount: _chosenProjects.length,
                    itemBuilder: (context, index) {
                      final project = _chosenProjects[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: ProjectCard(project: project),
                      );
                    },
                  ),
            const SizedBox(height: 24), 
          ],
        ),
      ),
    );
  }
}

