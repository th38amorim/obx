import 'package:flutter/material.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class PersonalDataWidget extends StatelessWidget {
  const PersonalDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  Text('Meus dados', style: TextStyles.subtitlePrimaryColor),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      color: Colors.white,
                      height: 0.5,
                      width: 180,
                    ),
                  ),
                  Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total investido', style: TextStyle(color: Colors.grey)),
                  Text('R\$ ******', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Valores em trânsito', style: TextStyle(color: Colors.grey)),
                  Text('R\$ ******', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF27262B),
            child: Padding(
              padding: EdgeInsets.fromLTRB(7, 10, 8, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Patrimônio total', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  Text('R\$ ******', style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
          ),
      ],
    );
  }
}