-- Създаване на таблица за банкови акаунти
CREATE TABLE bank_accounts (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10, 2)
);

-- Вмъкване на данни в таблицата
INSERT INTO bank_accounts VALUES (1, 1000.00);
INSERT INTO bank_accounts VALUES (2, 500.00);

-- Извеждане на началното състояние на акаунтите
SELECT * FROM bank_accounts;

-- Начало на транзакция
START TRANSACTION;

-- Проверка за баланса на първия акаунт преди транзакцията
DECLARE @current_balance DECIMAL(10, 2);
SET @current_balance := (SELECT balance FROM bank_accounts WHERE account_id = 1);

-- Прехвърляне на пари между акаунтите, само ако балансът е достатъчен
IF @current_balance >= 200.00 THEN
    UPDATE bank_accounts SET balance = balance - 200.00 WHERE account_id = 1;
    UPDATE bank_accounts SET balance = balance + 200.00 WHERE account_id = 2;
    COMMIT; -- Потвърждаване на транзакцията при успешно изпълнение
ELSE
    ROLLBACK; -- Отмяна на транзакцията при недостатъчен баланс
END IF;

-- Извеждане на крайното състояние на акаунтите
SELECT * FROM bank_accounts;