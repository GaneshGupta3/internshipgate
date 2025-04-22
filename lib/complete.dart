import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF303F9F),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange,
        ),
      ),
      home: const InternshipHomePage(),
    );
  }
}

// Models for Education, Skills and Projects
class Education {
  final String id;
  final String degree;
  final String institution;
  final String completionYear;
  final String performance;
  final String performanceScale;

  Education({
    required this.id,
    required this.degree,
    required this.institution,
    required this.completionYear,
    required this.performance,
    required this.performanceScale,
  });
}

class Skill {
  final String id;
  final String name;

  Skill({required this.id, required this.name});
}

class Project {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final List<String> technologies;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.technologies,
  });
}

// Home Page
class InternshipHomePage extends StatefulWidget {
  const InternshipHomePage({Key? key}) : super(key: key);

  @override
  State<InternshipHomePage> createState() => _InternshipHomePageState();
}

class _InternshipHomePageState extends State<InternshipHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.person, color: Colors.blue[800], size: 20),
                  Transform.translate(
                    offset: const Offset(5, -5),
                    child: Icon(Icons.search, color: Colors.blue[800], size: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Internship',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'gate',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'BUILD YOUR DREAMS',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 10,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {
                setState(() {
                  _currentIndex = 3; // Navigate to profile page
                });
              },
            ),
          ),
        ],
      ),
      body: _currentIndex == 3 
          ? const InternshipProfilePage() 
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi, Welcome back!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'GANESH GUPTA',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[400],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _currentIndex = 3; // Navigate to profile page
                            });
                          },
                          child: const Text(
                            'View Profile',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.5,
                      children: [
                        _buildStatsCard(
                          '0',
                          'All\nApplications',
                          Icons.description,
                          const Color(0xFFFFF0E0),
                          Colors.orange[300]!,
                        ),
                        _buildStatsCard(
                          '0',
                          'Shortlisted',
                          Icons.check_circle_outline,
                          const Color(0xFFE0F0F0),
                          Colors.teal,
                        ),
                        _buildStatsCard(
                          '0',
                          'Offer Received',
                          Icons.file_copy_outlined,
                          const Color(0xFFE0F5E0),
                          Colors.green,
                        ),
                        _buildStatsCard(
                          '0',
                          'Favorites',
                          Icons.star_border,
                          const Color(0xFFFFF8E0),
                          Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Internships',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildStatsCard(
    String count,
    String label,
    IconData icon,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                count,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

// Profile Page
class InternshipProfilePage extends StatefulWidget {
  const InternshipProfilePage({Key? key}) : super(key: key);

  @override
  State<InternshipProfilePage> createState() => _InternshipProfilePageState();
}

class _InternshipProfilePageState extends State<InternshipProfilePage> {
  // Sample data for education, skills and projects
  List<Education> educationList = [
    Education(
      id: '1',
      degree: 'Secondary',
      institution: 'S',
      completionYear: '2028',
      performance: '8',
      performanceScale: 'CGPA',
    ),
  ];

  List<Skill> skillsList = [
    Skill(id: '1', name: 'Java'),
  ];

  List<Project> projectsList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fields marked with * are mandatory to apply for internships',
                  style: TextStyle(
                    color: Color(0xFF607D8B),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'GANESH GUPTA',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '2022.ganesh.gupta@ves.ac.in',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                _buildInfoField('*Location:', ''),
                _buildInfoField('*Address:', ''),
                _buildInfoField('Experience:', '0 Year 0 Months'),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Title, Address, Location Required!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Details',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                
                // Education Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '*Education:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Add Education'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        _showAddEducationDialog(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Display Education List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: educationList.length,
                  itemBuilder: (context, index) {
                    final education = educationList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                education.degree,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showEditEducationDialog(context, education, index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                setState(() {
                                  educationList.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                        Text(
                          education.institution,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Expected Year of completion: ${education.completionYear}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Performance: ${education.performanceScale} - ${education.performance}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                      ],
                    );
                  },
                ),
                
                if (educationList.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'No education details. Please add your education.',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                
                // Key Skills Section
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '*Key Skills:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Skills'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        _showSkillsDialog(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Display Skills List
                if (skillsList.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: skillsList.map((skill) {
                      return Chip(
                        label: Text(skill.name),
                        deleteIcon: const Icon(Icons.clear, size: 16),
                        onDeleted: () {
                          setState(() {
                            skillsList.remove(skill);
                          });
                        },
                        backgroundColor: Colors.blue[100],
                      );
                    }).toList(),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'No skills added. Please add your key skills.',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                const Divider(),
                
                // Other Details Section
                const SizedBox(height: 16),
                const Text(
                  'Other Details',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                
                // Project Section
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Projects:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Add Project'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        _showAddProjectDialog(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Display Project List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projectsList.length,
                  itemBuilder: (context, index) {
                    final project = projectsList[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    project.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _showEditProjectDialog(context, project, index);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    setState(() {
                                      projectsList.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Duration: ${project.startDate} - ${project.endDate}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              project.description,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: project.technologies.map((tech) {
                                return Chip(
                                  label: Text(tech),
                                  backgroundColor: Colors.blue[50],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                
                if (projectsList.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'No project details. Please add your projects.',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                
                const SizedBox(height: 16),
                const Divider(),
                
                // Internship Section (unchanged from original)
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Internship:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text('Add Internship'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'No internship details....',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                
                // Training Section (unchanged from original)
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Training:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.edit),
                      label: const Text('Add Training'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'No training details....',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to show Add Education Dialog
  void _showAddEducationDialog(BuildContext context) {
    final TextEditingController degreeController = TextEditingController();
    final TextEditingController institutionController = TextEditingController();
    final TextEditingController yearController = TextEditingController();
    final TextEditingController performanceController = TextEditingController();
    String performanceScale = 'CGPA';
    
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Education'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: degreeController,
                      decoration: const InputDecoration(
                        labelText: 'Degree/Course*',
                        hintText: 'e.g., B.Tech Computer Science',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: institutionController,
                      decoration: const InputDecoration(
                        labelText: 'Institution*',
                        hintText: 'e.g., VES Institute of Technology',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: yearController,
                      decoration: const InputDecoration(
                        labelText: 'Expected Year of Completion*',
                        hintText: 'e.g., 2025',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: performanceController,
                            decoration: const InputDecoration(
                              labelText: 'Performance*',
                              hintText: 'e.g., 8.5',
                            ),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        const SizedBox(width: 16),
                        DropdownButton<String>(
                          value: performanceScale,
                          items: ['CGPA', 'Percentage'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                performanceScale = newValue;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (degreeController.text.isNotEmpty &&
                        institutionController.text.isNotEmpty &&
                        yearController.text.isNotEmpty &&
                        performanceController.text.isNotEmpty) {
                      final newEducation = Education(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        degree: degreeController.text,
                        institution: institutionController.text,
                        completionYear: yearController.text,
                        performance: performanceController.text,
                        performanceScale: performanceScale,
                      );
                      this.setState(() {
                        educationList.add(newEducation);
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                  ),
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Helper method to show Edit Education Dialog
  void _showEditEducationDialog(BuildContext context, Education education, int index) {
    final TextEditingController degreeController = TextEditingController(text: education.degree);
    final TextEditingController institutionController = TextEditingController(text: education.institution);
    final TextEditingController yearController = TextEditingController(text: education.completionYear);
    final TextEditingController performanceController = TextEditingController(text: education.performance);
    String performanceScale = education.performanceScale;
    
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Education'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: degreeController,
                      decoration: const InputDecoration(
                        labelText: 'Degree/Course*',
                        hintText: 'e.g., B.Tech Computer Science',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: institutionController,
                      decoration: const InputDecoration(
                        labelText: 'Institution*',
                        hintText: 'e.g., VES Institute of Technology',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: yearController,
                      decoration: const InputDecoration(
                        labelText: 'Expected Year of Completion*',
                        hintText: 'e.g., 2025',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: performanceController,
                            decoration: const InputDecoration(
                              labelText: 'Performance*',
                              hintText: 'e.g., 8.5',
                            ),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                        ),
                        const SizedBox(width: 16),
                        DropdownButton<String>(
                          value: performanceScale,
                          items: ['CGPA', 'Percentage'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                performanceScale = newValue;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (degreeController.text.isNotEmpty &&
                        institutionController.text.isNotEmpty &&
                        yearController.text.isNotEmpty &&
                        performanceController.text.isNotEmpty) {
                      final updatedEducation = Education(
                        id: education.id,
                        degree: degreeController.text,
                        institution: institutionController.text,
                        completionYear: yearController.text,
                        performance: performanceController.text,
                        performanceScale: performanceScale,
                      );
                      this.setState(() {
                        educationList[index] = updatedEducation;
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                  ),
                  child: const Text('Update'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Helper method to show Skills Dialog
  void _showSkillsDialog(BuildContext context) {
    final TextEditingController skillController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Skills'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: skillController,
                decoration: const InputDecoration(
                  labelText: 'Add Skill',
                  hintText: 'e.g., Flutter, Java, Python',
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: skillsList.map((skill) {
                  return Chip(
                    label: Text(skill.name),
                    deleteIcon: const Icon(Icons.clear, size: 16),
                    onDeleted: () {
                      setState(() {
                        skillsList.remove(skill);
                      });
                    },
                    backgroundColor: Colors.blue[100],
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (skillController.text.isNotEmpty) {
                  final newSkill = Skill(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: skillController.text,
                  );
                  setState(() {
                    skillsList.add(newSkill);
                  });
                  skillController.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
              ),
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  // Helper method to show Add Project Dialog
  void _showAddProjectDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();
    final TextEditingController techController = TextEditingController();
    final List<String> technologies = [];
    
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Project'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Project Title*',
                        hintText: 'e.g., E-commerce App',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description*',
                        hintText: 'Describe your project...',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: startDateController,
                            decoration: const InputDecoration(
                              labelText: 'Start Date*',
                              hintText: 'MM/YYYY',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: endDateController,
                            decoration: const InputDecoration(
                              labelText: 'End Date*',
                              hintText: 'MM/YYYY or Present',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: techController,
                            decoration: const InputDecoration(
                              labelText: 'Technologies Used*',
                              hintText: 'e.g., Flutter',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            if (techController.text.isNotEmpty) {
                              setState(() {
                                technologies.add(techController.text);
                                techController.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (technologies.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: technologies.map((tech) {
                          return Chip(
                            label: Text(tech),
                            deleteIcon: const Icon(Icons.clear, size: 16),
                            onDeleted: () {
                              setState(() {
                                technologies.remove(tech);
                              });
                            },
                            backgroundColor: Colors.blue[100],
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        startDateController.text.isNotEmpty &&
                        endDateController.text.isNotEmpty &&
                        technologies.isNotEmpty) {
                      final newProject = Project(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: titleController.text,
                        description: descriptionController.text,
                        startDate: startDateController.text,
                        endDate: endDateController.text,
                        technologies: List.from(technologies),
                      );
                      this.setState(() {
                        projectsList.add(newProject);
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                  ),
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Helper method to show Edit Project Dialog
  void _showEditProjectDialog(BuildContext context, Project project, int index) {
    final TextEditingController titleController = TextEditingController(text: project.title);
    final TextEditingController descriptionController = TextEditingController(text: project.description);
    final TextEditingController startDateController = TextEditingController(text: project.startDate);
    final TextEditingController endDateController = TextEditingController(text: project.endDate);
    final TextEditingController techController = TextEditingController();
    final List<String> technologies = List.from(project.technologies);
    
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Project'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Project Title*',
                        hintText: 'e.g., E-commerce App',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description*',
                        hintText: 'Describe your project...',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: startDateController,
                            decoration: const InputDecoration(
                              labelText: 'Start Date*',
                              hintText: 'MM/YYYY',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: endDateController,
                            decoration: const InputDecoration(
                              labelText: 'End Date*',
                              hintText: 'MM/YYYY or Present',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: techController,
                            decoration: const InputDecoration(
                              labelText: 'Technologies Used*',
                              hintText: 'e.g., Flutter',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            if (techController.text.isNotEmpty) {
                              setState(() {
                                technologies.add(techController.text);
                                techController.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (technologies.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: technologies.map((tech) {
                          return Chip(
                            label: Text(tech),
                            deleteIcon: const Icon(Icons.clear, size: 16),
                            onDeleted: () {
                              setState(() {
                                technologies.remove(tech);
                              });
                            },
                            backgroundColor: Colors.blue[100],
                          );
                        }).toList(),
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        startDateController.text.isNotEmpty &&
                        endDateController.text.isNotEmpty &&
                        technologies.isNotEmpty) {
                      final updatedProject = Project(
                        id: project.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        startDate: startDateController.text,
                        endDate: endDateController.text,
                        technologies: List.from(technologies),
                      );
                      this.setState(() {
                        projectsList[index] = updatedProject;
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                  ),
                  child: const Text('Update'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Helper method to build info field
  Widget _buildInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? 'Not specified' : value,
              style: TextStyle(
                fontSize: 16,
                color: value.isEmpty ? Colors.red : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}