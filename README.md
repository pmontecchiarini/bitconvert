# Bitconverter App

The Bitconverter app allows you to get current conversion rates for different bitcoins in the currency of your choice.

Video demo: https://youtu.be/Ni2OYoGimhA


## Getting Started

To run the app you can clone the repo and click Get Packages button in your IDE.

Then you can run the command 
```
flutter run
```
In your terminal window. 
Remember to select the device for output if you want to run the project on an emulator or the browser if you wish to run the web version.

### Details

The structure of the app is simple and it is organized in the following folders:

 - *screens* folder where you will find the welcome screen which contains the app's logo and title and the switch button to select dark o light mode.
The price screen is where you will find the layout and widgets to select currency and display the convertion.

- *services* folder contains the network file which connects to the API and fetches the data, depending on the currency selected by the user. The API keys are stored in variables from the .env file.

- *utilities* is where the coin information was stored on a list, as well as the theme data in order for the app to pass down that information to other widgets.

- *widgets* contains a custom widget created for the project which is the currency card where the results are displayed. 

*Notes:* 
1. the flutterenv package was used in order to create the global .env file which keeps the API key variables. This file is not shared for security reasons, however an .envexample is provided so you can use your key generated in the API website.
2. The main.dart file is the entry point to the application and creates the routes between the screens.
3. Flutter's Provider was used to manage the state across the application.   




*Disclaimer: This application is meant to be educational, and to explore some of the possibilities Flutter has to offer.*

Enjoy!





