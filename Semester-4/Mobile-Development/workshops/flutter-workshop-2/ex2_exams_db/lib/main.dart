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
      title: 'Gestion des Examens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExamsPage(),
    );
  }
}

class Exam {
  final int? id;
  final String examName;

  const Exam({this.id, required this.examName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exam_name': examName,
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id'] as int,
      examName: map['exam_name'] as String,
    );
  }
}

class ExamsDatabase {
  static final ExamsDatabase instance = ExamsDatabase._();
  static Database? _database;

  ExamsDatabase._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'exams_workshop.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE exams(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            exam_name TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertExam(String examName) async {
    final db = await database;
    return db.insert('exams', {'exam_name': examName.trim()});
  }

  Future<List<Exam>> getExams() async {
    final db = await database;
    final rows = await db.query('exams', orderBy: 'id ASC');
    return rows.map(Exam.fromMap).toList();
  }

  Future<int> updateExam(int id, String newExamName) async {
    final db = await database;
    return db.update(
      'exams',
      {'exam_name': newExamName.trim()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteExam(int id) async {
    final db = await database;
    return db.delete('exams', where: 'id = ?', whereArgs: [id]);
  }
}

class ExamsPage extends StatefulWidget {
  const ExamsPage({super.key});

  @override
  State<ExamsPage> createState() => _ExamsPageState();
}

class _ExamsPageState extends State<ExamsPage> {
  final TextEditingController _examController = TextEditingController();
  late Future<List<Exam>> _examsFuture;

  @override
  void initState() {
    super.initState();
    _reloadExams();
  }

  @override
  void dispose() {
    _examController.dispose();
    super.dispose();
  }

  void _reloadExams() {
    setState(() {
      _examsFuture = ExamsDatabase.instance.getExams();
    });
  }

  Future<void> _insertExam() async {
    final examName = _examController.text.trim();
    if (examName.isEmpty) {
      return;
    }

    await ExamsDatabase.instance.insertExam(examName);
    _examController.clear();
    _reloadExams();
  }

  Future<void> _updateExam(Exam exam) async {
    final editController = TextEditingController(text: exam.examName);

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Modifier examen'),
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
                if (newName.isEmpty || exam.id == null) {
                  return;
                }
                await ExamsDatabase.instance.updateExam(exam.id!, newName);
                if (!mounted) {
                  return;
                }
                Navigator.pop(context);
                _reloadExams();
              },
              child: const Text('Enregistrer'),
            ),
          ],
        );
      },
    );

    editController.dispose();
  }

  Future<void> _deleteExam(Exam exam) async {
    if (exam.id == null) {
      return;
    }
    await ExamsDatabase.instance.deleteExam(exam.id!);
    _reloadExams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des examens'),
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
                    controller: _examController,
                    decoration: const InputDecoration(
                      hintText: 'Nom de examen',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _insertExam(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _insertExam,
                  child: const Text('Ajouter'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Exam>>(
                future: _examsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Erreur: ${snapshot.error}'),
                    );
                  }

                  final exams = snapshot.data ?? [];
                  if (exams.isEmpty) {
                    return const Center(
                      child: Text('Aucun examen enregistre.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: exams.length,
                    itemBuilder: (context, index) {
                      final exam = exams[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${exam.id ?? '-'}'),
                          ),
                          title: Text(exam.examName),
                          trailing: Wrap(
                            spacing: 4,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _updateExam(exam),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteExam(exam),
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
