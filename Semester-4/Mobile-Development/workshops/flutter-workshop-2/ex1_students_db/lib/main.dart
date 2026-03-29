import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion des Etudiants',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StudentsPage(),
    );
  }
}

class Student {
  final int? id;
  final String name;

  const Student({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}

class StudentsDatabase {
  static final StudentsDatabase instance = StudentsDatabase._();
  static Database? _database;

  StudentsDatabase._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'students_workshop.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE students(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertStudent(String name) async {
    final db = await database;
    return db.insert('students', {'name': name.trim()});
  }

  Future<List<Student>> getStudents() async {
    final db = await database;
    final rows = await db.query('students', orderBy: 'id ASC');
    return rows.map(Student.fromMap).toList();
  }

  Future<int> updateStudent(int id, String newName) async {
    final db = await database;
    return db.update(
      'students',
      {'name': newName.trim()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;
    return db.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final TextEditingController _nameController = TextEditingController();
  late Future<List<Student>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _reloadStudents();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _reloadStudents() {
    setState(() {
      _studentsFuture = StudentsDatabase.instance.getStudents();
    });
  }

  Future<void> _insertStudent() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      return;
    }

    await StudentsDatabase.instance.insertStudent(name);
    _nameController.clear();
    _reloadStudents();
  }

  Future<void> _updateStudent(Student student) async {
    final editController = TextEditingController(text: student.name);

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Modifier etudiant'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(
              labelText: 'Nouveau nom',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () async {
                final newName = editController.text.trim();
                if (newName.isEmpty || student.id == null) {
                  return;
                }
                await StudentsDatabase.instance.updateStudent(student.id!, newName);
                if (!mounted) {
                  return;
                }
                Navigator.pop(context);
                _reloadStudents();
              },
              child: const Text('Enregistrer'),
            ),
          ],
        );
      },
    );

    editController.dispose();
  }

  Future<void> _deleteStudent(Student student) async {
    if (student.id == null) {
      return;
    }
    await StudentsDatabase.instance.deleteStudent(student.id!);
    _reloadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des etudiants'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Nom de etudiant',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _insertStudent(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _insertStudent,
                  child: const Text('Ajouter'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Student>>(
                future: _studentsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Erreur: ${snapshot.error}'),
                    );
                  }

                  final students = snapshot.data ?? [];
                  if (students.isEmpty) {
                    return const Center(
                      child: Text('Aucun etudiant enregistre.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${student.id ?? '-'}'),
                          ),
                          title: Text(student.name),
                          trailing: Wrap(
                            spacing: 4,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _updateStudent(student),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteStudent(student),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
