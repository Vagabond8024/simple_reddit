import 'package:floor/floor.dart';
import 'package:simple_reddit/data/local/converters.dart';
import 'package:simple_reddit/data/local/dao/post_dao.dart';
import 'package:simple_reddit/data/local/model/post_local.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

// 8part 'app_database.g.dart';

@TypeConverters([ListIntConverter, ListStringConverter])
@Database(version: 1, entities: [
  PostLocal
])
abstract class AppDatabase extends FloorDatabase {
  PostDao get tournamentDao;
}