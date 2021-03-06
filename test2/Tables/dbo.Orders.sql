/*=============================================================
SCRIPT HEADER

VERSION:   0.00.0000
DATE:      05-10-2018 17:41:41
SERVER:    DESKTOP-EHDJQ3I\SQLEXPRESS

%ObjectList%

=============================================================*/
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO

-- Create Table [dbo].[Orders]
Print 'Create Table [dbo].[Orders]'
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE TABLE [dbo].[Orders] (
		[OrderID]            [int] IDENTITY(1, 1) NOT NULL,
		[CustomerID]         [nchar](5) NULL,
		[EmployeeID]         [int] NULL,
		[OrderDate]          [datetime] NULL,
		[RequiredDate]       [datetime] NULL,
		[ShippedDate]        [datetime] NULL,
		[ShipVia]            [int] NULL,
		[Freight]            [money] NULL,
		[ShipName]           [nvarchar](40) NULL,
		[ShipAddress]        [nvarchar](60) NULL,
		[ShipCity]           [nvarchar](15) NULL,
		[ShipRegion]         [nvarchar](15) NULL,
		[ShipPostalCode]     [nvarchar](10) NULL,
		[ShipCountry]        [nvarchar](15) NULL,
		CONSTRAINT [PK_Orders]
		PRIMARY KEY
		CLUSTERED
		([OrderID])
	ON [PRIMARY]
) ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Orders]
	ADD
	CONSTRAINT [DF_Orders_Freight]
	DEFAULT (0) FOR [Freight]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [CustomerID]
	ON [dbo].[Orders] ([CustomerID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [CustomersOrders]
	ON [dbo].[Orders] ([CustomerID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [EmployeeID]
	ON [dbo].[Orders] ([EmployeeID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [EmployeesOrders]
	ON [dbo].[Orders] ([EmployeeID])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [OrderDate]
	ON [dbo].[Orders] ([OrderDate])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [ShippedDate]
	ON [dbo].[Orders] ([ShippedDate])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [ShippersOrders]
	ON [dbo].[Orders] ([ShipVia])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
CREATE NONCLUSTERED INDEX [ShipPostalCode]
	ON [dbo].[Orders] ([ShipPostalCode])
	ON [PRIMARY]
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Orders] SET (LOCK_ESCALATION = TABLE)
GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Orders]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Orders_Customers]
	FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
ALTER TABLE [dbo].[Orders]
	CHECK CONSTRAINT [FK_Orders_Customers]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Orders]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Orders_Employees]
	FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeID])
ALTER TABLE [dbo].[Orders]
	CHECK CONSTRAINT [FK_Orders_Employees]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
ALTER TABLE [dbo].[Orders]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Orders_Shippers]
	FOREIGN KEY ([ShipVia]) REFERENCES [dbo].[Shippers] ([ShipperID])
ALTER TABLE [dbo].[Orders]
	CHECK CONSTRAINT [FK_Orders_Shippers]

GO

IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO

SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_WARNINGS ON
SET NOCOUNT ON
SET XACT_ABORT ON
GO
