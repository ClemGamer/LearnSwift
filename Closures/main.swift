// Closures are reference types
/* closure expression syntax
{ (<#parameters#>) -> <#return type#> in
   <#statements#>
}
*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in 
    return s1 > s2
})
print(reversedNames)

// shorten
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
// shorten if single expression in closure
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
// shorthand argument names
// 可以用index代替參數名稱
reversedNames = names.sorted(by: { $0 > $1 })
// 當只需要operator而且只有兩個參數時,可以再簡化剩operator
reversedNames = names.sorted(by: >)

// closure trailing
// 當closure是函數的最後一個參數時,可以把{}寫在呼叫函數後面
reversedNames = names.sorted() { $0 > $1 }
// 當closure是函數的最後一個參數,且函數只有closure這個參數,可以再簡化把()拿掉
reversedNames = names.sorted { $0 > $1 }

// 原文：A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns
// 如果一個closure要再被傳出函數使用,要用@escaping
var completionHandlers: [()->void] = []
func functionWithEscapingClosure(completionHandler: @escaping ()->Void) {
    completionHandlers.append(completionHandler) // closure被放進func外的陣列
}

// @autoclosure可以將傳入參數自動轉換成closure,但會降低易讀性
var customersInLine: [String] =  ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))