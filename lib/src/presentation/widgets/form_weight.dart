import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:go_router/go_router.dart';

import 'package:weightin/src/presentation/blocs/blocs.dart';

class FormWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ManageWeightCubit manageWeightCubit = context.read<ManageWeightCubit>();
    WeightCubit weightCubit = context.read<WeightCubit>();

    return Form(
      key: manageWeightCubit.formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: manageWeightCubit.weightController,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter a weight value';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              textInputAction: TextInputAction.next,
            ),
            DateTimeField(
              initialValue: DateTime.now(),
              format: DateFormat("dd-MM-yyyy"),
              controller: manageWeightCubit.dateController,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                  context: context,
                  firstDate: DateTime(2010),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime.now(),
                );
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                manageWeightCubit.formKey.currentState!.validate();

                manageWeightCubit.storeData();

                weightCubit.fetchData();
                context.pop(true);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
