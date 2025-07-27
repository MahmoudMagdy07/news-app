import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'home_screen.dart';

class CountrySelectionScreen extends StatelessWidget {
  const CountrySelectionScreen({super.key});

  final List<String> countries = const [
    'us', 'eg', 'gb', 'de', 'fr', 'jp', 'cn'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final countryCode = countries[index];
          return ListTile(
            title: Text(countryCode.toUpperCase()),
            onTap: () {
              context.read<NewsCubit>().setCountry(countryCode);
              context.read<NewsCubit>().fetchNews('business');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          );
        },
      ),
    );
  }
}