import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds/routes.dart';

import '../bloc/filter/filter_bloc.dart';
import '../bloc/filter/filter_event.dart';
import '../bloc/filter/filter_state.dart';
import '../components/custom_dropdown.dart';

class FilterPage extends StatelessWidget {
  final List<Map<String, double>> caratRanges = [
    {'0.30 - 0.39': 0.30},
    {'0.40 - 0.49': 0.40},
    {'0.50 - 0.59': 0.50},
    {'0.60 - 0.69': 0.60},
    {'0.70 - 0.79': 0.70},
    {'0.80 - 0.89': 0.80},
    {'0.90 - 0.99': 0.90},
    {'1.00 - 1.49': 1.00},
    {'1.50 - 1.99': 1.50},
    {'2.00 - 2.99': 2.00},
    {'3.00 - 3.99': 3.00},
    {'4.00 - 4.99': 4.00},
    {'5.00+': 5.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter Diamonds'), actions: [
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
          Navigator.pushNamed(context, AppRoutes.cartPage);
        },)
      ],),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showCaratRangeBottomSheet(context, state);
                  },
                  child: Text('Select Carat Range'),
                ),
                SizedBox(height: 16),

                CustomDropdown<String>(
                  title: "Lab",
                  items: ['GIA', 'IGI', 'HRD'],
                  value: state.lab.isNotEmpty ? state.lab : null,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<FilterBloc>().add(UpdateLab(value));
                    }
                  },
                ),

                SizedBox(height: 16),

                CustomDropdown<String>(
                  title: "Shape",
                  items: ['BR', 'CM', 'EU', 'OV'],
                  value: state.shape.isNotEmpty ? state.shape : null,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<FilterBloc>().add(UpdateShape(value));
                    }
                  },
                ),

                SizedBox(height: 16),

                CustomDropdown<String>(
                  title: "Color",
                  items: ['D', 'E', 'F', 'G'],
                  value: state.color.isNotEmpty ? state.color : null,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<FilterBloc>().add(UpdateColor(value));
                    }
                  },
                ),

                SizedBox(height: 16),

                CustomDropdown<String>(
                  title: "Clarity",
                  items: ['FL', 'VVS1', 'VVS2', 'VS1'],
                  value: state.clarity.isNotEmpty ? state.clarity : null,
                  onChanged: (value) {
                    if (value != null) {
                      context.read<FilterBloc>().add(UpdateClarity(value));
                    }
                  },
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    context.read<FilterBloc>().add(ApplyFilters());
                    Navigator.pushNamed(context, AppRoutes.resultPage);
                  },
                  child: Text('Search'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showCaratRangeBottomSheet(BuildContext context, FilterState state) {

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Carat Range',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: caratRanges.length,
                  itemBuilder: (context, index) {
                    final range = caratRanges[index].keys.first;
                    final value = caratRanges[index][range]!;

                    return RadioListTile<double>(
                      title: Text(range),
                      value: value,
                      groupValue: state.caratFrom,
                      onChanged: (selectedValue) {
                        if (selectedValue != null) {
                          double upperLimit = index < 7
                              ? selectedValue + 0.09
                              : index < caratRanges.length - 1
                              ? selectedValue + 0.99
                              : selectedValue;

                          context
                              .read<FilterBloc>()
                              .add(UpdateCarat(selectedValue, upperLimit));
                          Navigator.pop(context);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
