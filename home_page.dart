import 'package:flutter/material.dart';
import 'package:weather2/services/api_services.dart';
import 'package:weather2/widgets/weather_card.dart';

import 'models/model_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController cityNameController = TextEditingController();

  final WeatherServices _weatherServices = WeatherServices();
  String? cityName;
  bool _isLoading = false;
  Weather? _weather;

  
  void getWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weather =
          await _weatherServices.featchWeather(cityNameController.text.trim());
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error loading data")),
      );
      setState(() {
        _isLoading=false;
      });
    }
  }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: _weather != null &&
                    _weather!.description.toLowerCase().contains("rain")
                ? LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.blueGrey,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : _weather != null &&
                        _weather!.description.toLowerCase().contains("clear")
                    ? LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.black12,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : LinearGradient(
                        colors: [
                          Colors.black54,
                          Colors.lightBlueAccent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
         ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Weather App",
                //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: cityNameController,
                  decoration: InputDecoration(
                      hintText: "Enter City",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      )),
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: getWeather,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Text(
                      "Get Weather",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),

                  ),
                ),
                if (_isLoading)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                if (_weather != null) WeatherCard(weather: _weather!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
