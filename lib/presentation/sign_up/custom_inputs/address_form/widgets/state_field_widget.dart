import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/domain/model/user.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class StateFieldWidget extends StatefulWidget {
  const StateFieldWidget({Key? key}) : super(key: key);

  @override
  _StateFieldWidgetState createState() => _StateFieldWidgetState();
}

class _StateFieldWidgetState extends State<StateFieldWidget> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
    listenWhen: (previous, current) => previous.isCepLoading != current.isCepLoading && !current.isCepLoading,
    buildWhen: (previous, current) => previous.isCepLoading != current.isCepLoading && !current.isCepLoading,
      listener: (context, state) {
        setState(() {
          textEditingController.text = context.read<SignUpFormCubit>().user.state;
        });
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('Selecione o estado', style: TextStyles.titles, textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 10,
              ),
               Container(
                 color: Color(0xFF51515E),
                 child: DropdownButtonFormField<String>(
                    items: User.states.map((String value) {
                      return DropdownMenuItem<String>(
                        value: (value),
                        child: Text(value),
                      );
                    }).toList(),
                    style: TextStyles.subtitles.copyWith(color: Colors.grey,),
                    value: context.read<SignUpFormCubit>().user.state,
                    onChanged: (value) => context.read<SignUpFormCubit>().fieldChanged('state', value),
                  ),
               )
            ],
          ),
        );
      },
    );
  }
}
