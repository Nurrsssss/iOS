
// Problem 1: FizzBuzz
// Prints numbers 1 to 100, replacing multiples of 3 with "Fizz",
// multiples of 5 with "Buzz", and multiples of both with "FizzBuzz".

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}
// Problem 2: Prime Numbers
// Checks if a number is prime and prints all primes between 1 and 100.

func isPrime(_ number: Int) -> Bool {
    if number <= 1 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

// Print primes between 1 and 100
for num in 1...100 {
    if isPrime(num) {
        print(num)
    }
}
// Problem 3: Temperature Converter
// Converts temperatures between Celsius, Fahrenheit, and Kelvin.

import Foundation

func celsiusToFahrenheit(_ c: Double) -> Double { return (c * 9/5) + 32 }
func celsiusToKelvin(_ c: Double) -> Double { return c + 273.15 }
func fahrenheitToCelsius(_ f: Double) -> Double { return (f - 32) * 5/9 }
func fahrenheitToKelvin(_ f: Double) -> Double { return (f - 32) * 5/9 + 273.15 }
func kelvinToCelsius(_ k: Double) -> Double { return k - 273.15 }
func kelvinToFahrenheit(_ k: Double) -> Double { return (k - 273.15) * 9/5 + 32 }

print("Enter temperature value:")
if let input = readLine(), let temp = Double(input) {
    print("Enter unit (C/F/K):")
    if let unit = readLine()?.uppercased() {
        switch unit {
        case "C":
            print("Fahrenheit: \(celsiusToFahrenheit(temp))")
            print("Kelvin: \(celsiusToKelvin(temp))")
        case "F":
            print("Celsius: \(fahrenheitToCelsius(temp))")
            print("Kelvin: \(fahrenheitToKelvin(temp))")
        case "K":
            print("Celsius: \(kelvinToCelsius(temp))")
            print("Fahrenheit: \(kelvinToFahrenheit(temp))")
        default:
            print("Invalid unit.")
        }
    }
}
// Problem 4: Shopping List Manager
// Simple menu-driven shopping list using an array.

import Foundation

var shoppingList: [String] = []
var running = true

while running {
    print("\nShopping List Menu:")
    print("1. Add item")
    print("2. Remove item")
    print("3. View list")
    print("4. Exit")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter item to add:")
            if let item = readLine() {
                shoppingList.append(item)
                print("\(item) added.")
            }
        case "2":
            print("Enter item to remove:")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index)
                print("\(item) removed.")
            } else {
                print("Item not found.")
            }
        case "3":
            print("Current List: \(shoppingList)")
        case "4":
            running = false
        default:
            print("Invalid choice.")
        }
    }
}
// Problem 5: Word Frequency Counter
// Counts frequency of each word in a sentence.

import Foundation

print("Enter a sentence:")
if let input = readLine() {
    let words = input.lowercased()
        .components(separatedBy: CharacterSet.alphanumerics.inverted)
        .filter { !$0.isEmpty }
    
    var frequency: [String: Int] = [:]
    
    for word in words {
        frequency[word, default: 0] += 1
    }
    
    for (word, count) in frequency {
        print("\(word): \(count)")
    }
}
// Problem 6: Fibonacci Sequence
// Returns first n Fibonacci numbers as an array.

func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }
    if n == 1 { return [0] }
    if n == 2 { return [0, 1] }
    
    var sequence = [0, 1]
    for i in 2..<n {
        sequence.append(sequence[i-1] + sequence[i-2])
    }
    return sequence
}

// Example usage:
print(fibonacci(10))
// Problem 7: Grade Calculator
// Stores student names and scores, calculates average, min, max, and compares.

let students: [String: Int] = [
    "Alice": 85,
    "Bob": 70,
    "Charlie": 95,
    "Diana": 60
]

let scores = Array(students.values)
let average = Double(scores.reduce(0, +)) / Double(scores.count)
let maxScore = scores.max() ?? 0
let minScore = scores.min() ?? 0

print("Average Score: \(average)")
print("Highest Score: \(maxScore)")
print("Lowest Score: \(minScore)")

for (name, score) in students {
    let status = Double(score) >= average ? "above" : "below"
    print("\(name): \(score) (\(status) average)")
}
// Problem 8: Palindrome Checker
// Ignores spaces, punctuation, and case.

import Foundation

func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return cleaned == String(cleaned.reversed())
}

// Example usage:
print(isPalindrome("A man, a plan, a canal: Panama")) // true
print(isPalindrome("Hello")) // false
// Problem 9: Simple Calculator
// Performs addition, subtraction, multiplication, division.

import Foundation

func add(_ a: Double, _ b: Double) -> Double { a + b }
func subtract(_ a: Double, _ b: Double) -> Double { a - b }
func multiply(_ a: Double, _ b: Double) -> Double { a * b }
func divide(_ a: Double, _ b: Double) -> Double? { b == 0 ? nil : a / b }

var running = true
while running {
    print("Enter first number:")
    guard let input1 = readLine(), let num1 = Double(input1) else { continue }
    
    print("Enter second number:")
    guard let input2 = readLine(), let num2 = Double(input2) else { continue }
    
    print("Choose operation (+, -, *, /):")
    if let op = readLine() {
        switch op {
        case "+":
            print("Result: \(add(num1, num2))")
        case "-":
            print("Result: \(subtract(num1, num2))")
        case "*":
            print("Result: \(multiply(num1, num2))")
        case "/":
            if let result = divide(num1, num2) {
                print("Result: \(result)")
            } else {
                print("Error: Division by zero")
            }
        default:
            print("Invalid operation")
        }
    }
    
    print("Do another calculation? (y/n)")
    if let choice = readLine(), choice.lowercased() != "y" {
        running = false
    }
}
// Problem 10: Unique Characters
// Checks if all characters in a string are unique.

func hasUniqueCharacters(_ text: String) -> Bool {
    var seen: Set<Character> = []
    for char in text {
        if seen.contains(char) {
            return false
        }
        seen.insert(char)
    }
    return true
}

// Example usage:
print(hasUniqueCharacters("Swift"))  // true
print(hasUniqueCharacters("Hello"))  // false
