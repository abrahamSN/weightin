import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weightin/models/ModelProvider.dart';

import 'package:weightin/src/presentation/blocs/weight_cubit.dart';

class AddEditWeightScreen extends StatelessWidget {
  const AddEditWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeightCubit weightCubit = context.read<WeightCubit>();

    return Scaffold(
      appBar: _appBar(weightCubit),
      body: BlocListener<WeightCubit, WeightState>(
        listener: (context, state) {
          state.whenOrNull(
            successAction: () {
              weightCubit.isSuccess = true;
              context.pop();
            },

            // error: () {
            //   weightCubit.isSuccess = false;
            // },
          );
        },
        child: Stack(
          children: [
            _widgetFormBuilder(weightCubit),
            _widgetLoadingBuilder(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(WeightCubit weightCubit) {
    return AppBar(
      title: Text(weightCubit.isEdit ? "Edit Data" : "Add Data"),
    );
  }

  Form _widgetFormBuilder(WeightCubit weightCubit) {
    return Form(
      key: weightCubit.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: weightCubit.weightController,
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Enter weight' : null,
              keyboardType: TextInputType.number,
            ),
            DateTimeField(
              format: DateFormat("yyyy-MM-dd"),
              controller: weightCubit.dateController,
              onShowPicker: (context, val) async {
                return await showDatePicker(
                  context: context,
                  initialDate: val ?? DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2100),
                );
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (weightCubit.isEdit) {
                    weightCubit.editData();
                  } else {
                    weightCubit.addData();
                  }
                },
              ),
            ),
            weightCubit.isEdit
                ? SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      child: const Text(
                        'Delete',
                      ),
                      onPressed: () {
                        weightCubit.deleteData();
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _widgetLoadingBuilder() {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (_, state) {
        return state.when(
          initialAction: () {
            return Container();
          },
          initial: () {
            return Container();
          },
          loading: () {
            return Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          loaded: (val) {
            return Container();
          },
          error: (err) {
            return Container();
          },
          successAction: () {
            return Container();
          },
        );
      },
    );
  }
}
