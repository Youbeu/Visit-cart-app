import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  // Instance unique de la classe Db
  static final Db instance = Db._init();
  static Database? _database; // Variable pour stocker la base de données.

  // Constructeur privé pour initialiser l'instance
  Db._init();

  // Getter pour accéder à la base de données
  Future<Database> get database async {
    // Si la base de données existe déjà, la renvoyer.
    if (_database != null) return _database!;

    // Sinon, initialiser la base de données.
    _database = await _initDb('visi_db.db');
    return _database!;
  }

  // Méthode pour initialiser la base de données
  Future<Database> _initDb(String filename) async {
    // Récupère le chemin des bases de données
    final dbPath = await getDatabasesPath();
    // Crée le chemin complet pour le fichier de base de données
    final path = join(dbPath, filename);

    // Ouvre ou crée la base de données
    return await openDatabase(
      path,
      version: 1, // Version de la base de données
      onCreate: _createDB, // Méthode pour créer les tables
    );
  }

  // Méthode pour créer la table user_data
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

    // Exécution de la commande SQL pour créer la table
    await db.execute(userTable);
  }

  // Méthode pour insérer ou mettre à jour les données utilisateur
  Future<void> insertUser(String name, String profession, String telephone, String email) async {
    final db = await database; // Accède à la base de données

    // Supprime les anciennes données avant d'insérer les nouvelles
    await db.delete('user_data');

    // Insère les données utilisateur
    await db.insert(
        'user_data',
        {
          'name': name,
          'profession': profession,
          'phone': telephone,
          'email': email
        },
        conflictAlgorithm: ConflictAlgorithm.replace // Remplace les anciennes données en cas de conflit
    );
  }

  // Méthode pour récupérer les données utilisateur
  Future<Map<String, String>> getUserData() async {
    final db = await database; // Accède à la base de données
    final List<Map<String, dynamic>> result = await db.query('user_data', limit: 1); // Récupère les données

    if (result.isNotEmpty) {
      // Renvoie les données si elles existent
      return {
        'name': result[0]['name'] ?? '',
        'profession': result[0]['profession'] ?? '',
        'phone': result[0]['phone'] ?? '',
        'email': result[0]['email'] ?? '',
      };
    } else {
      // Renvoie des chaînes vides si aucune donnée n'est trouvée
      return {
        'name': '',
        'profession': '',
        'phone': '',
        'email': '',
      };
    }
  }
}
