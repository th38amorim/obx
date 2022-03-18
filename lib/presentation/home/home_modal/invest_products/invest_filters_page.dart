import 'package:flutter/material.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/invest_products/widgets/order_by_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/invest_products/widgets/risks_filters_widget.dart';
import 'package:obx_com_br_app/presentation/home/home_modal/invest_products/widgets/sliders_filters_widget.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class InvestFiltersPage extends StatefulWidget {
  const InvestFiltersPage({ Key? key }) : super(key: key);

  @override
  _InvestFiltersPageState createState() => _InvestFiltersPageState();
}

class _InvestFiltersPageState extends State<InvestFiltersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDarkColor,
      appBar: AppBar(
        leading: Icon(Icons.close),
        title: Text('Filtros'),
        centerTitle: true,
        backgroundColor: backgroundDarkColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Ordernar por', style: TextStyles.titles.copyWith(fontSize: 20)),
              const SizedBox(height: 20),
              OrderByWidget(),
              const SizedBox(height: 20),
              Text('Filtar por', style: TextStyles.titles.copyWith(fontSize: 20)),
              const SizedBox(height: 10),
              Text('Risco', style: TextStyles.titles.copyWith(fontSize: 20)),
              const SizedBox(height: 20),
              RisksFiltersWidget(),
              SlidersFiltersWidget(),
              const SizedBox(height: 50),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    gradient: TextStyles.gradientColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextStyles.buttonStyle,
                    child: Text('Ver Resultado', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

