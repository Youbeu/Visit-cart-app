import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static final Db instance = Db._init();
  static Database? _database;

  Db._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDb('visi_db.db');
    return _database!;
  }

  Future<Database> _initDb(String filename) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filename);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {

    const userTable = '''
    CREATE TABLE user_data (
      id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identifiant unique.
      name TEXT NOT NULL,                   -- Nom de l'utilisateur.
      profession TEXT NOT NULL,             -- Profession.
      phone TEXT NOT NULL,                  -- Téléphone.
      email TEXT NOT NULL                   -- Adresse email.
    );
    ''';

    // Exécution de la commande SQL.
    await db.execute(userTable);

  }

  Future<void> insertUser(String name, String profession, String telephone, String email) async{
    final db = await database;

    await db.delete('user_data');

    await db.insert(
        'user_data',
        {
          'name': name,
          'profession':profession,
          'phone':telephone,
          'email':email
        },
        conflictAlgorithm : ConflictAlgorithm.replace
    );
  }

  Future<Map<String, String>> getUserData() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('user_data', limit: 1);

    if (result.isNotEmpty) {
      return {
        'name': result[0]['name'] ?? '',
        'profession': result[0]['profession'] ?? '',
        'phone': result[0]['phone'] ?? '',
        'email': result[0]['email'] ?? '',
      };
    } else {
      return {
        'name': '',
        'profession': '',
        'phone': '',
        'email': '',
      };
    }
  }

}