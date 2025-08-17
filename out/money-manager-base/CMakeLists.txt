cmake_minimum_required(VERSION 3.10)

project(money-manager C CXX)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-shadow-ivar -Wno-nonnull ")

##
## include_directories
##
include_directories(
  "./include"
)

##
## link_directories
##
set(MONEY-MANAGER_SOURCES
  "Sources/SQL/MoneyManagerSQL.m"
  "Sources/SQL/MoneyManagerTableResult.m"
  "Sources/SQL/FamilyMemberQuery.m"
  "Sources/SQL/AccountQuery.m"
  "Sources/SQL/BankAccountQuery.m"
  "Sources/SQL/TransactionQuery.m"
  "Sources/SQL/TransactionCategoryQuery.m"
  "Sources/SQL/LedgerEntryQuery.m"
  "Sources/SQL/InvoiceQuery.m"
)

add_library(money-manager STATIC ${MONEY-MANAGER_SOURCES})
add_library(money-manager_shared SHARED ${MONEY-MANAGER_SOURCES})
set_target_properties(money-manager_shared PROPERTIES OUTPUT_NAME money-manager)

target_link_libraries(money-manager PRIVATE
  "-framework foundation"
)

target_link_libraries(money-manager_shared PRIVATE
  "-framework foundation"
)
