let imPerson = true

if imPerson {
    print("true")
}

let imSnake = false

if imSnake {
    print("false")
}

let i = 1
// compile error, swift cannot use other type such as Int as boolean 
// if i {
// }

if i == 1 {
    print("i is 1")
}
