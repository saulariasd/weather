import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/providers/weather_repository_provider.dart';

class WeatherForm extends StatefulWidget {
  const WeatherForm({
    super.key,
  });

  @override
  State<WeatherForm> createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  String city = '';
  final formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: _controller,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: 'Ciudad o lat y lng',
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onChanged: (value) {
          setState(() {
            city = value;
          });
        },
        onSaved: (value) {
          setState(() {
            city = value!;
          });
        },
        validator: (value) => value!.isEmpty
            ? 'Por favor ingresa una ciudad o una lat y lng'
            : null,
        onEditingComplete: () async {
          FocusScope.of(context).unfocus();
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            final weatherProvider = context.read<WeatherRepositoryProvider>();
            weatherProvider.error = '';
            weatherProvider.isLoading = true;
            await weatherProvider.getWeather(city: city);
            weatherProvider.isLoading = false;
            _controller.clear();
          }
        },
      ),
    );
  }
}
