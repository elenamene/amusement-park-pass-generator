# Amusement Park Pass Generator (part 1)

## iOS Techdegree Project 4

For this project, you’ll create a system for creating and validating access passes to an amusement park.
There are three types of people who can be granted access to the park: employees, vendors, and of course, guests.
As you can imagine, these different groups are allowed to enter different areas of the park, and may or may not be permitted to do certain things, like ride the rides or receive discounts in certain eateries and shops, for example.
Within each category of park access, there should be several sub-categories with varying access rights.
For example, guests can be “Classic”, “VIP”, or “Free Child”, with different privileges associated with each.
The app you are creating would utilized by the staff of the amusement park at the entrance gates, inside their kiosk.
Actual entrants wouldn’t see the screen. They will tell the staff their relevant information and staff members would type it on the iPad screen and generate the passes. The access levels of the passes will then be tested by simulated “swiping’ on the iPad. 


### Required Tasks

1. Create the required data structures and related class/structs/protocols and enums required by the app.

2. Create initializer methods for the classes or structs. These initializer methods will be used for the creation of test objects and test cases as outlined in the next step.

3. Create a set of possible (such as missing birthday, missing first/last name) and informative errors (such as the name of the object that caused the error, and the details of the error). Make sure they can be thrown at appropriate situations (e.g, when personal information is not complete). 

4. Create at least one swipe+ method (or more if you prefer to have different swipe methods for rides, registers, restricted areas) which can assess an entrants right to access areas within the park, ride rides, skip ride lines, or receive discounts and shops and eateries.

5. Create a set of test cases (plug values) for each valid entrant type, and include related actions they can perform (one example is to create a VIP entrant, and have him/her swipe to get into different part of the park, and try to get discounts, etc).

### Extra Credit

1. When processing a swipe (or part of the swipe processing flow) polymorphic methods are being implemented, such that a method is able to handle (or to be applied to) multiple entrant or pass types

2. Add a feature to the swipe method(s), so that when an entrant swipes on their birthday, they receive a personalized message, if their birthday is known.

3. Add a feature to prevent a guest from swiping into the same ride twice in row within 5 seconds at the same checkpoint. This is to prevent someone from sneaking in a second person. Rejecting an entrant’s second swipe should be done gracefully with an alert message.
