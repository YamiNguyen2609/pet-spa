import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/lodging_model.dart';

import '../../../theme/Color.dart';
import '../../../theme/Metrics.dart';
import '../../../ultis/utils.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/scrollview.dart';
import '../../../widgets/text.dart';
import '../../widgets/header.dart';
import '../../widgets/title.dart';

class LodgingDetail extends StatefulWidget {
  final LodgingModel Lodging;
  const LodgingDetail(this.Lodging, {super.key});

  @override
  State<LodgingDetail> createState() => _LodgingDetailState();
}

class _LodgingDetailState extends State<LodgingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background_color,
        body: Column(children: [
          Header(widget.Lodging.name),
          AppScollview(children: [HeaderTitle('Dịch vụ trong gói')])
        ]));
  }
}
