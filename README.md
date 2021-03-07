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

## Task Steps
This exercise took me ~8 hours to complete in total and was done in the following order:
- Create account and API key on [BreweryDB](https://www.brewerydb.com/)
- Test parameters of the API in browser to see the data and structure
- Create a new empty project in Xcode
- Add Composable Architecture
- Create a simple empty List view
- Create BeerClient to get beer list from API
- Create core components to make request and populate View's state with the response
  - Models to decode json to and narrow reponse to desired fields
  - State to store required data and update UI
  - reducer to action requests and update state
  - Environment to call beer client and pass response back to reducer
- Update the list view to display a list of beer names from response
- Create request on BeerClient to fetch icon from URL to display in list
- Create a new view to display individual beer data/info
- Connect list by making list items tappable to individual view
- Use same image fetch request to get and display larger beer label image
- Display and lay out all desired fields for individual view
- Do a quick clean up for code readability
- Add a test and create mocks as a demo for testing within application
- Write this ReadMe
- Add any remaining missing fields through-out app and tweak layout accordingly
- Double check everything works correctly
- Create short video of app in use
- Finished
 
## Potential todos
- Improve pagination implementation (i.e. infinite scroll)
- Add alerts and error messaging
- Add more tests
- Improve aesthetics
- Add app logo
- Add splash screen
- Replace sandbox key with production key
- Use Environment Variables to hide key from code

## Potential Code Practice Improvements
- Frequent small commits
- Branching
- TDD
- Better naming conventions if/where necessary
- More inline comments if/where necessary
