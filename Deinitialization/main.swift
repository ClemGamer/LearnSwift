// swift會自動釋放資源,但若有需要手動釋放,可以用deinit

/*
簡單的小遊戲說明釋放資源
銀行只有一個,且總金幣量有限共10,000
每個玩家都會從銀行取得金幣或還金幣給銀行
在Player類別定義deinit在玩家實例沒有被參考且釋放資源時
將金幣還給銀行
*/
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print(Bank.coinsInBank)
playerOne = nil
print(Bank.coinsInBank)