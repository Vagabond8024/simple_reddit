class TimeUtils {
  static String timeAgo(double created_utc) {
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(created_utc.toInt() * 1000);
    DateTime dateNow = DateTime.now();
    final int hoursDifference = dateNow.difference(date).inHours;

    if (hoursDifference == 1) {
      return '1 hour ago';
    } else if (hoursDifference <= 24) {
      return '$hoursDifference hours ago';
    } else if (hoursDifference % 24 == 1) {
      return '1 day ago';
    } else {
      return '${hoursDifference % 24} days ago';
    }

    // return hoursDifference % 24 == 0
    //     ? (hoursDifference == 1 ? '1 hour ago' : '$hoursDifference hours ago')
    //     : (hoursDifference % 24 == 1
    //         ? '1 day ago'
    //         : '${hoursDifference % 24} days ago');
  }
}
