import 'package:carbonsense/constants/quick_questions.dart';
import 'package:carbonsense/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ChatBubbleType { chatBubbleAvatarOnLeft, chatBubbleAvatarOnRight }

class ChatBubble extends StatelessWidget {
  final double kRoundBorderRadius = 16;
  final double kSharpBorderRadius = 1;
  final double kAvatarRadius = 16;
  final double kOuterMarginRadius = 16;
  final double kInternalMarginRadius = 16;

  final String text;
  final ChatBubbleType type;
  final bool hasQuickQuestions;
  final Function(String)? onQuickQuestionTap;

  const ChatBubble({
    super.key,
    required this.text,
    this.type = ChatBubbleType.chatBubbleAvatarOnLeft,
    this.hasQuickQuestions = false,
    this.onQuickQuestionTap,
  });

  RoundedRectangleBorder getBorders() => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRoundBorderRadius),
          topRight: Radius.circular(kRoundBorderRadius),
          bottomLeft: Radius.circular(
              type == ChatBubbleType.chatBubbleAvatarOnLeft
                  ? kSharpBorderRadius
                  : kRoundBorderRadius),
          bottomRight: Radius.circular(
              type == ChatBubbleType.chatBubbleAvatarOnLeft
                  ? kRoundBorderRadius
                  : kSharpBorderRadius),
        ),
      );

  List<Widget> getAvatar() => [
        if (type == ChatBubbleType.chatBubbleAvatarOnRight)
          const Padding(
            padding: EdgeInsets.only(right: 10),
          ),
        CircleAvatar(
          backgroundColor: kLightGreen2,
          radius: kAvatarRadius,
          child: Icon(type == ChatBubbleType.chatBubbleAvatarOnLeft
              ? Icons.youtube_searched_for
              : Icons.person),
        ),
        if (type == ChatBubbleType.chatBubbleAvatarOnLeft)
          const Padding(
            padding: EdgeInsets.only(right: 10),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kOuterMarginRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (type == ChatBubbleType.chatBubbleAvatarOnLeft) ...getAvatar(),
              if (type == ChatBubbleType.chatBubbleAvatarOnRight)
                const Spacer(),
              Card(
                elevation: 0,
                color: kLightGreen4,
                shape: getBorders(),
                child: Padding(
                  padding: EdgeInsets.all(kInternalMarginRadius),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      text,
                      maxLines: 10,
                      style: GoogleFonts.montserrat(),
                    ),
                  ),
                ),
              ),
              if (type == ChatBubbleType.chatBubbleAvatarOnRight)
                ...getAvatar(),
            ],
          ),
          if (hasQuickQuestions) ...[
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                left:
                    kInternalMarginRadius + kOuterMarginRadius + kAvatarRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DOMANDE RAPIDE",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                  ),
                  ...kQuickQuestions
                      .map(
                        (e) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              kRoundBorderRadius / 2,
                            ),
                          ),
                          elevation: 0,
                          color: kLightGreen4,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                              kRoundBorderRadius / 2,
                            ),
                            onTap: () {
                              print("hei, ${onQuickQuestionTap == null}");
                              if (onQuickQuestionTap != null) {
                                onQuickQuestionTap!(e);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                e,
                                style: GoogleFonts.montserrat(
                                  color: kDarkGreen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
