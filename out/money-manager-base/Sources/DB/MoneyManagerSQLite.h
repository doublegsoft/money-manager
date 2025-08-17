/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "DTO/FamilyMemberQuery.h"
#import "DTO/AccountQuery.h"
#import "DTO/BankAccountQuery.h"
#import "DTO/TransactionQuery.h"
#import "DTO/TransactionCategoryQuery.h"
#import "DTO/LedgerEntryQuery.h"
#import "DTO/InvoiceQuery.h"
#import "DTO/Pagination.h"

@interface MoneyManagerSQLite : NSObject

+ (MoneyManagerSQLite*)sharedInstance;

/*!
** 初始化【money-manager】数据库。
*/
- (instancetype)initWithPath:(NSString*)path;

/*!
** 执行【money-manager】数据库建库脚本。
*/
- (void)installDatabase;

- (void)beginTransaction;

- (void)commit;

- (void)rollback;

/*!
** 插入【家庭成员】数据。
*/
- (void)insertFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error;

/*!
** 更新【家庭成员】数据。
*/
- (void)updateFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error;

/*!
** 删除【家庭成员】数据。
*/
- (void)deleteFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error;

/*!
** 查询【家庭成员】数据。
*/
- (Pagination*)selectFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error;

/*!
** 创建【家庭成员】表结构。
*/
- (void)createTableFamilyMember:(NSError**)error;

/*!
** 插入【账户】数据。
*/
- (void)insertAccount:(AccountQuery*)data ifError:(NSError**)error;

/*!
** 更新【账户】数据。
*/
- (void)updateAccount:(AccountQuery*)data ifError:(NSError**)error;

/*!
** 删除【账户】数据。
*/
- (void)deleteAccount:(AccountQuery*)data ifError:(NSError**)error;

/*!
** 查询【账户】数据。
*/
- (Pagination*)selectAccount:(AccountQuery*)data ifError:(NSError**)error;

/*!
** 创建【账户】表结构。
*/
- (void)createTableAccount:(NSError**)error;

/*!
** 插入【银行账户】数据。
*/
- (void)insertBankAccount:(BankAccountQuery*)data ifError:(NSError**)error;

/*!
** 更新【银行账户】数据。
*/
- (void)updateBankAccount:(BankAccountQuery*)data ifError:(NSError**)error;

/*!
** 删除【银行账户】数据。
*/
- (void)deleteBankAccount:(BankAccountQuery*)data ifError:(NSError**)error;

/*!
** 查询【银行账户】数据。
*/
- (Pagination*)selectBankAccount:(BankAccountQuery*)data ifError:(NSError**)error;

/*!
** 创建【银行账户】表结构。
*/
- (void)createTableBankAccount:(NSError**)error;

/*!
** 插入【交易】数据。
*/
- (void)insertTransaction:(TransactionQuery*)data ifError:(NSError**)error;

/*!
** 更新【交易】数据。
*/
- (void)updateTransaction:(TransactionQuery*)data ifError:(NSError**)error;

/*!
** 删除【交易】数据。
*/
- (void)deleteTransaction:(TransactionQuery*)data ifError:(NSError**)error;

/*!
** 查询【交易】数据。
*/
- (Pagination*)selectTransaction:(TransactionQuery*)data ifError:(NSError**)error;

/*!
** 创建【交易】表结构。
*/
- (void)createTableTransaction:(NSError**)error;

/*!
** 插入【交易类别】数据。
*/
- (void)insertTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error;

/*!
** 更新【交易类别】数据。
*/
- (void)updateTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error;

/*!
** 删除【交易类别】数据。
*/
- (void)deleteTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error;

/*!
** 查询【交易类别】数据。
*/
- (Pagination*)selectTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error;

/*!
** 创建【交易类别】表结构。
*/
- (void)createTableTransactionCategory:(NSError**)error;

/*!
** 插入【记账登记】数据。
*/
- (void)insertLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error;

/*!
** 更新【记账登记】数据。
*/
- (void)updateLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error;

/*!
** 删除【记账登记】数据。
*/
- (void)deleteLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error;

/*!
** 查询【记账登记】数据。
*/
- (Pagination*)selectLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error;

/*!
** 创建【记账登记】表结构。
*/
- (void)createTableLedgerEntry:(NSError**)error;

/*!
** 插入【发票】数据。
*/
- (void)insertInvoice:(InvoiceQuery*)data ifError:(NSError**)error;

/*!
** 更新【发票】数据。
*/
- (void)updateInvoice:(InvoiceQuery*)data ifError:(NSError**)error;

/*!
** 删除【发票】数据。
*/
- (void)deleteInvoice:(InvoiceQuery*)data ifError:(NSError**)error;

/*!
** 查询【发票】数据。
*/
- (Pagination*)selectInvoice:(InvoiceQuery*)data ifError:(NSError**)error;

/*!
** 创建【发票】表结构。
*/
- (void)createTableInvoice:(NSError**)error;
@end
