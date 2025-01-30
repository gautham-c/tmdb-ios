# TMDB iOS Application

This project is an iOS application that interfaces with [The Movie Database (TMDb) API](https://www.themoviedb.org) to display popular movies and detailed information about each movie.

## Features

- **Now Playing Tab**: Displays movies currently playing in theaters.
- **Saved Movies Tab**: Allows users to save their favorite movies for quick access.
- **Movie Detail View**: Provides detailed information about selected movies, including cast, crew, and synopsis.
- **Offline Access**: The app caches data using Core Data, enabling offline access to previously viewed content.
- **Image Caching**: Utilizes the Nuke library for efficient image fetching and caching.

## Technical Specifications

- **Language**: Swift
- **Architecture**: Model-View-ViewModel (MVVM)
- **Networking**: URLSession
- **Database**: Core Data
- **Image Loading**: Nuke

## Requirements

- Xcode 11 or later
- iOS 13.0 or later
- A valid [TMDb API Key](https://www.themoviedb.org/documentation/api)

## Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/gautham-c/tmdb-ios.git
   cd tmdb-ios
   ```
2. **Open the Project**:
   ```bash
   open TMDB.xcodeproj
   ```
3. **Configure API Key**:
   - Locate the `APIManager.swift` file.
   - Replace `YOUR_API_KEY` with your actual TMDb API key.
4. **Build and Run**:
   - Select your target device or simulator.
   - Press the 'Run' button in Xcode.

## Usage

- **Navigating Movies**: Browse through the 'Now Playing' tab to see current movies.
- **Saving Favorites**: Tap the 'Save' button on a movie detail page to add it to your 'Saved Movies' list.
- **Offline Viewing**: Access your saved movies and previously viewed content without an internet connection.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [The Movie Database (TMDb)](https://www.themoviedb.org) for providing the API.
- [Nuke](https://github.com/kean/Nuke) for efficient image loading and caching.

