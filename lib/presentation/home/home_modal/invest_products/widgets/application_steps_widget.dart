import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class ApplicationStepsWidget extends StatelessWidget {
  const ApplicationStepsWidget({
    Key? key, required this.index, this.steps = '',
  }) : super(key: key);

  final int index;
  final String steps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 40, width: 30, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F5F9),
                  gradient: index == 1 ? TextStyles.gradientColor : null,
                ),  
                child: Center(
                  child: Text('1', style: TextStyles.titles.copyWith(color: Colors.black, fontWeight: FontWeight.w900),),
                ),
              ),
              const SizedBox(height: 10),
              Text('Solicitar', style: TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),                            
          Column(
            children: [
              Container(
                height: 40, width: 30, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F5F9),
                  gradient: index == 2 ? TextStyles.gradientColor : null,
                ),  
                child: Center(
                  child: Text('2', style: TextStyles.titles.copyWith(color: Colors.black, fontWeight: FontWeight.w900),),
                ),
              ),
              const SizedBox(height: 10),
              Text('Assinar', style: TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),  
          Column(
            children: [
              Container(
                height: 40, width: 30, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F5F9),
                  gradient: index == 3 ? TextStyles.gradientColor : null,
                ),  
                child: Center(
                  child: Text('3', style: TextStyles.titles.copyWith(color: Colors.black, fontWeight: FontWeight.w900),),
                ),
              ),
              const SizedBox(height: 10),
              Text('Confirmar', style: TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),  
          Column(
            children: [
              Container(
                height: 40, width: 30, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F5F9),
                  gradient: index == 4 ? TextStyles.gradientColor : null,
                ),  
                child: Center(
                  child: Text('4', style: TextStyles.titles.copyWith(color: Colors.black, fontWeight: FontWeight.w900),),
                ),
              ),
              const SizedBox(height: 10),
              Text('Consultor', style: TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),  
          Column(
            children: [
              Container(
                height: 40, width: 30, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF5F5F9),
                  gradient: index == 5 ? TextStyles.gradientColor : null,
                ),  
                child: Center(
                  child: Text('5', style: TextStyles.titles.copyWith(color: Colors.black, fontWeight: FontWeight.w900),),
                ),
              ),
              const SizedBox(height: 10),
              Text('Concluir', style: TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),  
        ],
      )
    );
  }
}