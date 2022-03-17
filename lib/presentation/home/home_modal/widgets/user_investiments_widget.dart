import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/styles/indicator_cubit.dart';
import 'package:obenx_com_br_app/presentation/common/indicator_widget.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/widgets/months_extracts.dart';
import 'package:obenx_com_br_app/presentation/home/home_modal/widgets/type_of_investor.dart';

class UserInvestimentsWidget extends StatelessWidget {
  UserInvestimentsWidget({
    Key? key,
  }) : super(key: key);

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (_) => IndicatorCubit(),
          child: BlocConsumer<IndicatorCubit, int>(
            listener: (context, state) {},
            builder: (context, state) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        context.read<IndicatorCubit>().updateState(index);
                      },
                      controller: _controller,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            index == 0 
                              ? TypeOfInvestor() 
                              : MonthsExtracts(),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    child: Indicator(
                        controller: _controller,
                        itemCount: 2,
                      ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

