# Coding test for Fresho
> Code Test for Fresho

## Installation Instructions
1.  Clone the repository [Fresho](https://github.com/Kangb0tmang/fresho).
2.  Install the gems as detailed below.
3.  Run the tests if desired in tests folder `cd./tests` and run `ruby invoice_test.rb`.
4.  `cd ./invoicing` and run `ruby invoice.rb`.

### Required Gems for testing
-   Minitest `gem install minitest`.
-   Minitest Reporters `gem install minitest-reporters`.

## Troubleshooting
-   Ensure you have an up to date/or recent version of ruby.
-   Ensure the minitest gems are installed.

## Usage Instructions
1.  Run the tests if desired in tests folder `cd./tests` and run `ruby invoice_test.rb`.
2.  `cd ./invoicing` and run `ruby invoice.rb`.
3.  You will be prompted in the terminal how much fruit to purhcase.
4.  Once satisfactory amount of fruits has been provided, the amounts will be calculated and invoice generated.

## Approach and Conceptual Overview
-   I imagined that the user will be prompted to provide how much fruit they want, so I went with using prompts instead of a basic html interface.
-   I coded the methods for 1 fruit. I tried adding a second fruit and ran into some issues and noticed duplicate code on multiple occassions. I tried to refactor it to use 1 method for whatever fruit or item the user wants instead of 1 method for each item - which wouldn't scale well.

## Technologies Used
-   Ruby (with Minitest gems).
-   If I created a UI, I would've used Material Design Lite for quick prototyping (instead of something like bootstrap - just personal preference)

## Assumptions
-   Only user input is how many items (fruit) they wish to order.
-   Assumed the quantities and prices wouldn't change (but it will definitely change in a real life situation based on seasonal produce, supply and demand etc.).
-   If required to change items and prices, I would've added the UI for the user input as well.
-   Didn't focus on a UI since the requirement didn't expect a UI.

## Design Decision and Additional Features
-   Used Ruby since the requirements were to use testing and Ruby already had testing capabilities and I had used it a bit before.
-   Decided to use prompts and generating the invoice in the terminal since there wasn't much emphasis on the presentation aspect.
-   If I had to build a basic user interface, it would be 3 input boxes and a calculate/generate invoice button which will generate the invoice below the form. I would also have a section with the prices next to the form as a reference for the user instead of prompts to provide the minimum satisfactory amount of fruits.
-   If user entered incorrect/wrong number or not a number, they will be prompted to try again until they get it correct - instead of throwing an error or returning 0. If there was a UI, basic form validation would have worked well.

## Lessons Learnt and Further Improvements
-   I couldn't quite work out how to find the optimal packages that the user requested and as a result I ended up with remainders - although it selected the largest package first since it was the cheapest. Improvement is to refactor the code to have no remainders so the customer gets the full amount they requested.
-   Would've liked to refactor the calculation method of each fruit as there was a bit of code repetition. Improvement is to have 1 method that determines what fruit is being requested and calculate accordingly.
-   I don't think I wrote quite enough tests, since they were only based on the initial input (whether they meet the minimum number required or if its a number). Could have written some tests on the calculation logic as well.
-   If this app was scaled and had more items and fruits, the calculation method would have many more instances of duplicate code, so before adding more items, refactoring that method should be the main priority.
-   Write more tests - it doesn't really hurt to do so!
