import { Account } from "./Account";
import { AccountOption } from "./AccountOption";

export class AccountManager {
    private readonly accounts = new Array<Account>()
    private readonly commonOption: AccountOption

    TryFind(plr: Player){
        for (const account of this.accounts) {
            if (account.GetOwner() === plr) return account
        }
    }

    Find(plr: Player){
        const account = this.TryFind(plr)
        if (!account) error(`Not found account for owner: ${plr}`)
        return account
    }

    FindOrCreate(plr: Player){
        let account = this.TryFind(plr)
        if (account) {
            const newAccount = new Account(plr, this.commonOption)
            this.accounts.push(newAccount)
            account = newAccount
        }
        return account as Account
    }

    Add(plr: Player, count: number){
        this.FindOrCreate(plr).Add(count)
    }

    Sub(plr: Player, count: number){
        this.FindOrCreate(plr).Sub(count)
    }

    Send(sender: Player, target: Player, count: number){
        const senderAccount = this.TryFind(sender) as Account
        if (!sender) return false
        const targetAccount = this.FindOrCreate(target)

        if (senderAccount.CanSub(count)){
            senderAccount.Sub(count)
            targetAccount.Add(count)
            return true
        }

        return false
    }

    constructor(option: AccountOption | undefined){
        this.commonOption = option ? option : {
            CanNegetive: false,
            MaxSize: 10_000,
            StartSum: 0
        }
    }
}