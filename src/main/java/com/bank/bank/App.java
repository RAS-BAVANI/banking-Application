package com.bank.bank;

import java.util.ArrayList;
import java.util.List;

public class App {

    private int balance = 0;
    private List<String> transactions = new ArrayList<>();

    public void deposit(int amount) {
        if (amount > 0) {
            balance += amount;
            transactions.add("Deposited amount: " + amount);
        }
    }

    public void withdraw(int amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            transactions.add("Withdrawn: " + amount);
        } else {
            transactions.add("Failed Withdrawal: " + amount);
        }
    }

    public int getBalance() {
        return balance;
    }

    public List<String> getTransactions() {
        return transactions;
    }

    public void clearTransactions() {
        transactions.clear();
    }
}