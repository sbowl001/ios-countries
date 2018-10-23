# Countries

## Introduction

The goal of this project is to build an application that uses the [REST Countries](https://restcountries.eu) API to fetch and display information about countries of the world. This app will be for both iPhone and iPad, with their own unique layout using Size Classes.

## Instructions

Please fork and clone this repository. There is no starter project, but there is a folder with each country's flag. The URL from the JSON you will use returns them as an SVG so it is a bit more involved to show the images than if they were in JPEG or PNG format. Commit regularly as you complete the requirements in this project.

**As you design the UI for this project, it must be done using size classes and trait variations. The layout between the iPad app and iPhone app must be different**. Try to make a visually appealing layout that takes advantage of each device's size.

1. Familiarize yourself with the [REST Countries](https://restcountries.eu) API. For this project, you will use the "Name" endpoint. Here is [an example request](https://restcountries.eu/rest/v2/name/ar) and the JSON it returns. Familiarize yourself with it as well.
2. Create a new Xcode project. Add the flags in the provided "Flags" folder to the project's assets folder.
3. Create a model object that represents a country. It should have properties for **at least** the country's:
    - Name
    - Region
    - Capital
    - Population
    - Currencies
    - Languages
    - Flag

You are welcome to add more information from the JSON to the model if you want.

3. Create UI that allows the user to search for a country using a search bar. The results should then be displayed in a list (whether in a table view or a collection view is your choice)
4. Create a detail view controller that shows all of the selected country's properties.

**Make sure to test your app thoroughly.** 

## Go Further

1. Add a map view to the detail view controller whose region is set to the selected country. **Note:** you will have to update your model object so it pulls the latitude and longitude for each country from the JSON. 
