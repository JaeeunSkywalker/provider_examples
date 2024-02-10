double convertKelvinToCelsius(double kelvin) {
  double celsiusTemp = kelvin - 273.15;
  double formattedTemp = double.parse(celsiusTemp.toStringAsFixed(2));

  return formattedTemp;
}
