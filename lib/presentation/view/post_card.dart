import 'package:flutter/material.dart';
import 'package:simple_reddit/core/resources/colors.dart';
import 'package:simple_reddit/core/utils/time_utils.dart';
import 'package:simple_reddit/domain/entities/post.dart';
import 'package:simple_reddit/presentation/view/text.dart';

class PostCard extends StatelessWidget {
  Post _post;

  PostCard(this._post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(
                        Icons.person_outline_rounded,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextBold("r/${_post.subreddit}", 12,
                                      RColors.Black),
                                  TextRegular(
                                      ' • Posted by u/${_post.author_fullname}',
                                      12,
                                      RColors.Grey),
                                ],
                              ),
                              TextRegular(TimeUtils.timeAgo(_post.created_utc),
                                  12, RColors.Grey),
                            ],
                          ),
                          // new Spacer(),
                          // Spacer(flex: 2),
                          // Flexible(child: Container()),
                          ElevatedButton(
                              onPressed: () {},
                              child: TextBold('Join', 16, RColors.Wihte),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(RColors.Blue),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                TextBold(_post.title, 18, RColors.Black),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_circle_up_rounded,
                        color: RColors.Grey200,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: TextBold(
                            _scoreConverter(_post.score), 15, RColors.Black),
                      ),
                      Icon(
                        Icons.arrow_circle_down_rounded,
                        color: RColors.Grey,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 6, 0),
                        child: Icon(
                          Icons.mode_comment_outlined,
                          color: RColors.Grey,
                        ),
                      ),
                      TextRegular(_commentsConveretr(_post.num_comments), 15,
                          RColors.Grey)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _scoreConverter(dynamic score) {
  return '${score ~/ 1000}k';
}

String _commentsConveretr(dynamic comments) {
  if (comments < 1000) {
    return '$comments Comments';
  } else {
    var num_comments = (comments / 1000).toStringAsFixed(1);
    return '${num_comments}k Comments';
  }
}
