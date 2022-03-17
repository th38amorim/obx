import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/home/home_header/home_header_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/modal_home_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_overview/widgets/custom_bottomsheet_widget.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class HomeOverviewPage extends StatelessWidget {
  const HomeOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Image.asset('assets/obenx_logo.png', color: Colors.black, width: 150),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => menuBottomSheetWidget(context),
          child: Icon(Icons.list, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Divider(height: 15, thickness: 0.5, color: Colors.black),
          HomeHeaderWidget(),
          ModalHomeWidget()
        ],
      ),
    );
  }
}
