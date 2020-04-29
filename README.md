# OpenbankMobileTest

Marvel characters in `Swift`, technical test for **OpenBank**.

*The practice was carried out on 28-Apr-2020 (Approximately 9 hours)

===================

The creation of the structure of an app is requested that shows a list of the Marvel characters and allows you to see the detail of each of them individually.

Makes use of the Marvel API (​https://developer.marvel.com/docs​)

Functionality:

1. List the characters'list
2. Navigate to the detail of a specific character


## Requirements ##

* Xcode 11.2
* iOS 12.0 +
* Swift 5
* CocoaPods


## Used libraries ##

- Alamofire: facilitates communication with APIs/webservices [https://github.com/Alamofire/Alamofire]

- CryptoSwift: facilitates encryption, it is used when creating the hash for the Marvel API [https://github.com/krzyzanowskim/CryptoSwift]

- SDWebImage: Provides a cache system for images [https://github.com/SDWebImage/SDWebImage]


## Architecture ##

This app uses the VIPER architecture, divided into two modules HomeView and DetailView.

I have chosen this architecture to apply SOLID principles, decouple the code to facilitate test application and improve product scalability. (Among other advantages)

For the parsing of the JSON returned by the Marvel API I have used Codable, it is an improvement of iOS 11 when serializing instances.

I have used CocoaPods as a dependency manager


## Note ##

Due to lack of time I have left the following to improve:

* Heroes listing pagination
* More information when accessing the Hero detail
* More testunits coverage
* Add a Hero finder
* Creation of custom errors and a good implementation of them.
* In the Hero's profile add a error control at least as how I included it in the list.

In summary, there is a lot to add, but I think that what I have added can give an overview of the practice.

I have only added a unit test to verify the get/set of an entity and I have checked connection errors and parsed in the HomeView when accessing the API, with an alertview to make requests to the service again.


## How to install

* Clone or download the project to your machine.
* At the project directory run: ```pod install```. (You need to install cocoapods [https://cocoapods.org/])
* Open XCode11.2 and build the project using: ```Cmd```+ ```Shift``` + ```B```.
* Build the project for testing using: ```Cmd```+ ```Shift```+ ```U```.
* Run the tests using: ```Cmd``` + ```U```


## Author ##

* Francisco José Navarro García <fran@atalayasoft.com>
* CV Summary: https://www.atalayasoft.com/cv-spain/
* Linkedin: *[https://www.linkedin.com/in/fjnavarrogarcia](https://www.linkedin.com/in/fjnavarrogarcia)*
