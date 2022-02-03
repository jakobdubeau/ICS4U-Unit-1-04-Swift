/*
*
* The Microwave program lets the user enter the food they want to heat up and how
* many of the items they want, then gives them the time they need to heat the items up.
*
* @author Jakob
* @version 1.0
* @since 2020-11-26
*
*/
let minGuessValue: Int = 1
let maxGuessValue: Int = 6
let extra: Int = 1

enum MyError: Error {
    case invalidInteger(String)
}

func guessNumber() throws {

    // Random number generator.
    let cMove = Int.random(in: 1..<6+1)
    var runOnce = 0

    print("Pick a number between 1-6: ")
    var guess = readLine()

    if let firstGuessInt = Int(guess!) {
        while firstGuessInt != cMove || runOnce == 0 {

            if let pMove = Int(guess!) {
                runOnce = 1
                if pMove < minGuessValue || pMove > maxGuessValue {
                    print("Your guess won't count.")
                } else if pMove < cMove {
                    print("Too low!")
                } else if pMove > cMove {
                    print("Too high!")
                } else if pMove == cMove {
                    print("You Guessed Correctly!")
                    break
                } else {
                    throw MyError.invalidInteger("Error")
                }
            } else {
                throw MyError.invalidInteger("Error")
            }

            print("Keep guessing")
            guess = readLine()

        }

    } else {

    throw MyError.invalidInteger("Error")

    }
}

do {
    try guessNumber()
} catch {
    print("That was an invalid input")
}
print("\nDone.")
