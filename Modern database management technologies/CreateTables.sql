USE [service_db]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[customers](
	[id_owner] [int] NOT NULL,
	[name] [nchar](40) NULL,
	[id_vehicle] [int] NOT NULL,
	[phone] [nchar](30) NULL,
	[email] [nchar](30) NULL,
	[document_id] [nchar](30) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id_owner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
       ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_customers] FOREIGN KEY([id_owner])
REFERENCES [dbo].[customers] ([id_owner])
GO

ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_customers]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID Владельца' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customers', 
								@level2type=N'COLUMN',@level2name=N'id_owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ФИО' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customers', 
								@level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID транспорта' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customers', 
								@level2type=N'COLUMN',@level2name=N'id_vehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Номер телефона' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customers', 
								@level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'customers', 
								@level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Документ, удостоверяющий личность' , 
								@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',
								@level1name=N'customers', @level2type=N'COLUMN',@level2name=N'document_id'
GO


CREATE TABLE [dbo].[vehicles](
	[id_vehicle] [int] NOT NULL,
	[id_owner] [int] NOT NULL,
	[model] [nchar](30) NOT NULL,
	[number] [nchar](11) NOT NULL,
	[issued] [date] NOT NULL,
	[mileage] [int] NOT NULL,
 CONSTRAINT [PK_vehicles] PRIMARY KEY CLUSTERED 
(
	[id_vehicle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
	   ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[vehicles]  WITH NOCHECK ADD  CONSTRAINT [FK_vehicles_vehicles] FOREIGN KEY([id_vehicle])
REFERENCES [dbo].[vehicles] ([id_vehicle])
GO

ALTER TABLE [dbo].[vehicles] NOCHECK CONSTRAINT [FK_vehicles_vehicles]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID транспортного средства' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vehicles', 
								@level2type=N'COLUMN',@level2name=N'id_vehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID владельца' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vehicles', 
								@level2type=N'COLUMN',@level2name=N'id_owner'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Модель автомобиля' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vehicles', 
								@level2type=N'COLUMN',@level2name=N'model'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Автомобильный номер' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vehicles', 
								@level2type=N'COLUMN',@level2name=N'number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Год выпуска автомобиля' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vehicles', 
								@level2type=N'COLUMN',@level2name=N'issued'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Пробег транспортного средства' , 
								@level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',
								@level1name=N'vehicles', @level2type=N'COLUMN',@level2name=N'mileage'
GO

CREATE TABLE [dbo].[diagnostics](
	[id_ticket] [int] NOT NULL,
	[job] [nchar](30) NULL,
	[description] [nchar](30) NULL,
	[state] [nchar](30) NULL,
	[id_vehicle] [int] NULL,
	[conclusion] [nchar](30) NULL,
	[id_master] [nchar](4) NULL,
	[start_date] [datetime] NULL,
	[duration] [int] NULL,
 CONSTRAINT [PK_diagnostics] PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
       ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID Задачи на диагностику' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'id_ticket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Цель диагностики' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'job'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Описание проблемы' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Текущее состояни задачи' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID транспортного сервиса' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'id_vehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Диагностический вывод' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'conclusion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Диагност' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'id_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Время создания задачи' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Затрачено на диагностику' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnostics', 
								@level2type=N'COLUMN',@level2name=N'duration'
GO


CREATE TABLE [dbo].[service](
	[id_service] [int] NOT NULL,
	[job] [nchar](30) NULL,
	[state] [nchar](30) NULL,
	[id_vehicle] [int] NULL,
	[id_master] [int] NULL,
	[id_ticket] [int] NULL,
	[start_date] [datetime] NULL,
	[duration] [int] NULL,
	[id_material] [int] NULL,
	[conclusion] [varchar](100) NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[id_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
       ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID задания на сервис' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'id_service'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Требуемые работы' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'job'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Статус задачи' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID транспортного средства' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'id_vehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Мастер' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'id_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID диагностики' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'id_ticket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Начало сервисных работ' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Продолжительность' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'duration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Замененная детать' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'id_material'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Результаты сервиса' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'service', 
								@level2type=N'COLUMN',@level2name=N'conclusion'
GO


CREATE TABLE [dbo].[staff](
	[id_master] [int] NOT NULL,
	[name] [nchar](30) NULL,
	[id_grade] [int] NULL,
	[qualification] [nchar](100) NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[id_master] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
       ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID сотрудника' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'staff', 
								@level2type=N'COLUMN',@level2name=N'id_master'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ФИО' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'staff', 
								@level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Грейд' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'staff', 
								@level2type=N'COLUMN',@level2name=N'id_grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Квалификация' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'staff', 
								@level2type=N'COLUMN',@level2name=N'qualification'
GO


CREATE TABLE [dbo].[materials](
	[id_material] [int] NOT NULL,
	[title] [nchar](30) NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_materials] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
       ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID запчасти' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'materials', 
								@level2type=N'COLUMN',@level2name=N'id_material'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Наименование' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'materials', 
								@level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Цена' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'materials', 
								@level2type=N'COLUMN',@level2name=N'price'
GO


CREATE TABLE [dbo].[grades](
	[id_grade] [int] NOT NULL,
	[description] [nchar](30) NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[id_grade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID грейда' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'grades', 
								@level2type=N'COLUMN',@level2name=N'id_grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Описание' , @level0type=N'SCHEMA',
								@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'grades', 
								@level2type=N'COLUMN',@level2name=N'description'
GO


CREATE TABLE [dbo].[bills](
	[id_bill] [int] NOT NULL,
	[id_owner] [int] NULL,
	[id_ticket] [int] NULL,
	[id_service] [int] NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_bills] PRIMARY KEY CLUSTERED 
(
	[id_bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
       ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
