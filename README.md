# Simple Weather App

A lightweight weather app built in Bash that fetches the current weather for your location using an API and displays it in a user-friendly format. 

---
## Features
- Current temperature, humidity, and precipitation information.
- User-friendly output with details tailored for a smooth experience.
- Simple setup and easy to customize.

## Demo 
[![Watch the demo](https://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](https://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)
> *Click the image above to watch the demo on YouTube.*

## Project Screenshots 

### Home Screen
![Home Screen](images/home_screen.png)

### Weather Details Output
![Weather Details](images/weather_output.png)

## Prerequisites
- Bash (pre-installed on most Linux distributions)
- `curl` (for making API requests)
- Weather API key from Tomorrow.io
- Google Cloud Geocoding API

## How to Use 🛠️
1. Clone the repository:
    ```bash
    git clone https://github.com/TanmayMahato/wxsh
    cd wxsh
    ```

2. Make the script executable:
    ```bash
    chmod +x wxsh.sh
    ```

3. Run the script:
    ```bash
    ./wxsh.sh
    ```

4. Enter your both the API key in the **var.env** file


## Adding the Script to Your PATH 🛣️

To make the `weather.sh` script accessible from anywhere in your terminal, follow these steps:

1. Move the script to a directory in your PATH, like `/usr/local/bin`:
    ```bash
    sudo mv weather.sh /usr/local/bin/weather
    ```

2. Ensure the script is executable:
    ```bash
    sudo chmod +x /usr/local/bin/weather
    ```

3. Now you can run the weather script from anywhere:
    ```bash
    weather
    ```

4. (Optional) If you want to add your API key permanently to avoid repeated prompts, edit the script and add your key in the relevant section.

---

## License 📜
This project is licensed under the MIT License.

---

Happy coding! 🌐
