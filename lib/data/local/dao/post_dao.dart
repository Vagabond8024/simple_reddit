import 'package:floor/floor.dart';
import 'package:simple_reddit/data/local/model/post_local.dart';

@dao
abstract class PostDao {
  @Query('SELECT * FROM PostLocal')
  Stream<List<PostLocal>> get();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> save(PostLocal postLocal);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveAll(List<PostLocal> posts);
}
