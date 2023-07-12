import 'package:bootcamp_starter/features/active_share/widgets/profile_card.dart';
import 'package:flutter/material.dart';

import '../../../core/util/constants.dart';
import '../../../core/util/styles.dart';


class ProfilesListView extends StatelessWidget {
  const ProfilesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index){
          return const ProfileCard();
        });
  }
}
