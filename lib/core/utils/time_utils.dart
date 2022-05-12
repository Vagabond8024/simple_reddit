class TimeUtils {
  static String timeAgo(int created_utc) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(1650923592 * 1000);
    DateTime dateNow = DateTime.now();
    int hoursDifference = dateNow.difference(date).inHours;
    return hoursDifference % 24 == 0
        ? (hoursDifference == 1 ? '1 hour ago' : '$hoursDifference hours ago')
        : (hoursDifference % 24 == 1
            ? '1 day ago'
            : '${hoursDifference % 24} days ago');
  }
}
