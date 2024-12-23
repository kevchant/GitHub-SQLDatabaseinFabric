CREATE TABLE [SalesLT].[SalesOrderHeader] (
    [SalesOrderID]           INT              CONSTRAINT [DF_SalesOrderHeader_OrderID] DEFAULT (NEXT VALUE FOR [SalesLT].[SalesOrderNumber]) NOT NULL,
    [RevisionNumber]         TINYINT          CONSTRAINT [DF_SalesOrderHeader_RevisionNumber] DEFAULT ((0)) NOT NULL,
    [OrderDate]              DATETIME         CONSTRAINT [DF_SalesOrderHeader_OrderDate] DEFAULT (getdate()) NOT NULL,
    [DueDate]                DATETIME         NOT NULL,
    [ShipDate]               DATETIME         NULL,
    [Status]                 TINYINT          CONSTRAINT [DF_SalesOrderHeader_Status] DEFAULT ((1)) NOT NULL,
    [OnlineOrderFlag]        BIT              CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag] DEFAULT ((1)) NULL,
    [PurchaseOrderNumber]    NVARCHAR (25)    NULL,
    [AccountNumber]          NVARCHAR (15)    NULL,
    [CustomerID]             INT              NOT NULL,
    [ShipToAddressID]        INT              NULL,
    [BillToAddressID]        INT              NULL,
    [ShipMethod]             NVARCHAR (50)    NOT NULL,
    [CreditCardApprovalCode] VARCHAR (15)     NULL,
    [SubTotal]               MONEY            CONSTRAINT [DF_SalesOrderHeader_SubTotal] DEFAULT ((0.00)) NOT NULL,
    [TaxAmt]                 MONEY            CONSTRAINT [DF_SalesOrderHeader_TaxAmt] DEFAULT ((0.00)) NOT NULL,
    [Freight]                MONEY            CONSTRAINT [DF_SalesOrderHeader_Freight] DEFAULT ((0.00)) NOT NULL,
    [Comment]                NVARCHAR (MAX)   NULL,
    [rowguid]                UNIQUEIDENTIFIER CONSTRAINT [DF_SalesOrderHeader_rowguid] DEFAULT (newid()) NOT NULL,
    [ModifiedDate]           DATETIME         CONSTRAINT [DF_SalesOrderHeader_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC),
    CONSTRAINT [CK_SalesOrderHeader_DueDate] CHECK ([DueDate]>=[OrderDate]),
    CONSTRAINT [CK_SalesOrderHeader_Freight] CHECK ([Freight]>=(0.00)),
    CONSTRAINT [CK_SalesOrderHeader_ShipDate] CHECK ([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL),
    CONSTRAINT [CK_SalesOrderHeader_Status] CHECK ([Status]>=(0) AND [Status]<=(8)),
    CONSTRAINT [CK_SalesOrderHeader_SubTotal] CHECK ([SubTotal]>=(0.00)),
    CONSTRAINT [CK_SalesOrderHeader_TaxAmt] CHECK ([TaxAmt]>=(0.00)),
    CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID] FOREIGN KEY ([BillToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID]),
    CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID] FOREIGN KEY ([ShipToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID]),
    CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID]),
    CONSTRAINT [AK_SalesOrderHeader_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID]
    ON [SalesLT].[SalesOrderHeader]([CustomerID] ASC);


GO

