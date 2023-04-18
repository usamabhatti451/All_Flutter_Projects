import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume App',
      home: ResumePage(),
    );
  }
}

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('My Resume'.toUpperCase(), style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children:  [
              ClipOval(
                child: Image.asset(
                  'assets/p.jpeg',
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Usama Mushtaq'.toUpperCase(),
                style: const TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 20),
              const Text(
                'Email: usamabhattiengineer450@gmail.com',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,),
              ),
              const SizedBox(height: 20),
              const Text(
                'Phone: 0301-1364451',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400,),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Objective'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Objective'),
                        content: const Text(
                            'To obtain a challenging position that utilizes my skills and experience.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
             const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Experience'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Experience'),
                        content: const Text(
                            '3 years of experience in software development with expertise in Flutter and Firebase.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Skills'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Skills'),
                        content: const Text(
                            'Flutter, Firebase, Dart, HTML, CSS, JavaScript, Git.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('References'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('References'),
                        content: const Text(
                            'References will be furnished on demand.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
