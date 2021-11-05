import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/widgets/talkshow_detail_item.dart';

class TalkshowItem extends StatelessWidget {
  const TalkshowItem();
  static const routeName = '/talkshow-item';
  @override
  Widget build(BuildContext context) {
    List<Talkshow> listTalkshow = [];
    listTalkshow = Talkshow.createListTalkshow();
    return ListView.builder(
      itemCount: listTalkshow.length,
      itemBuilder: (context, index) {
        return TalkshowDetailItem(listTalkshow[index]);
      },
    );
  }
}
