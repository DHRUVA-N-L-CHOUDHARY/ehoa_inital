
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/journal_details_controller.dart';

class JournalDetailsView extends StatelessWidget {
  const JournalDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JournalDetailsController>(
      builder: (c) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(),
          );
      }
    );
  }
}
