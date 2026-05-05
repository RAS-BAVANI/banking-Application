package com.bank.bank;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AppTest {

    App app = new App();

    @Test
    public void testDeposit() {
        app.deposit(100);
        assertEquals(100, app.getBalance());
    }

    @Test
    public void testWithdraw() {
        app.deposit(100);
        app.withdraw(50);
        assertEquals(50, app.getBalance());
    }

    @Test
    public void testFailedWithdraw() {
        app.withdraw(100);
        assertEquals(0, app.getBalance());
    }

    @Test
    public void testClearTransactions() {
        app.deposit(100);
        app.clearTransactions();
        assertEquals(0, app.getTransactions().size());
    }
}