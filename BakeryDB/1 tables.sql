use BakeryDB
go
drop table if exists Orders
go

create table dbo.Orders(
    OrdersId int not null identity primary key,
    FirstName varchar(30) not null constraint ck_Orders_FirstName_cannot_be_blank check(FirstName <> ''),
    LastName varchar(30) not null constraint ck_Orders_LastName_cannot_be_blank check(LastName <> ''),
    Item varchar(30) not null constraint ck_Orders_Item_cannot_be_blank check(Item <> ''),
    Quantity int not null constraint ck_Orders_Quantity_must_be_greater_than_zero check(Quantity >= 0),
    PricePerUnit decimal(5,2) not null constraint ck_Orders_PricePerUnit_must_be_between_2_dollars_and_50_cents_and_650_dollars check(PricePerUnit between 2.5 and 650),
    TotalCost as Quantity * PricePerUnit,
    DateOrdered date not null constraint ck_DateOrdered_must_be_before_the_current_date check(DateOrdered <= getdate()),
    DateNeeded date not null constraint ck_Orders_DateNeeded_must_be_after_January_1_2023 check(DateNeeded >= '2023-01-01'),
    CreditCardNum char(4) not null,
    CommunicationType varchar(20) not null constraint ck_Orders_CommnicationType_must_be_call_text_mail_or_email check(CommunicationType in ('Call', 'Text', 'Mail', 'Email')),
    PaymentType char(4) not null constraint ck_Orders_PaymentType_must_be_cash_or_card check(PaymentType in ('Cash', 'Card')),
    constraint ck_Orders_DateOrdered_must_be_between_a_week_to_60_days_in_advance_of_DateNeeded check(datediff(day, DateOrdered, DateNeeded) between 7 and 60),
    constraint ck_Orders_CreditCardNum_is_only_numbers_and_PaymentType_is_card_or_CreditCardNum_is_blank_and_PaymentType_is_cash check((CreditCardNum like ('[0-9][0-9][0-9][0-9]') and PaymentType = 'Card') or (CreditCardNum = '' and PaymentType = 'Cash'))
)
go