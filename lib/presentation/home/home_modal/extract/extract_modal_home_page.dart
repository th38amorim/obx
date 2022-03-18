import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obx_com_br_app/navigator_utils.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/extract/widgets/extract_details_page.dart';
import 'package:obx_com_br_app/presentation/home/home_overview/widgets/custom_bottomsheet_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class ExtractModalHomePage extends StatelessWidget {
  ExtractModalHomePage({Key? key}) : super(key: key);

  static DateTime now = DateTime.now();
  static List months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
  final currentMonth = now.month;

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
      ),
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Divider(height: 15, thickness: 0.5, color: Colors.black),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 45, 20, 25),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(now.day.toString() + ' de ' + months[(currentMonth - 1)].toString() + ', ' + now.year.toString())),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundDarkColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(50),
                  topRight: const Radius.circular(50),
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text('Extrato', style: TextStyles.titles.copyWith(fontSize: 22)),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Icon(Icons.arrow_back, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 30, 
                            color: Color(0xFF51515E),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.search, color: Colors.white54),
                                  const SizedBox(width: 5),
                                  Text('Buscar por produto ou valor', style: TextStyle(color: Colors.white38),),
                                  Spacer(),
                                  GestureDetector(
                                    // onTap: () => pushToPage(context, InvestFiltersPage()),
                                    child: Icon(Icons.filter_list_rounded, color: Colors.white54),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      }, 
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return index == 0
                        ? GestureDetector(
                          onTap: () => pushToPage(context, ExtractDetailsPage()),
                          child: Container(
                              width: MediaQuery.of(context).size.width, 
                              height: 60, 
                              color: Color(0xFF51515E),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Aporte', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                        Text('Liberado', style: TextStyle(color: Colors.yellow[300]))
                                      ],
                                    ),
                                    Spacer(),
                                    Text('R\$00,00', style: TextStyle(color: Colors.white60)),
                                    const SizedBox(width: 20),
                                    Icon(Icons.cloud_upload_outlined, color: Colors.white60, size: 28,)
                                  ],
                                ),
                              ),
                            ),
                        )
                        : GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: MediaQuery.of(context).size.width, 
                              height: 60, 
                              color: Color(0xFF51515E),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Aporte', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                        Text('Cancelado', style: TextStyle(color: Colors.red[300]))
                                      ],
                                    ),
                                    Spacer(),
                                    Text('R\$00,00', style: TextStyle(color: Colors.white60)),
                                    const SizedBox(width: 20),
                                    Icon(Icons.info_outline_rounded, color: Colors.white60, size: 28,)
                                  ],
                                ),
                              ),
                            ),
                        );
                      }, 
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
