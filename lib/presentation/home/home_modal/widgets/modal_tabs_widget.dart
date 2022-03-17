import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/navigator_utils.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/extract/extract_modal_home_page.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/invest_products/invest_products_modal_home_page.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/my_portfolio/my_portfolio_modal_home_page.dart';

class ModalTabsWidget extends StatelessWidget {
  const ModalTabsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => pushToPage(context, MyPortfolioModalHomePage()),
            child: Container(
              child: Image.asset('assets/portfolio.png'),
              height: 95,
              width: 75,
            ),
          ),
          GestureDetector(
            onTap: () => pushToPage(context, InvestProductsModalHomePage()),
            child: Container(
              child: Image.asset('assets/investments.png'),
              height: 95,
              width: 75,
            ),
          ),
          GestureDetector(
            onTap: () => pushToPage(context, ExtractModalHomePage()),
            child: Container(
              child: Image.asset('assets/extract.png'),
              height: 95,
              width: 75,
            ),
          ),
        ],
      ),
    );
  }
}
