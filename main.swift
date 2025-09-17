//  Personal Information
let currentYear = 2025
var firstName: String = "Nursultan"
var lastName: String = "Tolegen"
var birthYear: Int = 2005
var age: Int = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.85
var favoriteEmoji: String = "😎"
var country: String = "Kazakhstan"

// Hobbies and Interests
var hobby: String = "playing football ⚽️"
var numberOfHobbies: Int = 4
var favoriteNumber: Int = 8
var isHobbyCreative: Bool = true
var secondHobby: String = "gaming 🎮"
var favoriteFood: String = "pizza 🍕"

// Future Goals
var futureGoals: String = "In the future, I want to become a successful person 💪, achieve financial independence 💵, and make a positive impact on the world 🌍."


// Life Story Summary
var lifeStory: String = """
My name is \(firstName) \(lastName) \(favoriteEmoji).
I am \(age) years old, born in \(birthYear), and my height is \(height)m.
Am I a student? \(isStudent).
I live in \(country).
My favorite hobby is \(hobby), which is a creative hobby: \(isHobbyCreative).
I also enjoy \(secondHobby).
I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber).
My favorite food is \(favoriteFood).
\(futureGoals)
"""


print(lifeStory)

