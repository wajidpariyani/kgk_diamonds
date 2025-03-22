import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds/routes.dart';

import '../bloc/filter/filter_bloc.dart';
import '../bloc/filter/filter_event.dart';
import '../bloc/filter/filter_state.dart';
import '../components/custom_dropdown.dart';

class FilterPage extends StatelessWidget {
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
              RadioListTile<double>(
                title: Text('0.30 - 0.39'),
                value: 0.30,
                groupValue: state.caratFrom,
                onChanged: (value) {
                  if (value != null) {
                    context.read<FilterBloc>().add(UpdateCarat(value, 0.39));
                    Navigator.pop(context);
                  }
                },
              ),
              RadioListTile<double>(
                title: Text('0.40 - 0.49'),
                value: 0.40,
                groupValue: state.caratFrom,
                onChanged: (value) {
                  if (value != null) {
                    context.read<FilterBloc>().add(UpdateCarat(value, 0.49));
                    Navigator.pop(context);
                  }
                },
              ),
              RadioListTile<double>(
                title: Text('0.50 - 0.99'),
                value: 0.50,
                groupValue: state.caratFrom,
                onChanged: (value) {
                  if (value != null) {
                    context.read<FilterBloc>().add(UpdateCarat(value, 0.99));
                    Navigator.pop(context);
                  }
                },
              ),
              RadioListTile<double>(
                title: Text('1.00 - 1.49'),
                value: 1.00,
                groupValue: state.caratFrom,
                onChanged: (value) {
                  if (value != null) {
                    context.read<FilterBloc>().add(UpdateCarat(value, 1.49));
                    Navigator.pop(context);
                  }
                },
              ),
              RadioListTile<double>(
                title: Text('5.00+'),
                value: 5.00,
                groupValue: state.caratFrom,
                onChanged: (value) {
                  if (value != null) {
                    context.read<FilterBloc>().add(UpdateCarat(value, 5.00));
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
