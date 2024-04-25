import 'package:flutter/material.dart';

void main() {
  runApp(ResumeApp());
}

class ResumeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Resume Workspace',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Build Options',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          toolbarHeight: 150,
        ),
        body: ResumeBody(),
      ),
    );
  }
}

class ResumeBody extends StatelessWidget {
  final List<Map<String, dynamic>> resumeSections = [
    {
      'title': 'Contact info',
      'icon': Icons.contact_mail_outlined,
      'route': ContactInfoScreen(),
      'children': [],
      'trailingButton': IconButton(
        icon: Icon(Icons.arrow_forward_ios_outlined),
        onPressed: () {},
      ),
    },
    {
      'title': 'Carrier Objective',
      'icon': Icons.work,
      'route': CarrierObjectiveScreen(),
      'children': [],
      'trailingButton': IconButton(
        icon: Icon(Icons.arrow_forward_ios_outlined),
        onPressed: () {},
      ),
    },
    // Add more sections as needed
  ];

  final List<String> additionalNames = [
    'Personal Details',
    'Education',
    'Experiences',
    'Technical Skills',
    'Interest/Hobbies',
    'Projects',
    'Achievements',
    'References',
    'Declaration',
  ];

  final List<IconData> additionalIcons = [
    Icons.contact_phone_sharp,
    Icons.school_outlined,
    Icons.maps_home_work_outlined,
    Icons.workspace_premium_sharp,
    Icons.menu_book,
    Icons.event,
    Icons.workspaces,
    Icons.handshake_outlined,
    Icons.insert_page_break,
  ];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < additionalNames.length; i++) {
      resumeSections.add({
        'title': additionalNames[i],
        'icon': additionalIcons[i % additionalIcons.length],
        'route': AdditionalScreen(),
        'children': [],
        'trailingButton': IconButton(
          icon: Icon(Icons.arrow_forward_ios_outlined),
          onPressed: () {},
        ),
      });
    }

    return ListView.separated(
      itemCount: resumeSections.length,
      itemBuilder: (context, index) {
        final section = resumeSections[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(section['icon']),
              title: Text(
                section['title'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                if (section['route'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => section['route']),
                  );
                }
              },
              trailing: section['trailingButton'],
            ),
            if (section['children'] != null)
              ...section['children']
                  .map((child) => ListTile(
                leading: Icon(child['icon']),
                title: Text(child['title']),
                subtitle: child['subtitle'] != null
                    ? Text(child['subtitle'])
                    : null,
              ))
                  .toList(),
            Divider(),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
    );
  }
}

class ContactInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contact Info'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Contact'),
              Tab(text: 'Photo'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ContactForm(),
            PhotoUploadContainer(), // New widget for photo upload
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Phone',
              hintText: 'Enter your phone number',
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Address',
              hintText: 'Enter your address',
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoUploadContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera_alt,
              size: 50,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Implement photo upload functionality here
            },
            child: Text('Upload Photo'),
          ),
        ],
      ),
    );
  }
}

class CarrierObjectiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrier Objective'),
      ),
      body: Center(
        child: Text('This is the carrier objective screen'),
      ),
    );
  }
}

class AdditionalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Section'),
      ),
      body: Center(
        child: Text('This is an additional screen'),
      ),
    );
  }
}
