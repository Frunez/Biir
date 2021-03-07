# Biir
## Intro
Biir app is a simple application that uses [BreweryDB](https://www.brewerydb.com/)'s API. It features a paginated list of beers. Tapping on one of the beers in the list will display a dedicated view containing more information about the beer.

## Architecture
The App is built using Swift for models and logic, SwiftUI for the UI and [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture) for state management and testing.

## Run
Runs on Xcode using an iPhone simulator. No other prerequisites to build or run

## Test
Tests run on Xcode. No other prerequisites to run tests

## Dependencies
This app uses SPM to manage dependencies.
Dependencies:
- [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture)

## Potential todos
- Improve pagination implementation (i.e. infinite scroll)
- Add alerts and error messaging
- Add more reducer tests
- Improve aesthetics
- Add app logo
- Add splash screen
