let character1: Character = "a"
print(character1)

// let character2: Character = "ab" // error, Character can only hold one character

print("Create string from character array")
let characters: [Character] = ["a", "b", "c"]
let text = String(characters)
print(text)

print("use indices to access character in string can prevent out of bound error")
for i in text.indices {
    print(text[i])
}

