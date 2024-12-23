CREATE TABLE [SalesLT].[Customer] (
    [CustomerID]   INT              IDENTITY (1, 1) NOT NULL,
    [NameStyle]    BIT              CONSTRAINT [DF_Customer_NameStyle] DEFAULT ((0)) NULL,
    [Title]        NVARCHAR (8)     NULL,
    [FirstName]    NVARCHAR (50)    NULL,
    [MiddleName]   NVARCHAR (50)    NULL,
    [LastName]     NVARCHAR (50)    NULL,
    [Suffix]       NVARCHAR (10)    NULL,
    [CompanyName]  NVARCHAR (128)   NULL,
    [SalesPerson]  NVARCHAR (256)   NULL,
    [EmailAddress] NVARCHAR (50)    NULL,
    [Phone]        NVARCHAR (25)    NULL,
    [PasswordHash] VARCHAR (128)    NOT NULL,
    [PasswordSalt] VARCHAR (10)     NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()) NOT NULL,
    [ModifiedDate] DATETIME         CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [AK_Customer_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress]
    ON [SalesLT].[Customer]([EmailAddress] ASC);


GO

