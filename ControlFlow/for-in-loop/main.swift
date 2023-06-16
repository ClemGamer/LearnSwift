for i in 1...5 {

}

let base = 3
let power = 10
let answer = 1
// ignore
for _ in 1...power {
    answer *= 3
}

// closed range
let minutes = 60
for tick in 0..<minutes {
    // exec 60 times
}

// closed range stride
let interval = 5
for tick in stride(from: 0, to: minutes, by: interval) {
    
} // 0, 5, ... , 50, 55

// opened range stride
let hours = 12
let hourInterval = 3
for tick in stride(from: 0, through: hours, by: hourInterval) {

} // 3, 6, 9, 12