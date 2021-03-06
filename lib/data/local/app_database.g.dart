// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PostDao? _postDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PostLocal` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `subreddit` TEXT NOT NULL, `author_fullname` TEXT NOT NULL, `created_utc` INTEGER NOT NULL, `num_comments` INTEGER NOT NULL, `score` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PostDao get postDao {
    return _postDaoInstance ??= _$PostDao(database, changeListener);
  }
}

class _$PostDao extends PostDao {
  _$PostDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _postLocalInsertionAdapter = InsertionAdapter(
            database,
            'PostLocal',
            (PostLocal item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'subreddit': item.subreddit,
                  'author_fullname': item.author_fullname,
                  'created_utc': item.created_utc,
                  'num_comments': item.num_comments,
                  'score': item.score
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PostLocal> _postLocalInsertionAdapter;

  @override
  Stream<List<PostLocal>> get() {
    return _queryAdapter.queryListStream('SELECT * FROM PostLocal',
        mapper: (Map<String, Object?> row) => PostLocal(
            row['id'] as int,
            row['title'] as String,
            row['subreddit'] as String,
            row['author_fullname'] as String,
            row['created_utc'] as int,
            row['num_comments'] as int,
            row['score'] as int),
        queryableName: 'PostLocal',
        isView: false);
  }

  @override
  Future<void> save(PostLocal postLocal) async {
    await _postLocalInsertionAdapter.insert(
        postLocal, OnConflictStrategy.replace);
  }

  @override
  Future<void> saveAll(List<PostLocal> posts) async {
    await _postLocalInsertionAdapter.insertList(
        posts, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _listIntConverter = ListIntConverter();
final _listStringConverter = ListStringConverter();
