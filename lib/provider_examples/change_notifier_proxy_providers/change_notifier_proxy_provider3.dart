import 'package:flutter/material.dart';

import '../../consts/github_url.dart';
import '../../models_and_providers//for_change_notifier_proxy_providers/location_provider.dart';
import '../../models_and_providers//for_change_notifier_proxy_providers/theme_settings_provider.dart';
import '../../models_and_providers//for_change_notifier_proxy_providers/weather_provider.dart';
import 'package:provider/provider.dart' as provider;

import '../../widgets/text.dart';

class ChangeNotifierProxyProvider3 extends StatefulWidget {
  final Locale locale;

  const ChangeNotifierProxyProvider3({super.key, required this.locale});

  @override
  State<ChangeNotifierProxyProvider3> createState() =>
      _ChangeNotifierProxyProvider3State();
}

class _ChangeNotifierProxyProvider3State
    extends State<ChangeNotifierProxyProvider3> {
  @override
  Widget build(BuildContext context) {
    return provider.Consumer3<LocationProvider, WeatherProvider,
        ThemeSettingsProvider>(
      builder: (context, locationProvider, weatherProvider,
          themeSettingsProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CommonText(
              text:
                  'I managed the state using three providers. Based on the current location, I fetch weather data, and the picture changes based on the weather data.',
              githubUrl: changeNotifierProxyProvider3Url,
            ),
            ElevatedButton(
              onPressed: () async {
                final locationProvider = provider.Provider.of<LocationProvider>(
                    context,
                    listen: false);
                final weatherProvider = provider.Provider.of<WeatherProvider>(
                    context,
                    listen: false);

                await locationProvider.determinePosition();
                if (locationProvider.currentPosition != null) {
                  await weatherProvider
                      .fetchWeather(locationProvider.currentPosition!);
                  themeSettingsProvider
                      .updateImageBasedOnTemperature(weatherProvider.degrees);
                }
              },
              child: const Text('Get Weather'),
            ),
            Text(locationProvider.currentAddress),
            weatherProvider.degrees == 0.0
                ? Container()
                : Text(weatherProvider.degrees.toString()),
            Image(
              height: 300,
              width: double.infinity,
              image: AssetImage(
                'assets/${themeSettingsProvider.selectedImage}.jpg',
              ),
            ),
          ],
        );
      },
    );
  }
}
