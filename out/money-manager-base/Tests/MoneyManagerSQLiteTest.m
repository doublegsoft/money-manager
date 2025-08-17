/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "DB/MoneyManagerSQLiteDatabase.h"

int main() {
  @autoreleasepool {
    NSError* error;
    MoneyManagerSQLiteDatabase* sqlite = [[MoneyManagerSQLiteDatabase alloc] initWithPath:@"./test.db"];
    error = nil;
    [sqlite createTableFamilyMember:&error];
    if (error != nil) {
      NSLog(@"error: %@", error.localizedDescription);
    }
    error = nil;
    [sqlite createTableAccount:&error];
    if (error != nil) {
      NSLog(@"error: %@", error.localizedDescription);
    }
    error = nil;
    [sqlite createTableBankAccount:&error];
    if (error != nil) {
      NSLog(@"error: %@", error.localizedDescription);
    }
    error = nil;
    [sqlite createTableTransaction:&error];
    if (error != nil) {
      NSLog(@"error: %@", error.localizedDescription);
    }
    error = nil;
    [sqlite createTableTransactionCategory:&error];
    if (error != nil) {
      NSLog(@"error: %@", error.localizedDescription);
    }
    error = nil;
    [sqlite createTableLedgerEntry:&error];
    if (error != nil) {
      NSLog(@"error: %@", error.localizedDescription);
    }
    error = nil;
    [sqlite createTableInvoice:&error];
    if (error != nil) {
      NSLog(@"error: %@", error.localizedDescription);
    }

    /*!
    ** 准备数据
    */    
    FamilyMemberQuery* familyMember = [[FamilyMemberQuery alloc] init];
    familyMember.familyMemberName = @"0";
    familyMember.birthdate = @"0";
    familyMember.nationalId = @"0";
    familyMember.note = @"0";
    familyMember.state = @"0";
    familyMember.modifierId = @"0";
    familyMember.modifierType = @"0";
    familyMember.createdTime = @"0";
    familyMember.lastModifiedTime = @"0";
    AccountQuery* account = [[AccountQuery alloc] init];
    account.accountCode = @"0";
    account.accountName = @"0";
    account.accountType = @"0";
    account.category = @"0";
    account.note = @"0";
    account.state = @"0";
    account.modifierId = @"0";
    account.modifierType = @"0";
    account.createdTime = @"0";
    account.lastModifiedTime = @"0";
    BankAccountQuery* bankAccount = [[BankAccountQuery alloc] init];
    bankAccount.bankAccountName = @"0";
    bankAccount.bankAccountType = @"0";
    bankAccount.accountNumber = @"0";
    bankAccount.balance = @"0";
    bankAccount.currency = @"0";
    bankAccount.effectiveDate = @"0";
    bankAccount.expirationDate = @"0";
    bankAccount.note = @"0";
    bankAccount.state = @"0";
    bankAccount.modifierId = @"0";
    bankAccount.modifierType = @"0";
    bankAccount.createdTime = @"0";
    bankAccount.lastModifiedTime = @"0";
    TransactionQuery* transaction = [[TransactionQuery alloc] init];
    transaction.accountId = @"0";
    transaction.transactionCategoryId = @"0";
    transaction.transactionType = @"0";
    transaction.amount = @"0";
    transaction.description = @"0";
    transaction.transactionDate = @"0";
    TransactionCategoryQuery* transactionCategory = [[TransactionCategoryQuery alloc] init];
    transactionCategory.transactionCategoryName = @"0";
    transactionCategory.transactionCategoryType = @"0";
    transactionCategory.note = @"0";
    transactionCategory.state = @"0";
    transactionCategory.modifierId = @"0";
    transactionCategory.modifierType = @"0";
    transactionCategory.createdTime = @"0";
    transactionCategory.lastModifiedTime = @"0";
    LedgerEntryQuery* ledgerEntry = [[LedgerEntryQuery alloc] init];
    ledgerEntry.accountId = @"0";
    ledgerEntry.transactionId = @"0";
    ledgerEntry.entryDate = @"0";
    ledgerEntry.description = @"0";
    ledgerEntry.creditAmount = @"0";
    ledgerEntry.debitAmount = @"0";
    ledgerEntry.state = @"0";
    ledgerEntry.modifierId = @"0";
    ledgerEntry.modifierType = @"0";
    ledgerEntry.createdTime = @"0";
    ledgerEntry.lastModifiedTime = @"0";
    InvoiceQuery* invoice = [[InvoiceQuery alloc] init];
    invoice.invoiceNumber = @"0";
    invoice.amount = @"0";
    invoice.status = @"0";
    invoice.dueDate = @"0";
    invoice.createdTime = @"0";

    /*!
    ** 插入操作
    */
    error = nil;
    [sqlite insertFamilyMember:familyMember ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite insertAccount:account ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite insertBankAccount:bankAccount ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite insertTransaction:transaction ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite insertTransactionCategory:transactionCategory ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite insertLedgerEntry:ledgerEntry ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite insertInvoice:invoice ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }

    /*!
    ** 更新操作
    */
    error = nil;
    [sqlite updateFamilyMember:familyMember ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite updateAccount:account ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite updateBankAccount:bankAccount ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite updateTransaction:transaction ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite updateTransactionCategory:transactionCategory ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite updateLedgerEntry:ledgerEntry ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite updateInvoice:invoice ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }

    /*!
    ** 删除操作
    */
    error = nil;
    [sqlite deleteFamilyMember:familyMember ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite deleteAccount:account ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite deleteBankAccount:bankAccount ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite deleteTransaction:transaction ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite deleteTransactionCategory:transactionCategory ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite deleteLedgerEntry:ledgerEntry ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
    error = nil;
    [sqlite deleteInvoice:invoice ifError:&error];
    if (error != nil) {
      NSLog(@"error (%ld): %@", error.code, error.localizedDescription);
    }
  } // @autoreleasepool
  return 0;
}
