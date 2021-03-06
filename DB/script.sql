USE [master]
GO
/****** Object:  Database [Aachen]    Script Date: 12.04.2013 21:49:19 ******/
CREATE DATABASE [Aachen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aachen', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Aachen.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Aachen_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Aachen_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Aachen] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aachen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aachen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aachen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aachen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aachen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aachen] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aachen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Aachen] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Aachen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aachen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aachen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aachen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aachen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aachen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aachen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aachen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aachen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Aachen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aachen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aachen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aachen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aachen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aachen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aachen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aachen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Aachen] SET  MULTI_USER 
GO
ALTER DATABASE [Aachen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aachen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aachen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aachen] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Aachen]
GO
/****** Object:  Table [dbo].[Joke]    Script Date: 12.04.2013 21:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Joke](
	[JokeId] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ResourceId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Joke] PRIMARY KEY CLUSTERED 
(
	[JokeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource]    Script Date: 12.04.2013 21:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Url] [varchar](200) NULL,
	[TypeId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResourceProcessingRule]    Script Date: 12.04.2013 21:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResourceProcessingRule](
	[ResourceProcessingRuleId] [int] IDENTITY(1,1) NOT NULL,
	[ResourceId] [int] NOT NULL,
	[Rule] [varchar](50) NOT NULL,
	[Argument] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ResourceProcessingRule] PRIMARY KEY CLUSTERED 
(
	[ResourceProcessingRuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResourceType]    Script Date: 12.04.2013 21:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResourceType](
	[ResourceTypeId] [tinyint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ResourceType] PRIMARY KEY CLUSTERED 
(
	[ResourceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Joke] ON 

INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (6, N'Жена избила собственного мужа. Подсудимую просят рассказать, как было дело: <br /><br> - Сначала он вызвал меня с работы домой, затем раздел и уложил в постель, а потом с идиотским смехом заявил, что сегодня первое апреля!', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (7, N'Вот Россия! <br /> Как ипотеку взять, так зарплата не позволяет! <br /> А как детские оформить, так доход превышен... .', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (8, N'Урок в первом классе. <br /><br> - Дети придумайте слово на букву,,ё,, Вовочка тянет руку. Учительница <br /> думает, на эту букву есть мат. Она спрашивает Машу. <br /><br> - Скажи Машенька. <br /><br> - Елочка. <br /><br> - Правильно. А сейчас придумайте слово на букву,, х,, Вовочка опять <br /> тянет руку. И на эту есть мат, думает учительница. Спрашивает Васю <br /><br> - Скажи Вася <br /><br> - Хомутик <br /><br> - Молодец Васенька. А сейчас придумайте на букву,, р,, Все думают, <br /> а Вовочка снова тянет руку. Учительница подумала, на эту букву нет <br /> мата. <br /><br> - Ну скажи Вовочка <br /><br> - Распиздяи. Пока тут ваши елочки и хомутики я чуть не обосрался. <br />  <font color=#666666><small>анeкдотoв.net</small></font>', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (9, N'Одному еврею приснилось, что он поднялся на гору Синай и беседует с Богом. <br /><br> - О, Всевышний!<br> - воззвал еврей.<br> - Что значит для тебя сто тысяч лет? <br /><br> - Одна минута,<br> - ответил Бог. <br /><br> - А что значит для тебя сто тысяч золотых монет? <br /> …<br> - Медный грош. <br /><br> - Тогда подари мне один такой медный грош,<br> - взмолился еврей. <br /> И услышал в ответ: <br /><br> - Подожди одну минуту. .  <font color=#666666><small>aнекдoтов.nеt</small></font>', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (10, N'Я бы не стал пользоваться зубной пастой, рекомендованной лучшими стоматологами, исходя из тех соображений, что эти люди кровно заинтересованы, чтобы наши зубы болели как можно чаще и как можно сильнее.  <font color=#666666><small>анeкдотoв.net</small></font>', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (11, N'Офицер остановил слоняющегося без дела рядового во дворе перед казармой. <br /><br> - Вы почему ничем не заняты? Почему вы здесь шатаетесь без дела? Вы кем были на гражданке? <br /><br> - Я был заместителем начальника отдела в торговой фирме. <br /><br> - Подчиненные были, конечно? <br /><br> - Так точно! 10 человек! <br /><br> - Что бы вы сделали, если бы увидели, как ваш подчиненный болтается без дела! <br /><br> - Уволил бы, не задумываясь, немедленно!', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (12, N'Японцы изобрели часы, которые услышав мат перескакивают на минуту вперед. <br /> Решили опробовать. <br /> Повесили в японский бар на 24 часа. <br /> Через 24 часа приходят, часы идут на 2 минуты вперед. <br /> Повесили в английский бар. Через 24 часа приходят, часы идут на 5 минут вперед. <br /> Повесили в русский бар. Через 24 часа приходят<br> - часов нет! Они подходят к бармену:<br /><br> - Мы вчера сюда часы повесили, где они? <br /> Бармен (удивляясь):<br /><br> - А-а-а-а-а... . так это были часы?! А мы думали<br> - на х%я нам зимой вентилятор?! <font color=#666666><small>aнекдотов.nеt</small></font>', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (13, N'Семейная пара купила робота-воспитателя со встроенным детектором лжи, <br /> и решила его испытать. Тут как раз пришел из школы их сын. <br /><br> - Где ты был?<br> - спросил отец. <br /><br> - В школе после уроков задержался,<br> - ответил сын. <br /> Робот отвесил ему подзатыльник. <br /><br> - Ага!<br> - довольно сказал отец.<br> - А теперь говори правду! <br /><br> - Ну... мы с друзьями смотрели порнушку... <br /><br> - Вот видишь,<br> - сказал отец, отвешивая сыну еще один подзатыльник, <br /><br> - Родителям всегда надо говорить правду! Я, например, никогда не врал <br /> своим родителям! <br /> Робот подходит к отцу и отвешивает ему две оплеухи, да такие, что тот <br /> еле на ногах устоял. <br /> Мать, покатываясь со смеху, замечает: <br /><br> - Будь с ним поласковей, это в конце концов ТВОЙ сын! <br /> Робот молча наносит ей удар в челюсть. <br />', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (14, N'Во время падения звезды подросток не успел определиться с желанием и на следующий день стал обладателем многоскоростного велосипеда с сиськами.', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (15, N'- Любимая, это было просто потрясающе! Ни одна моя девушка не умела ТАК делать минет! <br /><br> - Ну что ты хочешь, настоящий филолог просто обязан хорошо владеть языком.  <font color=#666666><small>анекдотов.nеt</small></font>', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (16, N'Суббота, в компьютерной фирме рабочий день. Телефонный звонок. <br /><br> - Фирма "Ланит", доброе утро. <br /> Женский голос, шёпотом: <br /><br> - Алло. <br /><br> - Да, слушаю. <br /><br> - Я вчера у вас компьютер покупала. <br /><br> - И?.. <br /><br> - Он... сломался, можете... починить? <br /><br> - Говорите, пожалуйста, громче, не слышно. <br /><br> - Громче? Не могу... Муж услышит<br> - убьет...', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (17, N'Вариация: <br /> Пираты захватили мирный корабль. Капитан пиратов отдаёт распоряжения: <br /><br> - Баб за борт, мужиков в трюм, потом их трахать будем. <br /> Бабы жалобно:<br> - Так мужики же не трахаются! <br /> Мужики из трюма:<br> - Трахаемся, трахаемся. <br />', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (18, N'Еду в троллейбусе и наблюдаю следующую картину: на остановке троллейбус останавливается, открываются двери. В троллейбус поднимается какая-то бабушка, вслед за ней<br> - мужчина. <br /> Мужчина: извините, я доеду до центрального рынка? <br /> Бабушка: нет. <br /> Мужик с разочарованным видом выходит из троллейбуса. Двери закрываются, троллейбус трогается. Бабушка вслух добавляет: <br /> "А вот я доеду"!', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (19, N'- Что у тебя лицо такое помятое? <br /><br> - Да один качек штангу уронил... <br /><br> - Тебе на рожу??? <br /><br> - Да нет, себе на ногу... <br /><br> - Так в чем дело? <br /><br> - А я засмеялся...', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (20, N'Проходят соревнования между тремя странами: кто дольше сумеет продержаться под водой. <br /> Первый ныряет американец. 2, 3, 4 минуты<br> - выныривает. Зрители аплодируют. На вопросы корреспондентов, как вам это удалось, скромно отвечает "система йогов". <br /> Вторым ныряет француз. 2, 3, 4. . . 10 минут! ! ! Зрители в восторге. <br /> Как вам это удалось? "Система йогов"<br> - скромно отвечает француз. <br /> Очередь русского<br> - ныряет. <br /> 2, 3, 4, 5, 6, 7. . . 20 минут<br> - нет его. 30 минут<br> - выныривает. <br /> Зрители в экстазе: <br /><br> - Как же вам это удалось! ! ! Это что<br> - система йогов? ! <br /><br> - Да какая в п###у система йогов: трусы, б. . . , за корягу зацепились.', CAST(0x0000A16501744C71 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (21, N'Николай Валуев в детстве поджигал пакет, звонил в дверь и не убегал.', CAST(0x0000A16501744E35 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (22, N'Моя жена настолько жуткая, что когда вчера гулял с ней в парке, то ее отп*здили, а меня вы*бали.', CAST(0x0000A16501744E35 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (23, N'Народная примета: Если с похмелья утром зубная щетка не помещается в рот, то она от обуви &#8230;', CAST(0x0000A16501744E35 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (24, N'- Ваш сын нарисовал на парте муху, как живую, и я отбила об нее руку.<br> - А вот я когда в ванной увидел нарисованного крокодила, выбежал через нарисованную дверь.', CAST(0x0000A16501744E35 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (25, N'Мужик сказал &#8211; починит кран, значит &#8211; починит! И не надо ему каждые полгода про это напоминать!', CAST(0x0000A16501744E35 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (26, N'Надпись в туалете: &#171;В случае бомбардировки &#8211; прячьтесь под этим унитазом. У него еще никто не попадал&#187;. Уборщица.', CAST(0x0000A16501744E35 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (27, N'Колумбийские дети хотят хоть раз в жизни высморкаться соплями.', CAST(0x0000A16501744E35 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (28, N'Не заходи в ВКонтакте 14 февраля. Пусть все думают, что ты на свидании.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (29, N'Пьяные рыбаки поймали русалку. Наутро оказалось что это сом. Всем стало стыдно.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (30, N'Сидят две лесбы в баре. Вдруг заходит крутейная гёрла. <br />
-Ух, ты! Смотри какая тёлка!!! <br />
-Угу! <br />
-Смотри, какая задница! <br />
-Угу, угу ! <br />
-А сиськи какие классные! <br />
-Угу! <br />
-Да чо ты всё &quot;угу&quot;, да &quot;угу&quot;, слова все позабыла что-ли !? <br />
Та берет бумажку и пишет: <br />
&quot;Не могу говорить. Язык встал!&quot;', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (31, N'Лежит мужик в кальсонах на пляже, загорает... <br />
 К нему подходит девушка и говорит: <br />
 - Мужчина, как Вам не стыдно! Все мужики на пляже - кто в плавках, кто в шортах, а Вы - в кальсонах. <br />
 Тот ей отвечает: <br />
 - Понимаешь, милочка. У меня член таких размеров, что ни в плавки, ни в шорты не помещается. <br />
 Она: - Мужик, а покажи-ка. <br />
 Он: - Заплати рубль, тогда покажу. <br />
 Она платит, после этого рассматривает член и говорит: <br />
 - Действительно нехило! А можно я его потрогаю? <br />
 Он отвечает: <br />
 - Заплати десять и трогай. <br />
 Она платит, трогает, и восхищённо говорит: <br />
 - Мужик, может быть я тебе сотню заплачу и ты меня трахнешь? <br />
 Он отвечает: <br />
 - Ты, наверное, дура... Да если бы у меня такой член, да ещё и стоял, то я бы не в кальсонах, а в золоте ходил...', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (32, N'Идут обходчики вдоль железнодорожных путей. Ту проносится мимо них электричка, и оттуда вылетает мужик. Ну, они подбегают к нему, смотрят - вроде живой. Очухался мужик, подняли его, спрашивают:<br />
- Мужик, ты как?<br />
- Да ничего...<br />
- А как так получилось-то, что ты из электрички вылетел?<br />
- Ребята, не знаю, ей-богу... Сижу себе тихонько у окошка, никого не трогаю, пенопластом по стеклу возюкаю...', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (33, N'Однажды, когда я был маленьким, мы с бабушкой зашли в летнее кафе под открытым небом, чтобы пообедать. Потом пошел ливень. Мне понадобилось 3 часа, чтобы доесть бульон.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (34, N'Катаясь на американских горках с учительницей русского языка, дети <br />
 узнали много исключений из правил.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (35, N'Мужик с удочкой сидит на берегу реки. Подходит ещё один, раздевается догола и идёт купаться. Рыбак: <br />
 - Земляк, ты трусы-то надень: тут щука на блесну здорово берёт.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (36, N'А раньше мы играли в классики...Пока сиськи не начали мешать.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (37, N'Тебе правду сказать, или как на самом деле?', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (38, N'Девчонки, скажите, что делать, если парень охладел?<br />
- Хоронить.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (39, N'Муж спрашивает: - Суп сегодняшний? - Я тебе больше скажу: он еще и завтрашний.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (40, N'- Не жалеешь, что замуж вышла? - Да что ж я, не человек, что ли? Жалею его, конечно...', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (41, N'Автоответчик:<br />
Вы дозвонились в военкомат! Если хотите служить, наберите &quot;звездочку&quot;, если нет - &quot;решетку&quot;', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (42, N'Спрашивают моряка: Был ли случай, чтоб Вам было реально страшно? - Перевозили мы как то груз - 10000 кукол. И попали в шторм. И вот когда корабль накренился вправо, то все эти 10000 кукол хором сказали &quot;Мама! &quot; Вот тут я и обосрался.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (43, N'- Мама, а почему папа лысый? - А он у нас очень умный! - А почему у тебя так много волос? - Заткнись и ешь...', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (44, N'Экзамен в зооинституте. Студент с бодуна ничего не может вспомнить, профессор изо всех сил пытается вытянуть его на три: - Ладно, последний, очень простой вопрос. Сколько у коровы сисек? Студент морщит лоб. - Не помню. У доярки - точно две.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (45, N'В развитии мужчины есть три стадии:<br />
1. «АГУ» – младенец.<br />
2. «АГА» – подросток.<br />
3. «УГУ» – муж.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (46, N'Ок, как я тебя узнаю?<br />
- Я буду в черной шапке и синих джинсах, рост примерно 185, вес 84.<br />
- Ок, я буду в черной куртке с весами и рулеткой.', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (47, N'Жена нашла заначку мужа.<br />
- Офигеть! Это откуда у тебя столько денег?<br />
- Да вот, это..., на подарок тебе копил:<br />
- Да...! Пипец, а че так мало то!?', CAST(0x0000A16501744FEE AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (48, N'Достаточно одного взгляда на тех, кто сидит в самолете, чтобы точно их классифицировать.<br />Первая группа - эти с самого начала пристегиваются...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (49, N'Уборщица заходит в отдел информационных технологий и громко спрашивает: <br />-Кто тут компьютером умеет пользоваться? <br />Все без исключения...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (50, N'Утро. Жена мужу: <br />- Вася, вставай, на работу пора... . Вставай... Ну, Вася! . . Не-ет, Вася, ты весь вставай...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (51, N'Нашла характеристику мужа с детского сада. Хорошо кушает, спит, гуляет! Прошло 30 лет... ничего не изменилось... .<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (52, N'...Сначала, ради экзотики, ты заводишь себе какого-нибудь редкого питона.<br />...Потом выясняется, что эта тварь ползучая питается только...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (53, N'Познакомились на банкете двое хорошо подвыпивших "новых русских", ну и начали хвастаться друг перед другом своими успехами. Дошли и до сексуальных...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (54, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/6/3/256236.jpeg">Сделал добро? Получи конфетку!<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (55, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/4/3/256234.jpeg">Очередь, когда всем лень стоять<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (57, N'Взяла бабка с собой на свадьбу попугая.И сказала:<br />-Запоминай всё что я тебе говорю.<br />А попугай не послушный был.Запоминал всё что звучало со ...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (58, N'Пациент говорит психотерапевту:<br />- Знаете ли, у меня в последнее время возникли некоторые проблемы с восприятием мира.<br />Доктор достает...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (59, N'я тут задачу решил С1 по физике<br />- И что?<br />- У меня муха со скоростью 8266 кмч летает<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (60, N'Из объяснительной в ГИБДД: "Я категорически утверждаю, что моргал фарами, не предупреждая других водителей о посте ДПС, а создавая им новогоднее...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (61, N'Дети: - А у моего папы сотовый телефон!<br />- А у моего - шестисотый Мерседес!<br />- А у моего - вот такая крыса в подвале!<br />Все хором:<br />-...<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (63, N'391528<br clear="all" />', CAST(0x0000A16501744FF2 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (67, N'Сидит маленькая девочка в песочнице играется. Подходит маньяк и спрашивает:<br />- Девочка, а сколько у тебя пальчиков на ручке останется, если я один отрежу?<br />- Три<br />- А почему три?<br />- А вы уже ко мне подходили.<br /><br /><br />Маршрутка. Сидят все напряженные такие, дыжат неглубоко, через 4 слоя марли. Заходит на остановке чахлик с красными глазми и начинает судорожно<br />кашлять. Пассажиры в тревоге. Чахлик:<br />- Да вы не волнуйтесь, это не грипп, это туберкулез!<br />Пассажиры с облегчением:<br />- А-а-а...', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (68, N'Чтобы отучить сына играть со спичками отец для профилактики ударил его 3 раза огнетушителем по спине.<br /><br />*****<br /><br />Приходит громила в ресторан. Достает кошака из кармана. Зовет официанта:<br />- Мне сто грамм водки. Ему (указывает на кошака) сто грамм бензина.<br />Официант поглядел, что тип такой, что лучше не спорить и принес заказ.<br />Верзила водку выпил, открыл кошаку пасть и влил бензин.<br />Кошак дико орет, носится по ресторану по вертикали и горизонтали.<br />Наконец упал, задрав лапы. Официант вытер холодный пот:<br />- Ну что, сдох твой кошак.<br />- Сам ты сдох. Бензин кончился!<br /><br />*****<br /><br />Очкарик очкарику - друг, товарищ и запасные очки.', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (69, N'Хороший математик каждое утро извлекает свой корень из неизвестной...<br /><br />***<br /><br />- Алло, ты ща где?<br />- Я у Сереги сижу...<br />- Да мне пофиг, где ты! Я спрашиваю: тыща из серванта где?!<br /><br />***<br /><br />Гаишник на дороге останавливает машину:<br />— Вы ехали со скоростью шестьдесят километров в час, а здесь висит знак: ограничение сорок.<br />— А я говорю, я шел ровно сорок!<br />— Но вот же показания прибора...<br />Тут вмешивается жена водителя:<br />— Товарищ милиционер, не надо: когда муж пьян, с ним лучше не спорить!', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (70, N'- Товарищ продавец, мясо свежее?<br />- Не знаю, у меня насморк.<br /><br />***<br /><br />Жена - мужу:<br />- И не говори мне, что ты ночевал у своих друзей! Я ночевала у твоих друзей - тебя там не было!<br /><br />***<br /><br />Здравствуйте, у меня был скунс. Его звали Гарри. Но однажды я проголодалась и пожарила Гарри на масле «Олейна» и съела его. Масло «Олейна» - ни гари, ни запаха.', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (71, N'Вечером в деревне:<br />- Вань, ты ко мне на свидание через речку шел?<br />- Через речку...<br />- По мосткам?<br />- По мосткам...<br />- А на говно наступил?<br />- Наступил...<br />- Это я насрала...<br />- Ах ты моя КАКЕТОЧКА!!!<br /><br /><br />Она: <br />- А почему ты не кричишь во время оргазма??<br />Он: <br />- А мне не так страшно.<br /><br /><br />Молодой человек приглашает девушку:<br />- Приходи вечером, чай попьём.<br />- А это не больно? - спрашивает девушка.<br />- Не понял.<br />- Да меня вчера на вафли пригласили - так чуть рот не порвали...', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (72, N'В суде:<br />- Подсудимый объясните суду за что вы убили человека?<br />- Да не собирались мы никого убивать. Хотели только мобильник отобрать. Но когда у него выпал Сименс А35...<br /><br />*****<br /><br />Муж с женой встречаются вечером в постели...<br />Жена:<br />- Милый, я так устала на работе, может, ну его, этот секс в ж...!<br />Муж (мечтательно):<br />- Вот и я думаю - в ж...!!!<br /><br />*****<br /><br />Хорошая девушка должна уметь делать то же, что и плохая. А так как она хорошая - она должна это делать хорошо!', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (73, N'- Ну, может быть, вы хорошенько подумаете над этим и вспомните?<br />- Да нет же, говорю вам! Хотя, знаете, был у меня один знакомый летчик. Но он только показал мне, как заправляются в воздухе самолеты!<br /><br /><br />- Дедушка, а ты Ленина видел?<br />- Видел. Был я тогда молодой, Стоял на посту у кремля. Мороз, холодно, есть охота. Дай, думаю, кипиточка попью. Иду и вижу: Ленин стоит и бутерброт ест. Я к нему подхожу и спрашиваю: &quot;Владимир Ильич, дай кусочек!&quot;. А он мне:&quot; иди ты на х*й!!!&quot;<br />...а глаза добрые-добрые!<br /><br /><br />- Лидия, что вы делаете сегодня вечером?<br />- Кому?', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (74, N'- Сколько вы языков знаете?<br />- Три. Русский, немецкий и французский.<br />- Тогда скажите что-нибудь по французски.<br />- Плиз.<br />- Но это же по английски!<br />- Значит, я знаю четыре.<br /><br />В США есть три супергероя:<br />Супермэн, который летает над небоскребами,<br />Спайдермэн, который по ним карабкается и<br />Мусульмэн, который их взрывает.<br /><br />Экскурсовод с нашими туристами:<br />- А сейчас мы проезжаем мимо самого известного борделя Лас-Вегоса...<br />- А почему мимо?!?!', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (75, N'- Дочка, ты уже взрослая, я хочу тебе рассказать как предохраняться.<br />- Лучше научи меня симулировать оргазм.<br /><br />***<br /><br />В туркменских школах запретили проводить занятия по вождению после занятий по сексуальному воспитанию.<br />Потому что ослик должен отдохнуть.<br /><br />***<br /><br />- Гюльчатай, открой пиво...<br />- Может, личико?!<br />- Да твоим личиком только пиво открывать...', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (76, N'- Кто вы по профессии?<br />- Флорист.<br />- И что самое приятное в вашей работе?<br />- Дефлорация.<br /><br />Для некоторых игра в городки - это единственная возможность кинуть палку...<br /><br />Если ты &quot;голубой&quot;, то это еще не повод, что бы вести себя как пидор.<br /><br />К врачу заходит благодарный пациент, несет коньяк, конфеты, икру и т.д.<br />- Вот, доктор, спасибо вам большое!<br />Врач, негодуя:<br />- Послушайте, голубчик, а кто, собственно, позволил вам тратить мои деньги?!<br /><br />- Василий Иванович, там селяне старого педофила поймали!<br />- Ну так расстреляйте.<br />- Дык боязно. Он божится, что Ленина знал еще мальчиком!', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (77, N'- Вы работали в редакции журнала?<br />- Да. Я популизатор.<br />- За что же вас выгнали?<br />- Не ту попу лизнул.<br /><br /><br />В школе встречаются две подруги.<br />- Светка, вчера Колька и Сережка из-за тебя чуть не подрались!<br />- Да ты что?!<br />- Ага! Колька кричит: &quot;Бери ее себе!&quot;, а Сережка ему в ответ:<br />&quot;На фиг она мне нужна!&quot;', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (78, N'Цирк. На середину арены выходит простой мужик в ватнике и кирзачах и выводит на поводке свинью. Привязывает свинью к колышку в центре арены и отходит. Потом разбегается и с криком:<br />- Парле ву франсе?<br />бьёт свинью кирзачом в бок. Свинья:<br />- Уии...<br /><br />***<br /><br />Заходит мужик в туалет, садитса, и слишит голос из соседней кабинки:<br />-Привет.<br />Мужик наклоняетса и говорит:<br />-Ну здраствуй!<br />-Как дела?<br />Мужик: Нормально идут. А у тебя?..<br />Голос: Я тебе позже перезвоню: со мной какой-то дебил в туалете розговаривает...', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (79, N'- Хочу девушку-культуристку.<br />- Почему?<br />- С ней ночью ходить не страшно.<br />- А днем?<br />- Ой, не подумал!..<br /><br />***<br /><br />Начальник едет в командировку со своей секретаршей в одном купе. Она верхней койке, он на нижней. Ночью она свешивается со своей койки и будит его:<br />- Я очень замерзла, не могли бы Вы достать мне одеяло?<br />- А давайте на эту ночь притворимся что мы женаты!<br />- Ой, конечно давайте!<br />- Тогда лезь сама за свом бл*дским одеялом!..<br /><br />***<br /><br />Два приятеля. Один:<br />-Пойдем по бабам?<br />-А сам чего, слабо?<br />-Ну, ты профессионал, а я так, любитель.<br />- Хорошо, есть у меня две девицы на примете, сейчас к ним и поедем.<br />- А они как , ничего?<br />- Ну, одна красивая, а другая - так, на любителя...', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (80, N'Взмыленные родители отчитывают тринадцатилетнюю дочь:<br />- Ах ты, дрянная девчонка! Мы с папой уже все бары и дискотеки обегали!<br />А она у подъезда! В песочнице играет!...<br /><br />***<br /><br />Мальчик с недостатком кальция полизал девочку с избытком кальция и баланс восстановился.<br /><br />***<br /><br />В ресторане посетитель спрашивает официанта:<br />- У вас есть в меню дикая утка?<br />- Нет, но для вас мы можем разозлить домашнюю!', CAST(0x0000A1650174501E AS DateTime), 7, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (81, N'Штирлиц после очередного удачно выполненного задания ехал на "Мерседесе" в Берлин. Он не знал, что война скоро закончится, и ему, как Герою Советского Союза, подарят "Запорожец" вне очереди.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (82, N'- Легко ли быть молодым?<br />- Смотря в каком возрасте.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (83, N'Заставил свою жену - шатенку в блондинку перекраситься. Чтобы не вводила в заблуждение окружающих.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (84, N'В садике, после прививки, дети не выбрасывают ватку, потому что от неё пахнет папой.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (85, N'Рыба-пила утром превращается в рыбу-похмелье.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (86, N'Футболисты "Анжи" могут позволить себе нанять двойников, чтобы те работали вместо них на тренировках.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (87, N'На прилавках магазинов появился новый йогурт со вкусом йогурта и кусочками кусочков.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (88, N'Наивно думать, что если все кругом дураки, то вы не входите в их число.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (89, N'Две женщины выбирают открытки на Валентинов день. Одна говорит:<br /> - Смотри, какая красивая - "Моему котику!". Купить, что ли, своему козлу?', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (90, N'Глава "РосНано" Анатолий Чубайс попросил у правительства на новые исследования ахуелиард.', CAST(0x0000A1650174501F AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (91, N'ххх:<br> Кот закинул заднюю лапу за голову и сидит смотрит на меня уже 12 минут. Я не понимаю что он хочет сказать этим? ууу:<br> примерно это:<br> &#171;кормит меня двуногий, убирает тоже он, мог бы и жопу мне вылизать&#187;.', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (92, N'Сегодня на работе:<br> коллега отправила информацию в бухгалтерию, ей прилетает ответ:<br> &#171;СП&#187;. Коллега:<br> Это что такое? Я:<br> Спасибо. Коллега:<br> Ну и сокращение. Я:<br> Ну ты ей отправь &#171;ПЖ&#187; в ответ ))) Коллега:<br> А это что? &#171;Пошла в жопу&#187; что-ли?', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (93, N'Устойчивая психика &#8212; это когда жизнь, пиная вас, ломает себе ногу.', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (94, N'Устойчивая психика &#8212; это когда жизнь, пиная вас, ломает себе ногу.', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (95, N'Сидит наркоман ночью на кладбище, косяк курит. Его труп увидел. &#171;Ну, &#8212; думает, &#8212; сейчас испугаю! &#187; Подошел:<br>- Дай затянуться! Наркоман обернулся:<br>- На! Труп курнул, в сторонку отошел, размышляет, как бы испугать. Взял себе руку вывернул, подошел:<br>- Дай затянуться!<br> - На! Труп затянулся, отошел, злой уже, взял себе руку вообще оторвал, ноги [...]', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (96, N'Мужчина без женщины, как собака без блох &#8212; жить можно, но скучно! А женщина без мужчины, как блоха без собаки &#8212; жить можно, но кусать некого!', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (97, N'Перед сексом вы помогаете друг другу раздеться, после секса вы одеваете только себя. Мораль:<br> в жизни никто не поможет вам, когда вас поимеют.', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (98, N'- Мама смотри как только я дам собачке печенья у нее поднимается хвостик Мама так грустно:<br>- Оставь печеньица папе&#8230;', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (99, N'Да что там коня на скаку&#8230; Есть женщины в русских мегаполисах — лёгким поворотом руля останавливают до тысячи автомобилей!', CAST(0x0000A1650174593E AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (100, N'- Ты на рыбалке сколько поймал? 
<br> - Меньше чем Колян. 
<br> - Так он ничего не поймал. 
<br> - А я еще и удочку потерял.', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (101, N'Приходит свекровь к невестке. Провела пальцем по телеку, шкафу, тумбочке. 
 Показывая пыль на пальце, говорит "Какая пословица есть на этот случай? " 
 (намекая, типа, чистота-залог здоровья и т. п. ) Невестка, недолго думая: "Свинья везде грязь найдет!!!', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (102, N'Мужик приходит в аптеку, чтобы купить себе презервативы. Увидев перед собой молоденькую и очень хорошенькую аптекаршу, он начинает стесняться, но все же говорит: 
<br> - Дайте мне пожалуйста: пальто: ну, вы понимаете, что я имею в виду: пальто мне нужно большого размера: самого большого. 
 Аптекарша дает ему упаковку и говорит: 
<br> - Если вам нужен меховой воротник для вашего пальто, то я заканчиваю в семь часов.', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (103, N'Врезается в джип тонированная волга, из джипа выходит браток, смотрит нифига не видно кто за рулем, берет биту и начинает волгу долбить, боковое стекло осыпается, а там начальник ГИБДД сидит. 
 Браток наклоняется:
<br> - О, здрасти, а я тут стучу, стучу, незнаю кому деньги за аварию отдать...', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (104, N'Перед свадьбой: 
 ОН: Ура! Наконец-то!! Я уже дождаться не мог!!! 
 ОНА: Может мне уйти? 
 ОН: Нет, даже не думай об этом! 
 ОНА: Ты меня любишь? 
 ОН: Конечно! 
 ОНА: Ты мне когда-нибудь изменял? 
 ОН: Нет, как тебе такое в голову пришло? 
 ОНА: Будешь меня целовать? 
 ОН: Буду! 
 ОНА: Будешь меня бить? 
 ОН: Ни в коем случае! 
 ОНА: Могу тебе верить? 
 После свадьбы<br> - читать снизу вверх.', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (105, N'Фермер приобрел породистого скакуна за довольно внушительную сумму, но через месяц конь вдруг заболел. Фермер позвал ветеринара, и тот, обследовав коня, заключил: 
<br> - Ваш конь заразился опасным вирусом, ему надо давать вот это лекарство в течение трех дней. Через три дня я приду его проведать, и если он не поправится, придется его усыпить. 
 Весь этот разговор слышала находящаяся рядом свинья. После первого дня приема лекарства конь не выздоровел. Свинья подошла к нему и сказала: 
<br> - Давай, дружок, вставай! 
 На второй день<br> - то же самое, лекарство на коня не действовало. 
<br> - Ну давай же, дружок, вставай, а то тебе придется умереть,<br> - предупредила его свинья. На третий день коню опять дали лекарство и вновь безрезультатно. 
 Пришедший ветеринар сказал: 
<br> - К сожалению, у нас нет выбора, коня нужно усыпить, потому что у него вирус, который может перекинуться на других лошадей! 
 Услышав это, свинья побежала к коню и давай хрюкать: 
<br> - Ну давай же, ветеринар уже пришел, ты должен подняться<br> - сейчас или никогда! Вставай же быстрее!!! 
 И тут конь вдруг поднялся на ноги и побежал! 
<br> - Какое чудо!<br> - воскликнул фермер.<br> - Это надо отпраздновать! По такому случаю зарежем свинью!', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (106, N'- Тебе лет-то сколько? 
<br> - 13 
<br> - Так, оделась и ушла. 
<br> - Па-адумаешь, какие мы суеверные...', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (107, N'Девушка говорит парню: 
<br> - Вань, ты такой умный, находчивый!ты так много историй знаешь, с тобой так интересно всегда! 
<br> - Маш....я нормальный, просто ты дура! 
 ', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (108, N'Украинская деревня, ночь. Мужик под окном хаты (шопотом): 
<br> - Мыкола! 
оттуда(сдавленный шопот)
- Чеее? 
- Выходь! 
- Зачем? 
- Я тут горилки припас, галушки пожарил, грибочки, огурчики, выпьем! 
- Та не можу! 
- а че??? 
- Та @бусь я, будь оно неладно!!!', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (109, N'Пока я была на сессии, муж оставался предоставлен сам себе. Однажды он решил сварить суп из пакетика. В инструкции сказано: вскипятить литр воды. Все хорошо, но как этот литр высчитать? Помогла логика программиста. Он пошел в магазин и купил литровый баллон клинского. 
 А потом посмотрел на него и подумал: «А зачем мне суп? »', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
GO
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (110, N'Вечер. В приемном покое поликлиники сидит дежурный врач. Входит старушка: 
<br> - Сынок, а глазнюк принимает? 
<br> - Не глазнюк, а окулист. Уже ушел! 
<br> - Сынок, а зубнюк принимает? 
<br> - Не зубнюк, а стоматолог. Нету уже. 
<br> - Сынок, а ты сам-то кто будешь? 
<br> - По-вашему, бабуля-пиздюк, а вообще гинеколог.', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (111, N'- Ну что ж, могу вас поздравить! В вас зародилась новая жизнь! 
<br> - Доктор... но я же мужчина!!! 
<br> - Да? Ну собственно глистам на это как-то пофиг!!! ...  ', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (112, N'Парень и девушка едут в машине. 
 Парень (мечтательно): 
 — Всю жизнь хотел, чтобы мне сделали минет в машине на ходу. 
 Девушка (решительно): 
 — НЕТ! 
 Парень: 
 — Ну пожалуйста. 
 Девушка: 
 — НЕТ! 
 Парень: 
 — Ну что тебе стоит? 
 Девушка: 
 — Вот получишь права, сядешь за руль… А пока машину веду я — никаких минетов. ', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (113, N'Если хорошенько вдуматься, то два главных символа России, матрёшка и бутылка водки, по сути своей одно и то же. Открываешь одну, а дальше<br> - вторая, третья, четвёртая...', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (114, N'Девушка легкого поведения стоит вдоль обочины, едет мужик на машине, видит<br> - молодая девченка, стоит, мёрзнет, думает, "Дай подвезу!" 
 Останавливается рядом, девушка нагибается к окошку, спрашивает: 
<br> - Мужчина, минет сделать не желаете? 
 Мужик обалдело:<br> - Я? КОМУ??', CAST(0x0000A18600BEF47A AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (121, N'Едет по шоссе парень на своем автомобиле с девушкой и другом. Причем выжимает из машины все что возможно, рискованно обгоняет, короче лихачит на всю...<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (122, N'Вовочка в детском саду внимательно смотрит на маникюр воспитательницы и говорит:<br />- Ольга Александровна, у вас такие ногти длинные.<br />- Да...<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (123, N'Учитель спрашивает у класса:<br />-Знаете, почему у новых русских всегда короткая причёска?<br />Вовочка отвечает:<br />-Просто когда они заходят в...<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (124, N'- Доктор, можно к вам?<br />- Что у Вас?<br />- 500 баксов.<br />- Заходите... . Показывайте.<br />- Вот (протягивает банкноту)...<br />- Батенька...<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (125, N'- Почему вы превысили скорость?<br />- Хотел домчаться до дома раньше, чем начнет действовать водка!<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (126, N'- Есть ли у тебя мечта?<br />- Есть.<br />- Какая?<br />- Хочу бросить пить.<br />- Так брось.<br />- А как потом жить без мечты?<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (127, N'Перед вратами рая стоят водитель автобуса и священник.<br />К ним выходит Святой Петр:<br />- Ты, водитель, проходи, а ты, батюшка, подожди...<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (128, N'- Милиция? Я на трассе сбил козла! Что мне делать?<br />- Ну, перетащите его на обочину...<br />- Вместе с его мотоциклом?<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (129, N'Муж (задумчиво):<br />- Дорогая, а у тебя есть этот... как его... целлюлит?<br />Жена (напрягаясь):<br />- Ну... Да...<br />Муж (умиляясь):<br />- И...<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (130, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/4/1/259314.jpeg">Демотиватор про чиновников и бизнес<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (131, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/3/1/259313.jpeg">Демотиватор про надежную защиту<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (132, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/2/1/259312.jpeg">Официант! Меду мне!<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (133, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/9/9/259299.jpeg">И тут я понял, что мне завидно..<br clear="all" />', CAST(0x0000A18600BEF47A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (134, N'В магазине.<br> - Дайте мне руководящую селедку.<br> - У нас нет такой.<br> - Да вон ту, жирную, толстую, без головы.', CAST(0x0000A18600BEF4D4 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (135, N'- Выйдешь за меня?<br> - Конечно, дорогой! Я так долго ждала этого!<br> - Тогда завтра к 8:00. Смотри, не опаздывай! Роба у Матвеича в каптерке.', CAST(0x0000A18600BEF4D4 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (136, N'- Знакомьтесь &#8211; это Даша! Вчера мы с ней тайно расписались и поэтому теперь она будет жить с нами, в нашей квартире.<br> - Ладно, с ней всё понятно, а ты-то кто такой?', CAST(0x0000A18600BEF4D4 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (137, N'У меня нет чрезвычайной фигуры, длинных ног и других девичьих прелестей &#8230; И вообще меня зовут Павел.', CAST(0x0000A18600BEF4D4 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (138, N'- Вам кто-нибудь говорил, какая Вы умная?<br> - Нет, Вы будете первым.<br> - Не буду.', CAST(0x0000A18600BEF4D4 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (139, N'В китайских многодетных семьях детям разрешают совать пальцы в розетку.', CAST(0x0000A18600BEF4D4 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (140, N'Какая же сложная работа тусовать!<br> - Конечно график не нормированный, в помещении накурено, перспектива роста туманная =)', CAST(0x0000A18600BEF4D4 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (141, N'Наступает пост. Нельзя есть мясо, выпивать, лгать, лицемерить. Думе пора уходить в отпуск.', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (142, N'Русский язык настолько могуч, что в нем легко найдется подходящая рифма для строки:<br />- Вложил я деньги в банк как киприот...', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (143, N'Событиям на Кипре посвящается.<br /><br />Еврозона. С каждым годом всё меньше евро и всё больше зона.', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (144, N'Люди делятся на две группы: те, кто не любит депутатов Госдумы, и депутаты Госдумы.', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (145, N'Раньше в ответ на просьбу:  "Подайте бывшему депутату Государственной Думы!"  давали деньги,  сегодня - по морде.', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (146, N'Форд создал новую систему открывания багажника ногой. Они не знают, что это давно изобрели в России и не только для багажника, но и для капота и дверей. и не только в машине.', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (147, N'Повар так усердно резал мясо, что не заметил, как начал отдавать себя работе.', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (148, N'Мы и не заметили как на лавках перед подъездом выросло новое поколение бабок.', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (149, N'Ватикан подозревают в антисемитизме. Выбрали нового папу и опять не еврей!', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (150, N'Весна пришла. Из-под жирка скромно начинают выглядывать первые кубики пресса...', CAST(0x0000A18600BEF555 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (151, N'Техника безопасности:<br />
- Правило первое. Не суй пальцы, куда не надо! Их не так много, как может показаться.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (152, N'Хорошо быть носком. Без тебя не могут. Ты всем нужен. Кроме всего прочего у тебя всегда есть вторая половина… хорошо.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (153, N'Сижу дома, вдруг - звонок в дверь. Открываю - стоит симпатичный молодой человек, спрашивает, дома ли муж? Я отвечаю, что нет. Тогда он входит, толкает меня на диван и... Я до сих пор не могу понять, что он хотел от моего мужа?', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (154, N'Ночью перед сном любимая говорит: &quot;Дай прижмусь к тебе поближе... &quot; и через пару секунд добавляет: &quot;Пока ты теплый&quot;...', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (155, N'Анестезиолог летит в отпуск.<br />
Вдруг стюардесса объявляет:<br />
- Есть ли среди пассажиров анестезиолог? срочно пройдите к 12 месту.<br />
Подходит он к указанному месту, а там мужик водку по стопкам разливает.<br />
- Вы кто? - спрашивает анестезиолог.<br />
- Хирург. Не привык я, понимаешь, пить без анестезиолога!', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (156, N'Переписка на сайте знакомств:<br />
- Привет. Скажи, какой у тебя рост?<br />
- Сто сорок пять.<br />
- Ты моя маленькая принцесса! А вес?<br />
- Вес еще меньше. Сто двадцать.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (157, N'- Знаешь, что самое обидное, когда варишь пельмени?<br />
 - Что они развариваются?<br />
 - Нет.<br />
 - А что?<br />
 - Когда вода вскипела, открываешь холодильник, а пельменей нет...', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (158, N'- Почему ураганы называют женскими именами?<br />
 - Приходят загадочные и непредсказуемые, а потом забирают дома и машины...', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (159, N'Принца мне не надо, - рассуждала Ксения Собчак, мечтая о женихе, - но вот Белый Конь - это уже интересно!', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (160, N'Разговаривают два старых еврея. Один говорит: <br />
 - Ты представляешь, я вчера встретил своего сына, которого не видел 30 лет! <br />
 - И как же ты его узнал? <br />
 - По пальто.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (161, N'Начальник обращается к подчиненным: <br />
 - Слушайте, перестаньте вы называть меня &quot;босс&quot;, &quot;шеф&quot;! К чему это совершенно чуждое нам иноязычное подобострастие? Не люблю я этого... <br />
 - А как вас называть? <br />
 - Да господи! Ну, попроще как-нибудь, по-русски... Например, &quot;кормилец&quot;.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (162, N'- Пап! А почему ты ходишь в сауну с друзьями, когда можно и дома помыться? <br />
Мама: <br />
- Молодец доця - Папа так и делает, в сауну ходит с друзьями, а моется дома....', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (163, N'СССР, 50-ые годы. Американский турист решил попить газированной воды. <br />
 Подходит к автомату, бросает три копейки, ждет. Автомат пожужжал, покашлял и ничего. Американец еще бросает монетку - нифига. Еще монетку <br />
 - тот же эффект. <br />
 Постоял, репу почесал и думает: А ведь это идея! <br />
 ... Так появились игровые автоматы.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (164, N'Жидкокристаллический монитор, жидкокристаллический монитор..<br />
Ни жидкости, ни кристаллов... зря только расковыряла...', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (165, N'- Глянь, как Серега о своей теще заботится, сетки ей на окна поставил, чтоб комары не залетали.<br />
- Конец августа, комары уже кончаются. Так что, это скорее, чтоб не вылетали.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (166, N'Мне нравится интернет, здесь можно назвать кого нибудь говном, а потом выпить теплого молочка и лечь баиньки.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (167, N'- Ты даже не заметил то, что я подстриглась<br />
 - Конечно заметил.<br />
 - А я не стриглась!', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (168, N'Не многие знают, что упавший в в деревенский туалет новенький iPhone напрочь отключает обоняние и чувство брезгливости.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (169, N'Был у нас в универе такой случай. Экзамен. Все взяли билеты, сидят пишут, готовятся. Препод сидит и чего-то ручкой стучит по столу. Проходит какое-то время, 3 студента встают и подходят к преподавателю с зачетками. Тот им ставит &quot;отлично&quot;, и они уходят. <br />
Оказалось, что он азбукой Морзе настукивал &quot;Кто хочет пятерки, подходите с зачетками&quot;. Один парень только сообразил и потащил за собой еще двух друзей, и не прогадал.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (170, N'- Выбирайте: теоретическая или вычислительная группа?<br />
- А мне всё равно.<br />
- Тогда обойдите стул.<br />
- А зачем?<br />
- Ясно, в теоретическую.', CAST(0x0000A18600BEF7A9 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (171, N'— Получила премию. Сижу теперь, мучаюсь:<br> то ли отдать остаток кредита за машину, то ли пришить себе сиськи пятого размера — и тогда кредит за меня отдаст кто-то другой?', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (172, N'Отзыв на мышку на сайте магазина:<br> xxx:<br> Разочарован. Показала себя неудовлетворительно на глянцевых и полу глянцевых журналах, махровом халате, джинсах, стеганом покрывале, кожзаменителе, человеческой коже, полиэтиленовом пакете, шкуре пушистого кота, отдельное спасибо ему за терпение.', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (173, N'Дети,мы начинаем изучать интересный предмет.Очень скоро в нашем классе мальчики заинтересуются девочками, а девочки мальчиками.Марья Ивановна,а можно те,кто уже трахался,пойдут играть в футбол?', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (174, N'Рентгенолог в присутствии больного подходит к окну и внимательно рассматривает снимок на свет:<br>- Так-так, да у вас тут&#8230; Да это же&#8230; Ох блин!!! &#8212; и выбегает из кабинета&#8230; Возвращается через полчаса. Больной &#8212; в ужасе:<br>- Доктор! Сколько мне осталось?!<br> - Вам?! Да у вас все нормально! Это у меня&#8230; прямо на глазах, гады, [...]', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (175, N'- Сёма, что племяннику на день рождения подарим?<br> - А давай подарим ему бабу резиновую!<br> - Ты с ума сошёл! Он же такой мальчик интеллигентный!<br> - А мы ей очки наденем..', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (176, N'- Дорогая можно я тебя поцелую в лобик? А можно в носик? Теперь в губки? Теперь &#8212; твоя шикарная грудь! Вот сейчас в пупок!!! А теперь &#8212; в ножку!!<br> - НЕ ПЕРЕСКАКИВАЙ!!!', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (177, N'ххх:<br> Не, на пиво не хватит, щас в метро мужику мелочь отдал &#8212; на гармошке играл. Блин, песня привязалась. ууу:<br> Скачал рингтон!', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (178, N'Однажды я пригласил очень красивую девушку на свидание. Было лето, мы сидели на улице, ели мороженое. Вдруг я увидел, что капля мороженого капнула мне на джинсы. Быстро, чтобы не заметила девушка, я провел пальцем по ноге и слизал его с пальца. Оказалось, что это было не мороженое, а просто какая-то птичка нагадила на меня сверху.', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (179, N'- тыща где?<br> - я у Кости<br> - да мне плевать где ты! где тыща?!!', CAST(0x0000A18600BEF8A0 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (180, N'Самое важное - успеть лечь спать до того, как захочется жрать.', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (181, N'Если рыбак сидит лицом к лунке, - значит, рыбу ловит, если спиной - то, возможно, прикармливает.', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (182, N'Как ведут себя ...<br /><br />- англичане: уходят, не попрощавшись<br />- евреи: прощаются, но не уходят<br />- киприоты: уходят, прихватив с собой 10% ваших денег', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (183, N'Путин настоящий киприот своей Родины!', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (184, N'В кипрских банках утруска и усушка денег составляет примерно 10%.', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (185, N'Госдума так и не смогла полностью опубликовать закон о штрафах за нецензурную брань в СМИ, т.к. принятый официальный список нецензурных слов сам попал под действие этого закона.', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (186, N'Сначала думаешь, что дружить с геем прикольно и совсем не страшно, а потом он уводит твоего парня.', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (187, N'Мне рано заводить детей. Я морально не готов покупать киндер-сюрприз и отдавать его кому-то.', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (188, N'Ладно, в правительстве воруют, но вот уже и природа украла у нас месяц весны...', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (189, N'- Во время секса мой муж ревёт как лев. Мне так неудобно перед соседями.<br /> - А ты бы его попросила сдерживать себя, ведь взрослый же человек!<br /> - Тысячу раз просила! А он как застанет меня с каким-нибудь типом - и опять ревёт, как лев.', CAST(0x0000A1870097CDD4 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (190, N'Мужик заболел гриппом. Жена собирается ему в нос капли закапать, зашла с сыном в комнату, ждет пока проснется. Сын, шепотом: 
<br> - Ма, да чего ты ждёшь? Закапывай, пока спит. 
 Мужик, сквозь сон: 
<br> - Рано меня закапывать<br> - тело ещё не остыло...', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (191, N'- Знаешь, дорогой, мне бы так хотелось иметь автомобиль,<br> - просительно говорит супруга.<br> - Мы смогли бы повидать свет. 
 Муж: 
<br> - Тот или этот?', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (192, N'Девушка, что вы на меня так смотрите, будто у вас родители на дачу уехали?', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (193, N'Приходит английский лорд домой. Ему открывает дворецкий и говорит: 
<br> - Ну что, старый хрен, опять бухал и шлялся по девкам? 
<br> - Нет, Джон, ходил покупать слуховой аппарат...', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (194, N'Один из самых запомнившихся приколов в постели, отмочила на заре моей интимной жизни барышня, которая удостоив мой член крепким, поистине дружеским рукопожатием, сказала: 
<br> - Добро пожаловать в органы, сынок!  ', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (195, N'Немолодые супруги, уже отметившие серебряную свадьбу, давно живущие вместе, сидят утром за столом, завтракают. Жена смотрит на мужа долгим взглядом и спрашивает: 
<br> - Толик, пожалуйста, скажи мне<br> - ты меня все еще любишь? 
 Мужик раздраженно швыряет вилку на стол: 
<br> - Люся, ну вот объясни мне<br> - ну на хрена начинать каждое утро со скандала?!  ', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (196, N'Черный мальчик спрашивает у белой мамы: 
<br> - Мам, а чего ты белая, бабушка белая, дедушка белый, все белые, а я<br> -черный??? 
<br> - Ой, сынок, как вспомню ту вечеринку<br> - хорошо, что не гавкаешь!', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (197, N'- Мам, а что это у лошадки висит?<br> - спрашивает пятилетний мальчик в зоопарке. 
<br> - Ничего, сынок, это просто член, которым лошадка тр№%?ет другую лошадку, а пальцем показывать<br> - это некультурно.', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (198, N'Муж приходит в роддом. Врач: 
<br> - Прыгайте от счастья, у вас четверня родилась. 
<br> - Я бы прыгнул, но с первого этажа толку не будет!', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (199, N'Когда мальчики хотят понравиться девочкам, они прикидываются умными. 
 А девочки, когда хотят понравиться мальчикам, прикидываются глупыми. 
 Мальчики прикидываются умными, потому что понимают: при прочих равных у умного больше шансов. А девочки<br> - для того, чтобы мальчику пришлось не так сильно напрягаться, делая вид, что он умнее.  ', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (200, N'- Я всё бросил! И пить, и курить, и жену!.. 
<br> - А жену зачем? 
<br> - А не заслужила она такого счастья!', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (201, N'Заходит чукча в аптеку, подходит к окошечку. 
<br> - У вас сметана есть? 
<br> - О ??? Нет... 
<br> - А колбаска копченая есть? 
<br> - Нет, и колбаски нет... 
<br> - А рыбка вяленая есть? 
<br> - Да нет же! Мы такими вещами в аптеке не торгуем! 
<br> - ПЛОХО ТОРГУЕТЕ!!! 
<br> - ЭТО Я-ТО ПЛОХО!!! ВОТ ВСТАВАЙ ЗА СТОЙКУ, Я НА ТЕБЯ ПОСМОТРЮ!!!!! 
<br> - Согласный... 
 Вот и поменялись они местами. Чукча за стойку, а продавец к окошечку подваливает: 
<br> - А что, чукча, у тебя красная икра есть? 
<br> - Есть. 
<br> - О! 
<br> - Ну, а черная есть? 
<br> - Есть. 
<br> - Ну, тогда мне по 100 грамм той и другой. 
<br> - А У ТЕБЯ РЕЦЕПТ ЕСТЬ?!!!', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (202, N'По радио передают новости:<br> - В США два месяца назад был задержан злостный хакер Вася Иванов. Суд приговорил его к 10 годам тюремного заключения. 
 По данным центрального полицейского компьютера США, завтра Вася Иванов выходит на свободу, полностью отбыв весь срок заключения.', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (203, N'Закон жизни: в каком бы районе ты не поселился, сосед с перфоратором разыщет тебя и поселится рядом...', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (204, N'После того, как врач обьявил ему страшный дигноз<br> - бесплодие, он так растерялся, что даже не знал, что сказать своей беременной жене...', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (205, N'Мне нравится логика наших кинобоевиков<br> - вышибить дверь из гранатомёта, а потом тихо красться чтоб никто не услышал.', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (206, N'Пенсионерка Клавдия Петровна Сидорова заглянула в банк, увидела, что очередей нет, все окошки свободны, все операторы на местах, вздохнула и поняла, что делать ей тут нечего. 
 И пошла скандалить в районную поликлинику.', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (207, N'Едет военная колонна мимо деревни. Сидят две бабки на завалинке:  
- Смотри, Семеновна, военные!  
- Ага... Сейчас остановятся, полчаса будут карту разглядывать, потом подойдут и дорогу спросят...  ', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (208, N'Уходит на пенсию дальнобойщик и друзья ему дарят кабину от Камаза... 
 Через год приезжают в гости, он счастлив, жена сияет. 
 У неё спрашивают: 
<br> - Ну как? 
 Говорит: 
<br> - Спасибо за подарок<br> - жизнь прожила, а такого удовольствия, как в кабине, никогда не получала! Только одно плохо<br> - каждое утро открывается дверь со словами: "Пошла на х%й отсюда! "...', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (209, N'В новостях: 
 Путин: "Итоги выступления сборной РФ в Ванкувере<br> - повод для анализа"... 
 Мог бы сказать короче:<br> - "Обосрались"...  ', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (210, N'Жена подходит к мужу и говорит: 
<br> -Дорогой, у нас лампочка перегорела, почини! 
 Муж ей: 
<br> -Я тебе, что, электрик что-ли? 
 Жена опять подходит: 
<br> -Дорогой, у нас дверь плохо закрывается, посмотри! 
 Муж ей: 
<br> -Я тебе, что, плотник что-ли? 
 Жена мужу: 
<br> -Дорогой, кран течет, почини! 
 Он ей: 
<br> -Я тебе, что сантехник, что-ли? 
 Ну, ладно. 
 На следующий день муж приходит с работы, смотрит, лампочка горит, кран не течет, дверь нормально, спрашивает жену: 
<br> -Кто же это все починил? 
 Жена отвечает: 
<br> -Да, соседа попросила, он и починил. 
 Муж: 
<br> -И как же ты с ним расплачивалась? 
 Жена: 
<br> -А он сказал: "Или "давай", или спой". 
 Муж: 
<br> -Ну, и что-же ты ему спела? 
 Жена: 
<br> -А я тебе, что, певица что-ли?.', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (211, N'- Дорогой, я села на диету, поэтому буду есть только лобстеры, трюфели и омары! 
<br> - Да чё ты мелочишься! Жри уже сразу деньги!', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (212, N'Вьетнамская война... Вьетнамцы покупают у России ЭКСПОРТНЫЙ вариант МИГ-29. В первом же бою вьетнамский летчик сбивает 7 американских истребителя! Журналисты обступают вьетнамца и пытаются понять как он смог сбить 7 вражеских самолета, если у него всего 4 ракеты на борту!?Вьетнамец рассказывает: 
<br> - Прочитал я перед полетом инструкцию, а там написано в экстренном случае нажать большую красную кнопку! Ну лечу я и окружает меня 7 америкосов... Ну я думаю вот-экстренный случай и давлю обеими руками на красную кнопку! Вдруг чувствую как тяжелая, волосатая рука стучит меня по плечу и слышу: 
<br> - А ну ка подвинься ускоглазая обезьяна...', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (213, N'В начале 19-го века большинство студентов в наших вузах изучало французский. В итоге мы насовали Бонапарту и взяли Париж. 
 В начале 20-го века большинство студентов в наших вузах изучало немецкий. В итоге мы умордовали Гитлера и взяли Берлин. 
 Сейчас начало 21-го века и большинство студентов в наших вузах изучает английский... такого богатого выбора в нашей истории еще не было.', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (214, N'У одного старого дедушки была жена<br> - бабушка, которая лежала при смерти. Пошел дедушка по врачам в надежде, что кто-нибудь поможет ему спасти бабушку, и в конце концов, попал к специалисту по альтернативной медицине. Врач ему говорит: 
<br> - У вас есть только одна возможность помочь вашей жене<br> - переспать с ней. 
 Дедушка возмущенно: 
<br> - Да я старый уже, у меня на руках сам Ленин умирал, как я смогу? 
 Врач:<br> - Это единственный выход. 
 Ну, дедушка собрался с силами, и-таки исполнил свой супружеский долг. 
 Наутро просыпается<br> - бабушки рядом с ним нет. Встает, и видит: бабушка по дому суетится, блины печет, песни поет. Дедушка хлопает себя по лбу и говорит: 
<br> - Какой же я дурак<br> - я же мог Ленина спасти! ', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (215, N'- Чем отличаются девушки от парней? 
<br> - Девушке, сначала нужно сначала пойти с парнем в ресторан, театр, ювелирный магазин, что б понять стаоит ли с этим парнем ложиться в постель, а паню нужно сначала лечь с девушкой в постель, чтобы понять стоит ли с этой девушкой ходить в ресторан, театр, ювелирный магазин,', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
GO
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (216, N'Разговор двух секретарш: 
<br> - Страшное это изобретение<br> - пишущая машинка! 
<br> - Почему? 
<br> - Когда не работаешь, всем сразу слышно!', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (217, N'- У тебя секс с женой до свадьбы был? 
<br> - Нет. А у тебя? 
<br> - У меня был, но я же не знал, что ты на ней женишься...', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (218, N'Чем заняться в Новый Год?! 
 Задайте другу следуюший вопрос: 
<br> - Винни Пух<br> - свинья или кабан? 
 И наслаждайтесь... 90% отвечают, что<br> - свинья, хотя правильный ответ<br> - медведь.', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (219, N'Решил налоговый инспектр узнать доход нового русского.Пришел к нему в офис и говорит: 
<br> -За сколько времени вы можите заработать на "Волгу"?Новый русский ничинает рассуждать: 
<br> -Ну если меньше буду жене давать деньги,если все долги соберу,если родственники помогут,то,я думаю,за неделю накоплю. 
 Налоговый инспектр хмыкает,и размышляя,что перед ним совсем и не новый русский,уходит.Новый русский после ухода налоговика задумывается,а потом произносит: 
<br> -И нахрена мне нужнв эта "Волга! со всеми ее причалами и параходами,ну нахрена?', CAST(0x0000A1870097CDD4 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (220, N'Жена застряла попой в унитазе. Муж вытащить не смог и вызвал спасателей МЧС. А чтобы немного прикрыть передок жене, муж нашел сомбреро и положил ей...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (221, N'Спускается мужик по лестнице. На втором этаже сосед держит кота в руках<br />и благим матом орет ему на ухо:<br />- ХОЧУ Люсю из 56 квартиры, ХОЧУ...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (222, N'Пират получил голубую метку.<br />Подходит к боцману и спрашивает:<br />-Это что такое? Я знаю что если я получил черную метку, меня убьют, а что...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (223, N'Девушка в грузинской деревне просится переночевать в какую-то хибарку. Открывают 5 грузинов:<br />- Можешь пэрэночэвать. Только ми загадка загадаем - ...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (224, N'В психбольнице намечается поголовная стрижка.<br />Психи обсуждают как бы сломать машинку у парикмахера.<br />Один додумался:<br />- Давай в голову...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (225, N'- Милиция? Звонят из психбольницы. У нас убежал ненормальный больной.<br />- Kaкой он из себя?<br />- Лысый и лохматый.<br />- Kaк же такое может...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (226, N'Решили как-то психов перевести на самолете, а чтобы они не буянили, дали им выпить. Полетели... Через некоторое время санитар заходит в салон, видит...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (227, N'Если правой рукой вы касаетесь попы красивой брюнетки, левой рукой шикарной шатенки, а ваше лицо утопает в бюсте очаровательной блондинки - это вовсе ...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (228, N'Ватсон говорит Холмсу:<br />- Холмс, вы не видели нашу любимую миссис Хадсон?<br />- Поднимитесь на чердак, доктор, она повесилась...<br />Ватсон в...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (229, N'- Слышал, с 1-го апреля Кабмин увеличил зарплаты бюджетникам на 15 гривен?<br />- По крайней мере, со стороны власти это честно в такой день повышать ...<br clear="all" />', CAST(0x0000A1870097CDD4 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (240, N'Муж приходит вечером с работы:<br />- Дорогая, что у нас сегодня  вкусненького  на ужин?<br />- Я.<br />- Но мне нельзя ничего жирного, дорогая.', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (241, N'Кризис среднего возраста - это когда те, кто нравится, тебе уже  не дают, а те, кто даст,  ещё не нравятся.', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (242, N'Такой март, что коты впали в спячку.', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (243, N'Медведь проснулся в марте только для того, чтобы утепить берлогу.', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (244, N'Из разговора политологов:<br />- Что прошедший развитой социализм, что нынешний дикий капитализм - все это болезни, которые требуют долгого лечения.<br />- При социализме, коллега, хотя бы медицина была бесплатная.', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (245, N'Сегодня мне предстоит сделать ЭТО впервые!<br />Я еще никому такого не делала, мужчины попадались нетребовательные, и никто от меня такого не просил, а он настаивает, чтобы я ему это сделала.<br />Я буду варить борщ...', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (246, N'Ничто не звучит для кота так ужасно, как слово маленького ребёнка: "Ки-и-и-ся-я-я!".', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (247, N'- Столица России, 6 букв, первая "М"...<br />- Мордор.', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (248, N'Разговаривают две подруги:<br /> - Я вчера вызывала специалиста из фирмы "Муж на день".<br /> - И как?<br /> - Супер! Починил утюг, повесил гардину, врезал замок, отрегулировал бачок в туалете, опустошил бар и холодильник, переспал с замужней соседкой и на прощание поставил мне фингал!', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (249, N'В целях экономии бюджетных денег, правительство приняло решение: упразднить дорожный знак 1.16 "неровная дорога", ввести новый 1.16.1 "ровная дорога". Теперь вместо миллионов знаков 1.16 потребуется всего два десятка знаков 1.16.1 !', CAST(0x0000A1890097D224 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (250, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/8/6/259668.jpeg">Как отомстить жене<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (251, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/7/6/259667.jpeg">Математика делает выводы<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (252, N'Психиатр на приеме задает пациенту вопрос:<br />- Какое сегодня число?<br />- 23 октября по григорианскому календарю, 10 октября по юлианскому, 18...<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (253, N'- Помню, в детстве папа приносил мне конфеты и рассказывал, что встретил в лесу зайчика, а он ему говорит: "Я знаю, что у тебя есть хороший мальчик...<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (254, N'В Испании, есть обычай. Когда рождается мальчик или девочка, они выливают с балкона горячую воду. Что скажут на улице, так и будут звать ребёнка.<br...<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (255, N'- Эй, слышишь, в чужое счастье не лезь!<br />- Что?<br />- Говорю, руки от моей шоколадки убрала!<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (256, N'ХХХ: Скажи мне три слова и я останусь...<br />ууу: Аккордеон, транзистор, акваланг.<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (257, N'Однажды папа договорился с сыном, что он разрешит ему покататься на карусели, если тот разрешит ему выпить кружечку пива... А вечером пришла мама...<br clear="all" />', CAST(0x0000A1890097D224 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (258, N'Только два вида живых существ на Земле способны использовать любовь к себе в корыстных целях<br> - это женщины и коты.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (259, N'- Значит, Дмитрий, нам придется посадить вас на диету. Смотрите-Понедельник-яблоки, Вторник-рыба, Среда-только минеральная вода... 
<br> - А минералку можно на понедельник перекинуть??', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (260, N'Молчание и улыбка<br> - это два мощных оружия. Улыбка является способом решения многих проблем, молчание же помогает их избежать.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (261, N'- Папа, а когда я вырасту большой, я смогу делать все, что захочу? 
<br> - Нет, сынок. Тогда ты будешь уже женат...', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (262, N'- Привет, что делаешь? 
<br> - Я люблю, я скучаю, мне тебя не хватает. Ты снишься мне каждую ночь, я не могу без тебя. А ты чем занят, любимый? 
<br> - Сосиску ем...', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (263, N'Едет Горбачев по Москве на своем лимузине, видит, Никулин куда-то идет. 
 Горбачев шоферу: 
<br> - Ну-ка, притормози, я с Никулиным поздороваюсь (а любил, чертяка, в демократию поиграть),<br> - шофер машину к тротуару прижал и остановился. 
<br> - Доброе утро, Юрий Владимирович. 
<br> - Доброе утро, Михал Сергеич. 
<br> - А вы никак выпивши? Небось, с вечера припасли, сечас же до двух не продают. 
<br> - Да нет, утром купил. 
<br> - Не может быть! 
<br> - Да я и сейчас могу взять. 
<br> - Где?! 
<br> - Да хоть в этом гастрономе. Только вы, Михал Сергеич, в сторонке незаметно постойте и чтобы у продавщицы потом неприятностей не было. 
 
 Вот зашли они в магазин, Никулин сразу идет к прилавку. Продавщица с ним поздоровалась, а он ей: 
<br> - Дочка, свешай мне 300 грамм докторской колбасы и 300 грамм любительской. А теперь их мелко кубиками покроши и смешай. – ну та сделала. 
<br> - Вам для салата, Юрий Владимирович? 
<br> - Да нет, я так закусывать люблю. А теперь дай-ка мне бутылку водочки. 
<br> - Юрий Владимирович, я до двух не могу... 
<br> - Ну тогда мне ЭТО тоже не надо, я же говорил, что на закуску. 
 
 Ну что делать, дала она ему водку. Горбачев, конечно, вне себя. Устроил накачку кому следует, те – своим подчиненным. Прошло несколько дней, снова он по Москве едет и опять видит Никулина. Теперь уже специально просит шофера остановиться, чтобы проверить. И снова Никулин подшофе. 
<br> - Но теперь-то, Юрий Владимирович, явно с вечера запасли. 
<br> - Да нет. Я и сейчас могу взять при вас. 
<br> - Да невозможно же! 
<br> - А вот смотрите. 
 
 Едут они в спецраспределитель, куда Никулин вхож как директор 
 Московского цирка, и он там разыгрывает ту же сцену. Только вместо колбасы теперь черная и красная икра. И получает свою бутылку. 
 
 Горбачев рвет и мечет и требует просто сажать тех, кого поймают на нарушении правил. Проходит несколько дней. Снова Горбачев встречает 
 Никулина на улице. 
<br> - А теперь вы, Юрий Владимирович, трезвый. Навели мы, все-таки, порядок, не продают вам с утра. 
<br> - Да у меня, Михал Сергеич, сегодня просто дел много, но если захочу, я и сейчас куплю. 
<br> - Не может быть! Где?! 
<br> - Да вот хоть в этом магазине. 
 
 Заходят они в магазин, Горбачев сразу в сторонку, а Никулин прямо прошел к прилавку. 
<br> - Дочка, какой у тебя самый дорогой коньяк? 
<br> - Вот этот, за пятьдесят семь рублей. Только я сейчас вам его продать не могу. Вы мне деньги оставьте и приходите после двух. А я вам сразу бутылку отдам, чтобы вам в очереди не стоять. 
 Никулин отступает в сторону и показывает на Горбачева, который топчется у входа: 
<br> - Ты посмотри, какой у меня сегодня гость! Есть у него время ждать до двух? 
<br> - Здравствуйте, Михал Сергеич!!! Вам бутылочку завернуть или так?', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (264, N'Мужик заказывает выпивку, добавляет сверху 500 рублей и интересуется у бармена: 
<br> - Какую из девчонок посоветуешь снять на ночь? 
<br> - Вон ту рыжую. Она подруге жаловалась, что клофелин дома забыла.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (265, N'Оккyпиpoвaннaя нeмцaми pyccкaя дepeвня. Чaxлый нeмeц пoдxoдит к pyccкoй избe, cтyчитcя тyдa пpиклaдoм и opeт: 
<br> - Heмeцки зoльдaтeн xoтeть pюccки жeнcки пипиcькa!. Из избы выxoдит бyгaй 2x2 и лeнивo cпpaшивaeт: 
<br> - "П#зды, чтo ли?!"', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (266, N'Приехал из Москвы домой китаец. 
<br> - Как в Москве? 
<br> - Хорошо. Народу мало. Метро всегда полупустое. 
 ', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (267, N'В аптеку заходит дедок и обращается к аптекарше: 
<br> - Доча, я недоволен своей половой жизнью и итогами Великой Отечественной! У вас есть надувной Гитлер?', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (268, N'Офтальмолог: 
<br> - Прочтите эту строчку! 
 Пациент: 
<br> - Не могу. 
<br> - Да у вас близорукость! 
<br> - Блин! Мало того, что я неграмотный, так еще и близорукий!', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (269, N'Мужик клеит на столб объявление: "Пьяные в дупель грузчики перевезут мебель". Подходит другой мужик, читает и говорит: 
<br> - Ну и дурак же ты, кто ж тебе позвонит?! Вот, рядышком же люди повесили объявление "Трезвые грузчики перевезут мебель". После твоего у них, небось, отбоя от клиентов нет! 
<br> - Это точно. Потому что это тоже моё...', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (270, N'Приехал генерал проверять воинскую часть в Средней азии. Проверил все и решил с бойцами пообщаться. Подошел в курилку, бойцов сигаретами угостил и говорит: "Ну кормежка у вас неплохая, быт налажен все вроде нормально. А как тут у вас с бабами? " Боец отвечает: "Как сказать товарищ генерал, вообщем за дальним ангаром у нас верблюдица привязана. " Генерал пошел за ангар, нашел верблюдицу, попробовал пристроиться сзади, не получается. Вернулся в курилку спрашивает бойца: "Как вы с ней, она же высокая? " Боец: "А там у забора ящики лежат. " Вернулся генерал, нашел ящики, подставил<br> - как раз. Трахнул верблюдицу, вернулся и говорит: "Так то вроде ничего, но как неудобно. Все<br> - таки животное? " Боец: "Да что вы товарищ генерал? Очень даже удобно! Мы на ней по три человека за 20 километров в аул на блядки ездим. "', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (271, N'За стеной надрывается соседский ребенок<br> - обычная ночь. 
 Она: 
<br> - Ты все еще хочешь завести ребенка? 
 Он: 
<br> - Да, я хочу отомстить.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (272, N'Российские олигархи во главе с Путиным дружно сидят в котле в аду. 
 Черти втаскивают очередного приговоренного и забрасывают его в котел. 
 Компания видит перед собой Горбачева и мрачно офигевает. 
 Путин (ехидно): 
<br> - Михаил Сергеевич, а вы-то к нам какими судьбами? Здесь же, так сказать, по финансовым проблемам люди сидят... 
 Горбачев: 
<br> - Молчи, сопляк! Да я про%рал больше, чем вы все вместе спи%дили!', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (273, N'В субботу встречались с друзьями. 
 Один рассказал как с женой неделю назад сходили в ресторан: "... ходит по залу специально обученная девушка и с неподдельной радостью спрашивает у всех посетителей, решили ли они уже где им отмечать Новый Год, ну и, собственно, приглашает отмечать в их ресторан. Подходит к нам и спрашивает с улыбкой как у чеширского кота: 
<br> - А вы уже решили где будете отмечать НГ? 
<br> - Да, на Канарских островах, Тенерифе Пуэрто де ля Круз 
 Далее МХАТовская пауза, девушка тут же меняется в лице и очень жалобно- 
 "Возьмите меня с собой"', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (274, N'Урок русского языка в Грузинской школе. 
 Учитель: Дети! Запомните! Этого нельзя понять! 
 Слово ОТ ВАС пишется раздельно, а слово КВАС<br> - слитно.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (275, N'Мужик гуляет с собакой<br> - огромным догом. Вдруг дог срывается с поводка, подбегает к гуляющей неподалеку девушке и начинает носом задирать ей юбку. 
<br> - Чего это он?<br> - спрашивает девушка хозяина. 
<br> - Наверное, чует запах из-под юбки. 
<br> - А вы что же стоите?! 
<br> - Так я НЕ ЧУЮ!!!  ', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (276, N'Мужа с женой пригласили на бал-маскарад. Но перед самым выходом из 
 дома 
 у жены неожиданно разыгралась мигрень<br> - и ей пришлось остаться дома. 
 Она приняла таблетку аспирина и легла в постель, 
 а муж взял свой маскарадный костюм и отправился на бал... 
 Через час у женщины полностью проходит головная боль<br> - 
 и она решает тоже отправиться на бал и проследить, что там будет делать 
 ее муж, для чего она берет совсем другой костюм, не тот, который она 
 собиралась надеть сначала... 
 На балу она тут же узнает по костюму своего мужа, который танцует 
 сначала с одной девицей, потом с другой, с третьей и т. д. 
 Тогда она решила проверить, как далеко он может зайти. Она приглашает 
 его на танец (он ее не узнает) и шепчет ему на ухо: Давайте уединимся 
 где-нибудь..." Тот, естественно соглашается... 
 После того, как дело сделано, она возвращается домой. 
 Через некоторое время возвращается и ее нашкодивший муж. 
 Она, осторожно: 
<br> - Ну, как праздник? 
<br> - Ты знаешь, дорогая<br> - мне без тебя было очень скучно... 
<br> - Скучно?! А мне кажется<br> - ты очень даже весело провел время! 
<br> - Поверь, мне нет... Когда я приехал туда<br> - народу было столько, 
 что пройти негде было. Тогда мы с друзьями решили пойти на кухню 
 и поиграть в покер... Зато тот друг, которому я одолжил свой костюм 
<br> - 
 вволю натанцевался с дамами, а какая-то девица даже затащила его в 
 постель...', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (277, N'Новоиспеченный папаша со своим другом пришел в роддом. 
 Вокруг медсестры с детями бегают. 
 Идут друзья, лицами по сторонам вертят. 
<br> - Какие же все они хорошенькие в этом возрасте!!!! 
<br> - Ага, особенно в этих беленьких халатиках!!!', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (278, N'- Скажите, пожалуйста, вас ваша работа удовлетворяет? 
<br> - Вы знаете, иду на работу: вижу девки хорошие стоят, хочется. Иду с работы, те же девки стоят, но уже не хочется. Значит удовлетворяет.  ', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (279, N'Печень с тревогой ожидала предстоящей пятницы, Почки тоже волновались, 
 что придётся много работать, Глотка разминалась, Нос чесался, Желудок 
 готовился, Жопа переживала, что опять на неё найдут приключения, Ноги 
 с Языком готовились заплетаться, Голова боялась заболеть, даже Сердце 
 кровью обливалось. И только один Мозг радовался, что пятница не за 
 горами.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (280, N'В автобусе: 
<br> - Девушка, вы выходите? 
<br> - Выходят замуж! 
<br> - Девушка, вы сходите? 
<br> - Сходят с ума! 
<br> - Может, вы вылазите? 
<br> - Вылазят, когда рождаются! 
 Мужчина, пинком выпихивая ее из автобуса: 
<br> - С днем рожденья, сука.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (281, N'- Посмотрел бы ты на соседа!<br> - говорит жена.<br> - Не пьёт и не курит! 
<br> - Зато у меня член длиннее. 
<br> - А у него толще и стоит дольше! 
<br> - Откуда ты знаешь, сука? 
<br> - Это я тебя, козла, должна спросить, откуда про это соседка знает?', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (282, N'Игриво настроенный старичок сидит в автобусе напротив симпатичной молодой дамочки. Красотка кокетливо выставила напоказ свои стройные ножки. 
 Старичок возбужденно зашептал: 
<br> - Даю сто франков, мадам, если вы немножко приподнимете свою юбочку! 
 Дамочка с улыбкой приподнимает и, получив обещанную купюру, прячет ее в сумочку. Потом добавляет: 
<br> - Еще столько, и я покажу вам то место, где мне вырезали аппендицит. 
<br> - С удовольствием,<br> - говорит старичок и протягивает деньги. 
<br> - Вот, посмотрите в окно, как раз мы едем мимо этой больницы.  ', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (283, N'Встречаются трое мужиков: француз, немец, русский. И начинают спорить: у кого в барах халявы больше. 
 Француз: 
<br> - Вот у нас, приходишь в ресторан, заказываешь бокал шомпанского, а тебе еще один бесплатно дают. 
 Немец: 
<br> - Да это все фигня, вот у нас приходишь в бар, заказываешь пива, а тебе еще две кружки за так наливают. 
 Русский: 
<br> - Да, слабовато у вас как-то. Вот у нас, приходишь на дискотеку, заказываешь рюмку водки, а потом, тебя бесплатно кормят, поят, после на автомобиле довозят до дачи, там секс и опять же бесплатно, а утром бесплатно довозят до дома да еще и денег дают... 
 Француз с немцем: 
<br> - Ну ни фига себе, и что сам-то пробовал? 
 Русский: 
<br> - Да не, сам не пробовал<br> - сестра рассказывала.  ', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (284, N'- Доченька, этот парень хромой, косоглазый и лысый. 
 Не выходи за него. 
<br> - А мне и не нужен красавец! 
<br> - Я не о том. Пожалей парня, ему и так досталось от жизни.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (285, N'У меня чувство, что мир доживает последние дни. Повсюду царит взяточничество и коррупция… 
 Глиняная ассирийская табличка, 2800 год до н. э.', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (286, N'Когда проходишь IQ тест в интернете... помни что самый главный критерий определения твоего IQ<br> - это отправишь ты СМС или нет...', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (287, N'Электричка подходит к станции, в тамбуре, готовясь к выходу, стоит девочка лет 12-13ти, входит контролер: 
<br> - Ваш билетик? ? 
<br> - Ой, здравствуйте! А вы меня не узнаете? 
<br> - ? Нет. 
<br> - А так? ? (поворачиваясь боком) 
<br> - Нет. 
 В это время двери открываются: 
<br> - Так я же заяц!', CAST(0x0000A1890097D224 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (288, N'Определить женатого мужика очень легко - он всегда неадекватно реагирует на вопрос по телефону: &quot;Ты где?&quot;', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (289, N'Реклама работает. Вчера дали объявление &quot;Нужен сторож&quot;. Ночью обокрали.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (290, N'Формулу любви придумали еще древние греки, но ее строго научную рецептуру изобрел Менделеев.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (291, N'Я всегда встаю на весы с котом. Независимо от результата, кот - прожорливая скотина, а я - молодец!.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (292, N'Разговаривают двое. <br />
 - Представляешь прихожу домой, открываю шкаф - а там голый мужик! <br />
 - Hу что же тут удивительного, все жены - такие стервы, что хочешь отмочат... <br />
 - Да при чем тут жена? Я же холостой!!', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (293, N'Едут две женщины в поезде. Одна: - Не жизнь, а тоска. <br />
 - Так заведи себе любовника, да бери с него 500 баксов в месяц! <br />
 - Где ж такого взять? <br />
 - Ну двоих заведи по 250. <br />
 - Да тоже проблематично. <br />
 - Тогда 4 по 125! <br />
 Мужик с верхней полки:- Дойдете до 5 баксов – разбудите.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (294, N'Муж и жена в постели. Он начинает рукой гладить ее плечи, затем ощупывает грудь. Она начинает томно вздыхать. Его рука опускается ниже. Он водит рукой по ее животу, проходит линию бедра и... убирает руку <br />
 Жена: <br />
 - Сема! Почему ты остановился? <br />
 - Я нашел таки пульт от телевизора!', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (295, N'Если с утра у вас плохое настроение, значит, вы встали не с той... ну... не с той вы встали...', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (296, N'Купил жене кольцо с бриллиантом - так уже две недели со мной не разговаривает.<br />
— Почему?<br />
— А такое было условие...', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (297, N'Женский салат “Истерика”.<br />
Рвешь листья, давишь чеснок, рубишь мясо, ломаешь сельдерей, режешь фотографии, сжигаешь письма, бьешь посуду, громишь мебель, сыплешь соль на рану, открываешь вино, прикуриваешь сигарету, набираешь номер. Заправить слезами.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (298, N'Диалог с мужем, играющим в Starcraft II:<br />
- милый, чай остывает.<br />
- Я не могу проиграть войну из-за чая!', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (299, N'Испокон веков мужчины пропускают женщин вперед, чтобы заценить их попы, и целуют руку, чтобы спокойно посмотреть на грудь.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (300, N'Семья утром смотрит в окно. На асфальте надпись Я ТЕБЯ Н.Е. ЛЮБЛЮ!<br />
Муж: - вот людям не спится по ночам!<br />
Дочь Маша: -ну и козёл же этот Гриша!<br />
Сын Павлик: - какой дурак это написал и кому?!<br />
И только их маме Наталье Евгеньевне было понятно, какой умный у неё любовник!', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (301, N'Конец дня. Приём у ЛОРа, злого на всех и вся... Заходит следующий:<br />
 - Доктор, к вам можно?<br />
 Врач, не глядя:<br />
 - Пошёл на хуй!<br />
 - Но вы же меня ещё не осмотрели...<br />
 - Хорошо, cкажите &quot;а-а-а&quot;...<br />
 - А-А-А...<br />
 - А теперь ПОШЁЛ НА ХУЙ!!!', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (302, N'Немного о себе. Молодая, незамужняя, стройная зеленоглазая блондинка... мне и в подмётки не годится...', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (303, N'Если ты мужчина, ты в ответе за тех, кого приручил, окольцевал и зачал.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (304, N'Гидре отрубили голову, у гидры выросло две. Гидре отрубили две головы, у гидры выросло четыре. Гидре отрубили четыре головы, гидра обиделась и умерла. Я к чему. Заеб@ть можно кого угодно.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (305, N'Сегодня поздравила свекровь: &quot;Желаю Вам всего того, что желаете Вы мне... и вдвойне!&quot; И вот что странно - у неё вдруг почему- то сразу глаз задёргался...', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (306, N'Если хотите скрыть свой возраст - делайте вид, что не знаете, что такое дискета.', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (307, N'Новости порноиндустрии: Надпись &quot;25+&quot; на экране - это не возрастной ценз, а размер...', CAST(0x0000A1890097D260 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (308, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/1/7/261071.jpeg">Мини кухня для макси попугая<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (309, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/8/6/261068.jpeg">"Ей, вы, пятеро. Да, вы, четверо. Если еще раз вас троих увижу, оба получите. Ты меня понял?"<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (310, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/6/5/261056.jpeg">Смешные пальчики<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (311, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/5/5/261055.jpeg">Клубничный Джеймс Бонд<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (312, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/2/3/261032.jpeg">Папаши и карапузы<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (313, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/0/3/261030.jpeg">Метро. Час пик<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (314, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/9/2/261029.jpeg">Наш хозяин идиот!<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (315, N'Мaрьивaннa в клaссе:<br />- Вовочкa, просклоняй глaгол "голосовaть".<br />- Я голосую, ты голосуешь, он голосует, онa голосует, мы голосуем, вы...<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (316, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/6/2/261026.jpeg">Раскрыта тайна Почты России<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (317, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/5/2/261025.jpeg">Гендальф борется со снегом<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (318, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/4/2/261024.jpeg">Студентческий эконом-коктейль<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (319, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/3/2/261023.jpeg">Аватар &amp; Менделеев<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (320, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/8/1/261018.jpeg">Сегодня тепло или холодно?<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (321, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/4/1/261014.jpeg">Куриный качок<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (322, N'<img align="left" vspace="5" hspace="10" src="http://s1.tchkcdn.com/jokes/article/0/1/261010.jpeg">Смешная картинка "За секунду до..."<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (323, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/8/0/261008.jpeg">Мы не ищем легких путей<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (324, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/6/0/261006.jpeg">Дело было вечером, кушать было нечего<br clear="all" />', CAST(0x0000A198014D115A AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (327, N'- А если просто пить, а не нажираться - не пробовал, что ли? 
 - Дык, вечером думаешь что пьешь, а с утра оказывается - нажрался. . .', CAST(0x0000A198014D116E AS DateTime), 1, 0)
GO
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (328, N'Пациент говорит психотератевту: 
 - Знаете ли, у меня в последнее время возникли некоторые проблемы с 
 восприятием мира. 
 Доктор достает картину "Три богатыря", спрашивает: 
 - что вы здесь видите. 
 - Вижу троих п@доров. 
 - Почему? 
 - Ну как почему, стоят три мужика, нет ни одной женщины, разве они не 
 п@дрилы. 
 Доктор достает картину с изображением косяка летящих лебедей. Спрашивает, 
 что он видит на этой картинке. 
 - Вижу косяк летящих п@доров. 
 - Почему? 
 - Как почему, летят в ж@пы друг другу заглядывают. 
 Доктор спрашивает: 
 - Ну а как вы меня воспринимаете? 
 - Вы тоже по моему п@дор. 
 - Почему? 
 - Ну как почему, сидите здесь, картинки про п@доров собираете.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (329, N'Вчера дали пьянству БОЙ! Подробностей не помню, но с утра такое ощущение, что пьянство победило с большим отрывом. . .  ', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (330, N'Стоит парень на остановке автобуса. Подходит стройненькая симпатичненькая девушка-конфетка. 
 Парень, смотря на нее во все глаза, вполголоса: 
 - Дааа,... е..т же кто-то.... 
 Девушка тут же оборачивается. 
 -Тоже хочешь? 
 -ДА!!! Конечно!!.... 
 - Ну, пошли со мной.... Он и тебя вые..т!!! 
 ', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (331, N'Секретарша заходит в кабинет к начальнику и говорит: 
 - С этого момента у меня будет зарплата в тысячу долларов и 4 выходных дня в неделю! 
 Начальник с сарказмом: 
 - А кто это тебе сказал, милая??? 
 - Гинеколог и адвокат подтвердил!!!', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (332, N'Учительница математики спрашивает Вовочку: 
 - Вовочка, представь себе: у тебя есть двести долларов. Пятьдесят ты отдашь Машеньке, пятьдесят - Леночке, и еще пятьдесят - Танечке.  Что у тебя будет? 
 Вовочка, мечтательно глядя в потолок: 
 - У меня будет такая оргия...', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (333, N'Мужик заходит в магазин сувениров. Видит маленькую бронзовую фигурку кошки. На ценнике написано: "кошка - 1000 рублей, её история - 10 000 рублей. " 
 - Я могу купить кошку без истории? - спрашивает он продавца. 
 - Конечно, - отвечает продавец, - Но за историей вы всё равно вернётесь. 
 Мужик покупает маленькую бронзовую кошку и идёт по городу. Вдруг он замечает, что следом за ним сначала идёт одна кошка, потом другая, потом ещё. Через некоторое время за ним уже идут тысячи кошек. Мужик в ужасе начинает убегать. Кошки не отстают. Тогда он размахивается и бросает маленькую бронзовую фигурку кошки в реку. Все кошки бежавшие до этого за мужиком, тут же прыгают в воду вслед за статуэткой и тонут. 
 Мужик идет обратно, в тот же магазин сувениров. 
 - Я же предупреждал вас, что Вы вернётесь за историей, - говорит ему продавец. 
 - К черту историю! - отвечает мужик. - У Вас есть маленький бронзовый единоросс?', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (334, N'Приходит мальчик в магазин: 
 - Дайте мне бутылку водки! 
 Продавец: 
 - Не дам, мал ещё! 
 - Да меня отец послал! 
 - Ну, послал, так что ж теперь - напиваться из-за этого?', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (335, N'- Игорь, у меня есть гениальный план: давайте вместе откроем ювелирный магазин где-нибудь на Пятой авеню. 
 - Нет, давайте лучше так: вы будете открывать, а я постою на шухере...', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (336, N'Антон покупает себе новенький, сияющий хромом автомобиль. Продавец дает ему совет: 
 - Прежде чем пойдет дождь, вы должны всегда заранее намазать хромированные части вазелином. Таким образом вы сохраните его блеск надолго, и ржавчина вам не страшна! Я даю вам пузырек с вазелином бесплатно в качестве подарка от фирмы! 
 &#171; Замечательно! &#187; - думает Антон. На новой машине он едет тут же к новой подруге, которая пригласила его на обед, чтобы познакомить с семьей. Все проходит просто отлично, у родителей подруги осталось отличное впечатление от нового друга дочери. Перед самым десертом говорит дочь Антону: 
 - У нас в семье есть один забавный обычай мы определяем, кто должен мыть всю посуду. После того, как будет съеден последний кусок, за столом начинается молчание. Кто первый скажет хоть одно слово, тот и должен мыть всю посуду. 
 - Принято, - говорит Антон, - я участвую в игре. 
 Когда все поели, за столом установилось ледяное молчание. 
 5 минут, 10 минут проходят, у нашего друга стало иссякать терпение. 
 Чтобы как-то ускорить события и провоцировать реакцию у родителей подруги, он притягивает к себе их дочь и начинает ее дико тискать. 
 Никто не роняет ни звука! 
 Он хватае дочь, кладет ее на стол и трахает от души. 
 Опять тишина за столом! 
 Антон набрасываетсяна мать и трахает ее у всех на глазах. 
 Все молчат по-прежнему! 
 Антон растерянно смотрит в окно и замечает, что вот-вот пойдет дождь. 
 Он сразу вспоминает свой автомобиль и его хромовое покрытие. &#171; Необходимо смазать хромовые части вазелином! &#187; думает Антон про себя. 
 Он берет свою куртку и достает из кармана баночку с вазелином. 
 Тут вскакивает отец и кричит: 
 - Ладно, ладно! Я помою всю посуду!', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (337, N'2754-й год. 6000-й Мерседес подрезает горбатый Запорожец и резко тормозит перед светофором. Запорожец, естественно, бьет Мерс сзади. 
 Из Мерседеса вылазит Сверхновый Русский в инфракрасном пиджаке и с мобильным видеофоном. Из Запора неторопливо выходит дедок и говорит: 
 - Это же коллекционная модель, ручная сборка! Мужик, ты даже не представляешь, на какие бабки ты сейчас попал...', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (338, N'Глупая женщина пытается перевоспитать мужчину. Умная - стремится его научить. И только мудрая совершает почти невозможное - она оставляет его в покое.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (339, N'Подходит маленький мальчик к отцу и кричит: 
 - Папа, папа, ты когда-нибудь видел нашу маму голой? 
 - Ммм... эээ... 
 - Иди скорей посмотри на этот ужас!!!', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (340, N'Хоттабыч просыпается с бодуна, идет в туалет, оттуда спрашивает: 
 - Волька, я что это у меня по х%ю такие маленькие синенькие бегают  и свистят? 
 - Да это тебя менты вязали, а ты их на х%й послал.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (341, N'В высокогорном ауле мальчик подходит к старику и спрашивает: 
 - Дедушка, вам сколько лет? 
 - Сто пятдэсят восэм. 
 - Ого! А вы пьете, курите? 
 - Канэшна, а то так ваабще никагда нэ сдохну!!', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (342, N'В однокомнатной квартире живут муж с женой со своим пятилетним сыном.в один прекрасный день отец хочет трахнуть свою жену, но не может этого сделать из за того что сын дома. В конце концов отец придумал что делать, и говорит сыну: 
 ОТЕЦ: Сынок давай ты будеш смотреть из окна и всё что во дворе происходит тут же папе рассказывать,но назад не смотри. договорились? 
 СЫН: Договорились. 
 Сын подходит к окну и начинает рассказывать отцу всё что видет, а отец этим временим начинает тр%%ать жену. 
 СЫН: Дядя Ваня сажает дерево во дворе. 
 ОТЕЦ: Молодец сынок, что там дальше происходит? 
 СЫН: Тётя Таня с рынка возвращается. 
 ОТЕЦ: Молодец сынок. 
 А сам продолжает. 
 СЫН: Дядя Дима чистит ковёр. 
 ОТЕЦ: Молодец сынок, что там ещё происходит? 
 СЫН: Гришкин папа маму е%%т. 
 ОТЕЦ: С чего ты это взял? 
 СЫН: Он тоже как я смотрит в окно.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (343, N'- Как узнать жениха на деревенской свадьбе? 
 - Все просто! У него самый новый спортивный костюм!', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (344, N'- Прости! Не хотела тебе звонить, но если бы твоя жена нашла мои трусики у тебя в машине, было бы хуже... Ты их кстати нашел? 
 - Умгу... Ещё вчера... 
 - Что же ты сразу не сказал?! 
 - А вдруг это не твои?! !', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (345, N'В одной из российских деревень жил-был дед, и прославился он на всю страну тем, что умел пропердеть любую мелодию. Однажды к нему в гости приехали столичные журналисты для того, чтобы своими глазами и ушами убедиться в данном феномене старика. Один из представителей СМИ спрашивает у деда: 
 - Сможешь калинку-малинку? 
 А дед ему: 
 - Да легко! 
 Пропердел ему калинку-малинку. 
 Второй журналист спросил: 
 - А во саду ли в огороде слабо? 
 Дед: 
 - Без проблем! 
 Акулы пера просто в шоке. 
 Третий журналист: 
 - А классику сможешь? 
 Дед подумал-подумал и говорит: 
 - Давайте ноты, попробую. 
 Принесли ему ноты, старик смотрел-смотрел и говорит: 
 - Нет ребятки, не буду, здесь в трех местах обосраться можно!  ', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (346, N'Нашёл на сайте знакомств некую Эвелину с примечанием: "предпочитаю секс за деньги". Судя по фото, платить будет она...', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (347, N'Двух наркоманов судят. Судя выносит вердикт: 
 - Если каждый из вас через неделю уговорит бросить наркотики хотя-бы 5 человек, мы вас отпустим. 
 Через неделю докладывает один наркоман: 
 - Я завербовал 10 человек. 
 - Как? 
 - Я использовал мэтод кругов. Я рисовал большой круг, а рядом маленький и говорил: первый круг - это ваш мозг до употребления наркотиков, а второй - после. 
 Второй наркоман:<br/>- Я завербовал 175 человек 
 - Да ну! И как? 
 - Я тоже использовал метод кругов. Только я говорил, что маленький круг - это ваша дырка в заднице до тюрьмы, а большой - после. ', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (348, N'Приходит последний олигарх к Путину: 
 Олигарх: "Владимир Владимирович. Свой завод я вернул государству, загородный дом подарил детскому саду, заплатил налоги за себя и всех своих родственников. Прошу разрешения уехать за границу." 
 -Путин:"А как же старая русская традиция - посидеть перед дорожкой ?"', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (349, N'10 дел, которыми можно заняться в пробке: 
 Можно как следует изучить и запомнить наизусть номер впереди стоящей 
 машины. 
 Если у вас с собой есть моток изоленты, можно намотать ее на руль. 
 Очень красиво. 
 Можно стать чемпионом своего сотового телефона по Тriрlе Рор, Snаkе-2, 
 Ваllооn Shооtеr или другой интеллектуальной игре. 
 Можно наконец детально исследовать конструкцию авторучки. Попробуйте 
 разобрать и собрать ее. А теперь на время. 
 Можно заняться вышиванием, а руль использовать в качестве пяльцев. 
 Можно не спеша собрать все женские волосы с переднего и заднего сидений, 
 проверить, не осталось ли под ковриками чужой помады, следов обуви 
 на потолке. 
 Можно сделать «Вж-ж-ж-ж-ж-ж!» и покрутить руль. Это развлечет и вас, 
 и ваших соседей. 
 Пробка — это как раз то место, где можно и даже нужно заняться наконец 
 содержимым собственного носа. Неторопливая обстоятельная прочистка 
 носа и внимательное изучение содержимого наполнят вашу жизнь смыслом 
 и сделают ваши ваши пальцы ловкими и сильными. 
 Можно продать машину и купить автомобиль поближе к светофору. 
 Можно немного выпить. Все равно ехать еще не скоро.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (350, N'Шесть студентов в выходной выехали за город. Расслабились, попили, покурили... Надо в город возращаться. Договорились, чтобы не залететь после приёма дури, вести себя культурно, вежливо, не шуметь, не буянить... Тормознули тачку. 
 - Шеф! До города подбросишь? 
 - Садитесь... 
 Спокойно и неторопясь расселись, едут, молчат. Минут через десять шофер: 
 - Круто вы ребята травы нашмалялись! 
 - Как ты, дядя, определил? 
 - Дак вы на переднее сиденье все шестеро сели...', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (351, N'На операционном столе лежит тесть, хирург - зять: 
 - Сынок, ты, главное, когда начнешь, не забудь о том, что если моя супруга станет вдовой, она непременно захочет переехать жить к вам с Машей.  ', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (352, N'В Одессе бармена спросили: 
 - Хаим, че ты не доливаешь? 
 - Я стар и плохо вижу. 
 - Тогда почему ты не переливаешь? 
 - Я же не слепой.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (353, N'Тележурналисты берут интервью у молодой симпатичной девушки: 
 - А вы можете вспомнить, какой день был для вас самым счастливым днем в жизни? 
 - Вы знаете, - теряется девушка, - это был не день...', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (354, N'Случай в магазине. 
 - У вас водка есть? 
 - А 18 есть? 
 - А лицензия есть? 
 - Ну, на. Что завёлся-то сразу..', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (355, N'После российских выборов Дэвид Копперфильд признал, что на конкурсе лучших фокусников у него не будет ни единого шанса против Единой России.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (356, N'Самка богомола убивает самца сразу после спаривания, чтобы потом не нервничать: перезвонит эта тварь или не перезвонит.', CAST(0x0000A198014D116E AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (357, N'Очень ответственный петух, когда у него сильно болит горло, утром бросает камешки в окна.', CAST(0x0000A198014D11E8 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (358, N'Дискотека: - Девушка вы танцуете? - Нет. - Прекрасно, помогите мне на улице машину толкнуть.', CAST(0x0000A198014D11E8 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (359, N'- Мама, мы вчера в классе мерили у кого длиннее писька, у меня длиннее всех. - Ну так правильно, сынок, ты же учитель.', CAST(0x0000A198014D11E8 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (360, N'Девушка, вам никто не говорил, что вы похожи на Мерилин Монро? - Нет. - И правильно. Потому что вы &#8211; вылитый Джигарханян.', CAST(0x0000A198014D11E8 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (361, N'- Сегодня я получил новые часы и бумажник совершенно бесплатно! Этот пистолет будто волшебный.', CAST(0x0000A198014D11E8 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (362, N'Алкоголь не помогает найти ответ, он помогает забыть вопрос.', CAST(0x0000A198014D11E8 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (363, N'Однажды вечерком Папа Римский решил пройти потайными римскими улочками и подышать летним воздухом. И вот идет он, степенно оглядывает окрестности, как вдруг видит маленького мальчика, курящего сигарету. — Милый сын мой, — говорит Папа, — не слишком ли ты молод, чтобы курить? — Да пошел ты, батя, на х*й! — говорит мальчик. Папу чуть инфаркт [...]', CAST(0x0000A198014D11E8 AS DateTime), 5, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (364, N'- Господи! Сделай меня, пожалуйста, дурой!<br /> - Зачем тебе это? Ты и так мужчинам нравишься.<br /> - Хочу, чтобы и мне мужчины нравились!', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (365, N'Терминал по оплате штрафов может не принять мятую купюру. Этим и отличается бездушная машина от человечного инспектора ГИБДД.', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (366, N'... И Бог пообещал, что хорошие и послушные жёны будут во всех уголках мира. Затем он сделал Землю круглой... и смеялся, и смеялся, и смеялся...', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (367, N'Людей ставящих автомобили ВАЗ на учёт - автоматически ставят на учёт в Психушке.', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (368, N'Говорят, что в России самая надёжная снегоуборочная техника называется Весна. Но похоже, что и она сломалась.', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (369, N'Чтобы выжить в поле во время молнии достаточно взять с собой высокую подругу.', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (370, N'Что за выражение такое: "Ты вынесла мне весь мозг!"?<br />Так и скажи: "Дорогая, у меня не хватает аргументов, чтобы парировать твои блистательные доводы".', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (371, N'Метеорит, конец света, природные коллапсы и прочее - фигня по сравнению с проведением профилактических работ на одноклассниках.ру', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (372, N'Ура! На "одноклассниках.ру" объявлены весенние каникулы!!! Народ наконец-то выспался!', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (373, N'- Знаете что общего у журналистов и ассенизаторов?<br />- Нет. Что?<br />- То, что и те и другие занимаются дерьмом. А в чём разница между ними?<br />- Не знаю.<br />- А в том, что ассенизаторы дерьмо закапывают куда поглубже, куда подальше, а журналисты раскапывают и несут к людям в дом…', CAST(0x0000A198014D11EC AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (374, N'Женщина практически беспомощна, ....пока у неё не высохли накрашенные ногти...', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (375, N'У нас с мужем есть такая забава: приходя домой, он иногда шутливо-грозно спрашивает меня: &quot;Где он?! &quot; (любовник то есть) <br />
 Тут как-то муж ждет меня домой на обед, я врываюсь и с порога грозно ору: &quot;Где она?! &quot; и вижу в туалете тетеньку-управдома, зашедшую, как выяснилось, опломбировать счетчики. <br />
 Тетенька покраснела и сбежала со словами: &quot;Э-э... Пошла я. Пусть муж объясняется))&quot;', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (376, N'Если сложить темное прошлое со светлым будущим, получится то,что имеем..... ПАКРАЩЕННЯ УЖЕ СЕГОДНЯ!', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (377, N'Теща постирала штаны, содержимое карманов выложила (деньги, презервативы). <br />
 Жена, естественно, устроила скандал. Я в обороне 2 часа держался. И тут теща выдает: <br />
- Ой, не могу, уже два часа ржу... Доча, это ж твои джинсы-то, вообще-то...', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (378, N'Откручиваю ножки у тумбочки отверткой. Подходит муж, отбирает отвертку, уходит. Ну, думаю, сейчас все сам сделает! Возвращается, протягивает мне шуруповерт:<br />
- Так же легче!', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (379, N'Детская мудрость: если мама смеется над шутками папы, значит, в доме гости....', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (380, N'В суде:<br />
 - Надеюсь, вы знаете, что вас ждет за дачу ложных показаний?<br />
 - Да, обещали BMW...', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (381, N'Звонок в службу психологической помощи. Оператор:<br />
 - Какие у вас проблемы?<br />
 - О, у меня очень, очень серьезная проблема. Я часто испытываю просто непреодолимое желание почесать яйца. <br />
 - Так чешите.<br />
 - Понимаете, я боюсь мужа разбудить...', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (382, N'Пришел с армии. зашел в контакт .<br />
Смотрю на свой статус &quot;Пойду от армии отмажусь, скоро буду :)&quot; <br />
Обновлено 365 дней назад.', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (383, N'- Бармен, мне как обычно!<br />
 - Как обычно? Да ради Бога. Охрана - выкиньте его нах@й!', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (384, N'На вопрос анкеты &quot;Семейное положение:....&quot; гордо написал - &quot;Сверху&quot;.', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (385, N'Жена тут ребенка в парикмахерскую сводила.<br />
 Обрили почти налысо. Я бы в пять лет за это скандал устроил. А он рукой по голове проводит и спрашивает:<br />
 - Папа, правда я теперь на киви похож?', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (386, N'-Мужчина, вот Вы пялитесь на мою грудь, а у самого ширинка расстегнута! <br />
- Ну, раз заметила, значит, тоже не в глаза мне смотрела...', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (387, N'Два студента встречаются через неделю после бурной вечеринки...<br />
- Плохие дела, Серега... Когда ты Люську тра...нул, <br />
я решил сэкономить и твой презерватив наизнанку надел...<br />
- И что?!<br />
- Люська от тебя залетела, а я триппер словил.', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (388, N'—- Мама, когда я вырасту, у меня тоже будет дочка. Утром я отведу ее в садик, а потом ты отведешь меня на работу..', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (389, N'Надпись на информационном стенде в метро: <br />
 Экран сенсорный. <br />
 Ниже: <br />
 Руками не трогать!', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (390, N'Захожу к другу - у него в аквариуме пиранья плавает. <br />
 - Ее зовут Дункан МакЛауд. <br />
 - Почему? <br />
 - Раньше их было две...', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (391, N'Мне поставщик, прикинь, вместо бумажных салфеток привез авиационный двигатель от самолета… Капец! Просто там логисты попутали, он размером в целую фуру… Огроооомныыый! Я реально не могу понять… как можно попутать груз на 1 тыс, к примеру, и на 50 млн?! Начальник склада танцует и рядом фоткается... Орет типа 10 лет тут работаю первый раз такое!!!', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (392, N'- О боже что это на тебе?<br />
- Белье... постельное, просто это единственное, что налезло после праздников...', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (393, N'Народная примета: если у вас х*й через плечо — значит, вы чего-то не расслышали.', CAST(0x0000A198014D1219 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (394, N'Одноклассницы достали! Все встреться с ними и встреться!! Надо было в школе давать!!!', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (395, N'Сын спрашивает у отца: &#8212; А как змея разговаривает? Отец, глядя на тещу: &#8212; Ну, что же вы молчите? Внук интересуется!', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (396, N'Девочка пришла на утренник в костюме белочки,и до усрачки напугала сторожа детского сада..', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (397, N'Только наши парни, как настоящие джентльмены, могут открыть перед девушкой дверь и сказать: &#171;давай бл.. реще&#187;', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (398, N'Умирающий дед шепчет внуку: - Я зарыл клад! - Где, дедушка? - В земле. - Точнее, дедушка, точнее! - Земля &#8212; это третья планета от Солнца&#8230;', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (399, N'Вопреки советам военных, никогда не закрывайте глаза и не падайте ногами в сторону ядерного взрыва, ибо в любом случае вы видите это шоу первый и последний раз в жизни!', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (400, N'Хорошо, когда можно оправдать пьянство, беспорядок, грязную посуду пошлые шутки и периодические истерики тем, что ты творческая личность.', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (401, N'Мне рано заводить детей. Я морально не готов покупать киндер-сюрприз и отдавать его кому-то.', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (402, N'80% мужчин, узнав об измене жены, собирают вещи и уходят к любовнице.', CAST(0x0000A198014D1270 AS DateTime), 2, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (403, N'Я просто не представляю, что должны будут сделать наши дети, чтобы мы им сказали: "Я в вашем возрасте себе такого не позволяла".', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (404, N'В автобус входит очень полная тётка. Входящая за ней маленькая и худенькая студентка никак не может протиснуться в салон и говорит:<br /> - Ну ты и отрастила себе задницу.<br />Тётка оборачивается и отвечает:<br /> - Вот выведешь глистов, и у тебя такая же будет!', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (405, N'В городе снег сошел, а асфальт еще не нарос. Как ездить?', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (406, N'Если любишь - отпусти на волю. Не вернётся - отследи и убей.', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (407, N'Нет, я не против того, чтобы некоторые наши чиновники ездили с мигалками...<br />я лишь выступаю за то, чтобы это были мигалки автозаков.', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (408, N'Я в зеркалах по утрам не отражаюсь. Страшное, лохматое существо с безумным взглядом отражается, а я нет.', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (409, N'Стоит мужик на лестничной площадке, курит. Вдруг из соседней квартиры раздаются крики, вопли. Через некоторое время выходит сосед со сломанными 3D-очками. Мужик у него спрашивает:<br /> - Сосед, ты чего это расшумелся?<br /> - Да 3D-телевизор купил и разбил его нахер!<br /> - Зачем? - спрашивает удивлённо мужик.<br /> - Да решил порнуху посмотреть, так пять раз чуть в рот не дали!..', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (410, N'- Дочь, от тебя попахивает оптимизмом! Ты что, радовалась жизни?<br /> - Мамочка, это не я! На меня в автобусе надышали!', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (411, N'Профессор весь день приставал к молоденькой лаборантке, а вечером зажал ее в углу.<br />Будет ей наука!', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (412, N'– Мам, а почему я не похож на других обезьянок?<br />- Перестань! Твой папа – совершеннейшее и прекрасное существо!<br />- Ну а где он?<br />- А ты, сынок, не догадываешься, почему в нашей клетке еды всегда в три раза больше, чем в остальных?!', CAST(0x0000A199013B9210 AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (413, N'Корреспондент: 
 - Товарищ депутат, не дадите нашей газете интервью! 
 - У меня время - деньги! 
 - Понимаю, вот редакция выделила 1000$ на это дело. Давайте договоримся, 
 800$ вы берете себе, а 200$ - мне, под вашу расписку о 1000$. 
 - Идёт! А что за тема? 
 - О коррупции и откатах!', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (414, N'Милые жёны, поверьте, если вас раздражает ваш пополневший, храпящий ночью муж, то обязательно где-то рядом найдётся хотя бы одна женщина, которая от всего этого будет счастлива.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (415, N'- Запомни, сынок, чтобы быть хорошим человеком, ты должен быть всегда пунктуальным и осторожным! 
 - А что значит "пунктуальным", папа? 
 - Это чтобы ты всегда выполнял то, что обещал! 
 - А "осторожным"? 
 - Чтобы никогда ничего не обещал!!!', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (416, N'Мужик в магазине покупает сотовый телефон. 
 Продавец: 
 - У этой модели есть настройки громкости звонка: "без звука", "на собрании", "в комнате", "на улице". 
 Мужик: 
 - А "в цеху Челябинского тракторного» там нет?  ', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (417, N'На прогулке жена говорит мужу: 
 - Когда идет какая-нибудь смазливая женщина, ты на неё так смотришь, будто забываешь, что женат. 
 - Наоборот. Только тогда я про это и вспоминаю!', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (418, N'Железнодорожная катастрофа. С рельс сошел спецпоезд с депутатами. Приехавшие спасатели обнаружили, что местные жители успели похоронить всех. 
 - Что, все-все погибли? 
 - Ага. Некоторые, правда, пытались убедить нас, что живы, но вы же знаете политиков, они всегда врут.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (419, N'Она: Когда будешь в отпуске, с тебя завтрак в постель! 
 Он: А с тебя минет по утрам! 
 Она: Ага, чувствую, это и будет мой завтрак! !', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (420, N'Маленький мальчик идет к отцу и просит объяснить ему, что такое политика. 
 Отец отвечает: 
 - Конечно, я могу тебе объяснить. Возьмем, к примеру, нашу семью. Я приношу домой деньги, итак, назовем меня капитализмом. Твоя мама тратит эти деньги, назовем ее правительством. Мы оба заботимся о тебе, таким образом, ты у нас народ. Наша домработница это рабочий класс, а твой брат лежит в пеленках это будущее. 
 Сын не вполне уверен, что все понял, но он вспомнил пословицу: «Утро вечера мудренее» и пошел в свою спальню. 
 Ночью мальчик проснулся от крика своего младшего брата, который наложил в пеленки. Мальчик идет к спальне родителей и стучит в дверь. Но мама очень крепко спит и не отвечает на его стук. Тогда он идет в спальню домработницы и застает в ее постели своего отца. На его стук и покашливания они никак не отреагировали, занятые своим делом. Мальчик идет в свою спальню, ложится в кровать и спит дальше. Утром, за завтраком отец спрашивает: 
 - Ну, как? Разобрался ты в политике? Понял мои объяснения? 
 - Понял. 
 - Расскажи-ка нам своими словами! 
 - Очень просто. Капитализм трахает рабочий класс, а в то время правительство спит. На народ никто не обращает внимания, а будущее все в дерьме!', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (421, N'Выпил одновременно по бутылочке "Иммунеле" и "Актимель". 
 Теперь знаю, что у бифидобактерий тоже есть враждующие группировки...', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (422, N'- Сударь, соблаговолите извиниться, иначе мой муж вызовет Вас на дуэль! 
 - На французскую - на шпагах до первой крови, или на английскую - на пистолетах до смерти? 
 - Дуэль будет русской: он придет с толпой и Вас просто от... издят.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (423, N'Если рядом с вами происходит извержение вулкана и вам уже поздно убегать, застыньте в непонятной позе - сломайте мозг археологам...', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (424, N'Мужик у сексопатолога. 
 
 Сексопатолог: Батенька, боюсь, вам придется прекратить заниматься онанизмом. 
 Мужик: Что? И надолго? 
 Сексопатолог: Ну хотя бы минут на пять, а то я не могу ваш член осмотреть!', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (425, N'А я как домой захожу, теще сразу с порога говорю: 
- Клавдия Петровна! Ума у меня нет, денег нет, по дому ничего не делаю, и дочь ваша могла бы гораздо лучше замуж выйти!
 И пока она торопливо и мучительно припоминает, что же я в этом списке пропустил, я добавляю: 
- Зять Петров свой доклад окончил! Разрешите идти пить пиво к друзьям алкоголикам?', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (426, N'Бог инспектирует Ад на предмет исполнения наказаний грешникам. 
 Дьявол: 
 - А тут у нас дом бичевания. 
 Заходят в первую комнату. Стоят мужики с обнаженными задницами, изредка свистит кнут. Редкие вскрики. 
 - Здесь у нас наказывают прелюбодеев. Сколько раз за день изменил - столько ударов. 
 Заходят во вторую комнату. Задницы краснее, крики чаще. 
 - Здесь у нас наказывают карманников: сколько раз запустил руку за день в чужой карман - столько ударов. 
 Заходят в третью комнату. Ужасающий непрекращающийся вопль. Красные 
 задницы распухли до невообразимых размеров. Щелчки кнута слились в один непрерывный гул. У Бога от удивления аж 
 челюсть отвисла: 
 - А это кого так? 
 - Спамеров.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (427, N'Мимо молодого лейтенанта ГИБДД на красный свет едет крутая иномарка с номером 999. Гаишник останавливает ее, из машины выходит классная блондинка. 
 Гаишник представляется и говорит: 
 - Вы нарушили правила - проехали на красный свет! 
 Она ему:
 - А что это такое, понятия не имею. 
Гаишник: 
 - Предъявите права. 
 Она: 
 - Я когда машину покупала, мне про права не говорили. 
 Гаишник задумался и связался с начальником: 
 - Товарищ майор... - и рассказал. 
 Майор отвечает:
 - Номер машины 999 и телка классная? Ты вытащи свой... . . из брюк и подойди к ней и все будет в порядке. 
 Гаишник так и сделал - подходит к ней с расстегнутой ширинкой и этим самым... 
 Она:
 - Ну вот, опять тест на алкоголь!', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
GO
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (428, N'Северный ледовитый океан. На льдине лежит белая медведица - рядом бегает медвежонок. 
 - Мама, мама, а нас в роду коала были? 
 - Нет, сынок, не было. 
 - А гризли были? 
 - Нет, сынок, не было, только белые медведи. 
 - Ну почему же я так мерзну-то?', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (429, N'Маленький хиленький интеллигент заходит в лифт и натыкается там на огромного верзилу 2х2. Интеллигент начинает ошарашенно разглядывать соседа. Тот ему: 
 - Рост - два метра 10 сантиметров, вес - 130 килограммов, левое яйцо - 2 кг, правое яйцо 3 кг, член - 25 сантиметров в длину и 10 сантиметров в толщину... Разин Вася. 
 Интеллигент лишается чувств. Верзила приводит его в сознание и недоуменно смотрит на него. Мужичок: 
 - Не могли бы вы повторить, что вы сказали до этого? 
 - Ну, ты на меня так глядел, и я решил сразу же ответить на вопросы, которые мне задают чаще всего: рост - 210, вес - 130, левое яйцо -  2, правое яйцо - 3 кг, член у меня длиной 25 см и толщиной 10 см... 
 А зовут меня Разин Вася... 
 - Слава Богу, а мне показалось "Раздевайся"...', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (430, N'Власти Египта и Турции требуют, чтобы российские туристы фотографировались  на загранпаспорт пьяными...', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (431, N'Приходит английский лорд домой. Ему открывает дворецкий и говорит: 
 - Ну что, старый хрен, опять бухал и шлялся по девкам? 
 - Нет, Джон, ходил покупать слуховой аппарат...', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (432, N'Дети разговаривают: 
 - Меня, когда допоздна гуляю, папа ремнем порет. 
 - А меня не порет. 
 - Как это? 
 - Он когда ремень снимает, штаны падают, и мама говорит: "Ооо! Сынок, пойди-ка еще погуляй!"', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (433, N'Студенты спрашивают преподавателя: 
 - Можно мы на вашу следующую пару не придем? 
 - Да. 
 - А вы отмечать не будете? 
 - Нет, я вообще на работе не пью!', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (434, N'Пьют парень с девушкой вино. Парень разливает, а девушка ему: 
 - Мне больше не надо, а то у меня с ногами что-то странное... 
 - Что, подкашиваются? 
 - Нет, раздвигаются.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (435, N'- Прикинь, несколько раз чуть не спалился. Жену именем любовницы хотел назвать. Пришлось кошечку завести. Машкой назвал. Теперь с этим всё тип-топ... 
 - Красава. . Так, а чо такой смурной? 
 - Да, неделю назад жена собаку купила... Ашотом назвала... Вот сижу... думаю...', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (436, N'Всенародно назначенный губернатор Подмосковья Сергей Хожудоветрович Шойгу сказал, что "столица России должна быть в Сибири". 
 Двумя руками "за"! 
 И предлагаю незамедлительно приступить к переселению туда всех федеральных чиновников, начиная с премьера, даже не дожидаясь строительства новой столицы.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (437, N'-А вы знаете что детей находят в капусте? ? 
 -Где?! 
 -В капусте! 
 -ГДЕ?! ?! ?! 
 -В КАПУСТЕ!!! 
 -ГДЕ, ГДЕ, ГДЕ?! ?! ?! ? 
 -В ПИ@ДЕ!!! !!! 
 -Ну вот? а вы говорите в капусте...', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (438, N'Полночь. Морг. Санитары сидят в подсобке и дринчат казенный спирт. 
 В секционной дежурит бедный студент. Вдруг он с позеленевшим лицом 
 влетает в подсобку: 
 - Там... Там... 
 Встревоженные санитары: 
 - Что? 
 - Там покойник ожил!!! 
 - Итить твою мать! Мы уж испугались, думали, главврач с проверкой.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (439, N'Два часа ночи. Гаишник спит дома с женой, вдруг начинает дёргаться и вскрикивать: 
 - Фура! Фура! 
 Жена (успокаивающе): 
 - Пустая она, пустая!  ', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (440, N'Прежде чем женится, попробуйте вдвоём с невестой поклеить в комнате обои. Если выживете и оба останетесь довольны, вы созданы друг для друга .', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (441, N'А почему под градусом девушки кажутся красивее? 
 Организм думает что его отравили и пытается срочно продолжить свой  род.', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (442, N'Сара, как вы живете? Вы же спите с мужем в разных комнатах??? 
 - А шо такое? Нормально живем. Когда он хочет, он свистит 
 - А когда вы хотите? 
 - Тогда я его спрашиваю: "Хаим, ты свистел?! ! "', CAST(0x0000A199013B9212 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (443, N'«Красивая, с русалочьими глазами, вся сотканная из нервов и оригинальности, зовет на праздник жизни интеллигентного, очень богатого господина, способного на сильное яркое чувство; цель — брак»<br> 
<br> 
«Молоденькая самостоятельная вдовушка, хорошенькая. Из аристократической семьи, зовёт на счастливый брачный союз. Расстоянием не стесняться. Предпочтение военным».', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (444, N'Жемчужный коктейль<br> 
<br> 
Одно из самых древних пари в истории человечества было заключено между Клеопатрой и ее римским любовником Марком Антонием. Царица поспорила, что сможет за один ужин выпить вина на 10 миллионов сестерциев. Перспективы открывались весьма интересные, и Марк с удовольствием принял пари. Однако коварная женщина, естественно, схитрила. В самом начале ужина перед ней поставили бокал с винным уксусом, Клеопатра вынула у себя из уха огромную черную жемчужину, которая была известна своей баснословной стоимостью, и бросила в этот бокал. Карбонат кальция вступил в реакцию с уксусной кислотой, ослабил ее, и под конец ужина образовавшийся коктейль вполне можно было выпить одним эффектным глотком, что царица и проделала. Марк Антоний признал ее победу.', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (445, N'1 место: В сейфе одной нотариальной конторы Нью-Йорка долго хранился толстый запечатанный конверт, который надлежало вскрыть 6 апреля 1974 года, в день 100-летия со дня рождения Гарри ГУДИНИ. В этом пакете якобы были все его тайны и секреты. В назначенный день сейф был открыт – но он оказался пустым.<br> 
<br> 
2 место: Трюк, который исполняет булгаковский Коровьев на сцене «Варьете», реально существует. Он называется «Мечта скупого»: во время него в воздухе появляются монеты и дождем обрушиваются на сцену.', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (446, N'Подборка забавных розыгрышей над спящими людьми:<br> <br> 
<iframe width="853" height="480" src="http://www.youtube.com/embed/hLfzXuYbyqo" frameborder="0" allowfullscreen></iframe>', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (447, N'Нам посчастливилось жить в эпоху, когда в арсеналах докторов уже нет тех ужасающих приспособлений, которые вы увидите в продолжении...', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (448, N'Профессиональный фотограф Ирина Вернинг придумала любопытный проект, позволяющий людям оживить свои детские воспоминания...', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (449, N'Как они это делают? Как один человек заставлял уснуть весь зал? Как они гипнотизируют человека?<br> <br> 
Многие из нас задумывались над этими вопросами и возможно вы сможете получить на них хотя бы частичный ответ, прочитав эту статью.', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (450, N'В одной из соц. сетей случайно наткнулся на сообщество, в котором люди на правах анонимности делятся своим самым сокровенным... Кое-что позабавило, кое-что удивило. Странностей немало. Вот некоторые из них...', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (451, N'ОВЕН предпочитает не замечать своих лет. Он живет одним моментом, стараясь думать, что завтра вообще никогда не наступит. Его бодрость духа поддерживает в нём энергию молодости до самых старческих лет. Может, в 60 лет Овен и не станет ходить в косухе, но вот увлекаться мотоциклами будет с той же бешеной энергией, что и сорока годами ранее...', CAST(0x0000A199014017DC AS DateTime), 9, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (452, N'Человек как только родился, сразу должен понять - обратной дороги нет!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (453, N'Жизнь такая штука, что хотелось бы две штуки.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (454, N'Пап, а откуда я взялся? Да проблема сынок не в том, откуда ты взялся , а нахрена я туда полез...', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (455, N'Водолаз перепутал баллон с кислородом и веселящим газом, и погрузился не заходя в воду!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (456, N'Удача выбирает победителей, а неудача херачит всех без разбора.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (457, N'Я сегодня получил черный пояс. Пальто целиком украсть не успел.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (458, N'Близорукий снайпер прежде чем стрелять тщательно ощупывает цель.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (459, N'На конвеер по производству женской одежды требуется порядочный мужчина, который не пропускает ни одной юбки.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (460, N'Открыт самый дорогой ресторан в мире! Пообедав в нём можно снизиться на одну строчку в журнале "Forbes".', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (461, N'Она была такой сексопыльной, что все ее любовники чихать на нее хотели.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (462, N'Улыбаясь, парашютист заметил, что дернул кольцо в ювелирном магазине.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (463, N'Ваш начальник друг или враг? Вы знаете... скорее друг... я в него верю" Давал интервью Папа Римский', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (464, N'Мне еще рано думать о сексе, я только что кончил...', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (465, N'Почему туалет вечно занят? А зачем вы туда звоните?', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (466, N'Что делают находчивые девушки, чтобы запомниться парням на всю жизнь? Залетают.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (467, N'Вы хорошо смотритесь вместе. Хоть и редко бываете, - рассуждала о своих ногах проститутка.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (468, N'После обеда борюсь со сном на его территории!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (469, N'Пройдусь по Абрикосовой, сверну на Виноградную.. а там на Опохмелочной я полежу в тени.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (470, N'В Москве появился честный судья. Дорого. 834-11-73.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (471, N'Если бы Моцарт родился в Африке, то Рэп был бы классикой...', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (472, N'Василий был сантехником. Сан Техника ему присвоили еще в техникуме!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (473, N'Шумел камыш, деревья гнулись... когда слоны перепихнулись.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (474, N'Девушка одуванчик - где нашел там и вдул.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (475, N'Чтобы выжить в поле во время молнии достаточно взять с собой высокую подругу.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (476, N'Хуже соседей сверху могут быть только соседи по камере.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (477, N'Как много дедушек хороших. Кому же достанутся их бабки?', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (478, N'Мало кто радуется приходу осени... Военком начал издалека...', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (479, N'Я сплю всего четыре часа в сутки, аппетит больше не даёт.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (480, N'Глаза бояться, а руки пристёгнуты к батарее.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (481, N'Почему у хирурга три почки? Вы хотели спросить ПОЧЁМ?', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (482, N'Женщина не должна стесняться врача, священника, мужа… и... Мужчина! Вы в своем уме? Выйдите из туалета!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (483, N'В связях, порочащих меня с удовольствием поучаствую.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (484, N'Если курица летит на юг, значит пинок прилетел из севера.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (485, N'Иван 3 дня ждал Василису на сеновале, Василиса 3 дня косила!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (486, N'Хороший начальник у священников. Они на него прям молятся.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (487, N'На Садовом кольце в Москве такое количество точек с проститутками, что имеет смысл назвать его порочным кругом...', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (488, N'Встретились как-то человек-паук, человек-баклан и женщина-кошка. "Я собрал вас неслучайно" - обратился к ним Человек-психиатр.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (489, N'Анна Каренина никогда не искала лёгких путей. И поэтому легла на первые попавшиеся.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (490, N'64-летней жительнице Швейцарии помогли забеременеть в России. А она то всего лишь хотела вылечить больное сердце.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (491, N'В большой семье нет денег на качественные презервативы.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (492, N'Я иду по твоим стопам! Я - ГРИБОК!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (493, N'Людоед пленникам: На первое, второе, третье - расчитайсь!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (494, N'Я больше не пойду на нудистский пляж, у меня там рясу украли.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (495, N'Бабушка, которой сразу же уступили место в троллейбусе, не знала, о чём говорить последующие пятнадцать минут.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (496, N'Туповатый мальчик мечтающий стать режиссером, пошел учиться на кинолога.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (497, N'Благодаря грузчикам, пытавшимся затянуть гроб на ледяную гору, покойник Степан стал чемпионом мира по бобслею.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (498, N'Ира не очень любила людей, поэтому старалась их не рожать.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (499, N'Поеду на метро! Там говорят пробок вообще нет!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (500, N'Жили-были старик и капуста. Потому каждый день дед и квасил.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (501, N'Самое длинное слово в русском языке: Слово о Полку Игореве.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (502, N'Ликёро-водочный завод выпустил отрывной календарь... С пробниками на каждой страничке.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (503, N'Женщине для счастья нужно всего... одного несчастного.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (504, N'Опытный игрок в дартс может передать за проезд с любого конца автобуса!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (505, N'Самый умный в мире человек... выводит пятна через тройной интеграл.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (506, N'Жители Чукотки не боятся конца света, они там живут.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (507, N'Если цыгане пойдут в космонавты, то табор уйдет в небо.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (508, N'Все утверждения о концах света - это еще одни из попыток развести девушек на секс.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (509, N'Если мужчина пригласил на тортик с чаем, значит ты и без водки красивая.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (510, N'Любимой дарят розы, а нелюбимой - алименты.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (511, N'Чужие деньги считать неприлично, а свои - грустно.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (512, N'Когда я умру, я прошу разрезать мой ник по 1 байту и распылить его в Интернете на порносайтах.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (513, N'У нас секса нет, пойдем к ним у НИХ ЕСТЬ!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (514, N'Закончилась неделя высокой моды в Сыктывкаре. Как обычно дракой.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (515, N'Жена не хотела будить пьяного мужа, возможно это и стало причиной ДТП.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (516, N'Русские дороги - это то место, где 150 лошадей под капотом уступают одной на копытах.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (517, N'В кустах кто-то явно прятался. И судя по запаху, сильно боялся...', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (518, N'Если обвинить кого - то в том, что он не делал, то можно отправиться туда, где не был.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (519, N'Геннадий Малахов учился целоваться на девушках, чтобы в совершенстве делать это на помидорах.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (520, N'Стучать в дверь надо посильнее, если хочешь. Надпись у входа в женское общежитие.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (521, N'Сегодня разгрузочный день. В Макдональдс идем пешком!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (522, N'Когда Бог увидел, что на АвтоВАЗе наконец собрали приличную машину, у него просто камень с души упал...', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (523, N'На заводе резиновых женщин зарплату выдали товаром. Рабочие говорят - это надувательство.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (524, N'Друзья подарили кота ещё год назад. Так он в коробке до сих пор на балконе и валяется.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (525, N'Если бы Гитлер жил в наше время. Он бы смешно ловил маршрутку.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (526, N'Дети - это сущее наказание! А иногда и срущее.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (527, N'Очень позитивный человек в аду был уверен ,что попал в рай.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
GO
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (528, N'Дома я как бог. Никто меня не видит и не слышит.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (529, N'Чем больше индеец совершает подвигов, тем больше париков у его жены.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (530, N'Приснилось, что езжу на ферари. По словам супруги, газовал всю ночь.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (531, N'Конечно я знал, что она замужем, но зачем было тащить на свидание мужа?!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (532, N'Дядя Вася выходя из подъезда говорит одну и ту же фразу: "До дома я бы не дотерпел!"', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (533, N'Олигарх, уставший от любви платит проституткам, чтобы ушли.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (534, N'Чтобы квартира стала просторнее. Кристина Орбакайте сделала еще одну пластическую операцию на носу.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (535, N'Мой сын пришёл из школы пьяный. Иван Грозный все-таки попытался оправдаться.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (536, N'Когда третий-лишний, двое предохраняются.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (537, N'Курьезный случай произашел на борьбе. Внезапно заигравшая на арене лезгинка сорвала соревнования.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (538, N'Хочешь, я научу тебя летать? А я не залечу?', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (539, N'Страшный мальчик корчил рожи, но от этого становился только красивее.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (540, N'Кажется, я - расист. Нет месье Депардье, правильно сказать - россиянин.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (541, N'Не так страшен муж из командировки, как мама с родительского собрания.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (542, N'Вот уже третьи сутки следователь пытался расколоть орех. Но тот сопротивлялся: "Я буду говорить только в присутствии авокадо!"', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (543, N'Профессор уснул на лекции и своим храпом разбудил студентов.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (544, N'Селекционеры скрестили пальцы, после последнего своего эксперимента.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (545, N'Русская девушка поехала в Китай, и действительно убедилась что все мужчины одинаковые.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (546, N'Я настолько скромный, что в марширутке всегда доезжаю до конечной.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (547, N'Что сказал студент, который не сдал сессию? Служу РОССИИ!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (548, N'С твоей уникальной внешностью прямая дорога в ведущие. На радио.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (549, N'Кошка пожарника ссыт только в горящий ботинок.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (550, N'Алкоголь-враг семьи. ПАПА СПРАВИТСЯ!', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (551, N'На прошедшем заседании госдумы было решено домашнее задание для сына президента.', CAST(0x0000A19901401857 AS DateTime), 12, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (552, N'<img src="http://umor.onru.ru/media/prikol/5a3ujw.jpg" alt="" />', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (553, N'<img src="http://umor.onru.ru/media/prikol/4jpdni.jpg" alt="" />', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (554, N'Мужчины с завистью глазели,
Когда виляя чинно задом,
Я шла с изяществом газели,
А мой газёл тащился сзади...', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (555, N'Не имей сто рублей, -
Хитро молвил еврей, -
А имей сто друзей
И всех их будь хитрей.', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (556, N'ВЕСНА в РОССИИ.

Говорят, весна пришла,
Ярки дни и ночь тепла.

Мчит, бурлит вода. А то!
В ней плывут, кружась, авто...', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (557, N'Девки в офисе жгут.
Первая:
- Блин, как ухо чешется! - и пальцем в ухе наяривает.
Вторая, задумчиво, не отвлекаясь от монитора:
- Если чешется какуха, значит, ты её плохо моешь.', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (558, N'Знаю случай. Жили мальчик с девочкой, снимали однушку, платили пополам. Жили ровно до того момента, как девочка узнала, что однушка принадлежит мальчику. То есть он и её имел, и бабло с неё тряс. Мечта!', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (559, N'Искали нового системного администратора. Кандидата с фамилией Спасибухов взяли не раздумывая.', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (560, N'Россия 3 дня жила без "одноклассников". Зуб даю, через 9 месяцев страну ждет всплеск рождаемости!', CAST(0x0000A199014018AC AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (561, N'Америка ведет две войны - с терроризмом и с ожирением.<br />
Особая удача - когда попадаются жирные террористы.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (562, N'- Разбирал в шкафу носки и пришел к выводу, что 200 штук носков - это, к сожалению, не 100 пар, это 200 носков...', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (563, N'Студент идет на экзамен. Думает: "сдам - напьюсь, не сдам - напьюсь". Купил бутылку. Сунул в карман пиджака и пошел сдаваться. Отвечает на билет.<br />
Преподаватель:<br />
- Что это у вас в кармане?<br />
- Да так, ничего.<br />
- Доставайте.<br />
Студент достает бутылку, преподаватель стакан.<br />
Наливает себе и выпивает:<br />
- Хорошо. Соленый огурец есть?<br />
- Нет.<br />
- Жаль. А могло быть "отлично"', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (564, N'- Дорогой, купи мне шубу! Если ты не купишь мне шубу, то я могу простудиться и умереть, а похороны тебе обойдутся дороже.<br />
- Зато раз и навсегда!', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (565, N'Алкоголь - мой главный учитель!!! При всасывании в кровь он учит меня играть на гитаре, говорить людям правду и соблазнительно танцевать на столе...', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (566, N'Жена ворчит на припозднившегося пьяного мужа:<br />
- Где тебя черти носили?!<br />
- Зина, ты что, их тоже видела?! ?', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (567, N'Разговор двух евреев:<br />
- Изя, Вы знаете, что Коган таки пид. . . ст? !<br />
- Что? Неужели деньги не отдает?<br />
- Да не-ее. В хорошем смысле.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (568, N'Встретились два друга:<br />
- Я скоро женюсь.<br />
- А ты женишься по любви или по расчету?<br />
- Не знаю. Отец моей невесты сказал, что я женюсь по любому.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (569, N'Одесса. На балкон выходит мама и кричит:<br />
- Аркаша! Домой!<br />
Мальчик поднимает голову и кричит в ответ:<br />
- Я замёрз?<br />
- Нет! Ты хочешь кушать!', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (570, N'Встречает кошка гнома. Спрашивает:<br />
- Ты кто?<br />
- Я - гном. Пакостю людям, порчу вещи, ору по ночам, спать не даю. А ты?<br />
Кошка задумалась... .<br />
- Тогда я тоже гном.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (571, N'- Я, кстати, беременна!<br />
- Блиииин!<br />
- Уже второй раз!<br />
- Меня твои Sims когда-нибудь в могилу сведут.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (572, N'На мой вопрос о сроке годности презервативов продавец-кавказец аптечного киоска дал поразительно лаконичный и, по-моему, правильный ответ:<br />
- Адын раз.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (573, N'Экзамен в сельскохозяйственном:<br />
- Вы директор совхоза. И у вас опять неурожай. Какиеобъективные причины вы выдвинете в свое оправдание?<br />
- Ну, плохие погодные условия..<br />
- А что-нибудь посвежей?<br />
- Ну, забыли посадить.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (574, N'Приехал из Москвы домой китаец.<br />
- Как в Москве?<br />
- Хорошо. Народу мало. Метро всегда полупустое.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (575, N'Режиссер - драматургу:<br />
- Я вашу пьесу прочитал, но ставить ее не буду. Я, знаете ли, противник мата в театре.<br />
- Но там нету в тексте мата.<br />
- В тексте нет. Мат будет в зале.', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (576, N'Черный мальчик спрашивает у белой мамы:<br />
- Мам, а чего ты белая, бабушка белая, дедушка белый, все белые, а я -черный???<br />
- Ой, сынок, как вспомню ту вечеринку - хорошо, что не гавкаешь!', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (577, N'- Папа, я потерял свои таблетки! Голубенькие, ты их не видел?<br />
- У нас есть проблема и похуже, сынок...<br />
- Какая?<br />
- НА КУХНЕ ДРАКОН!!!', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (578, N'- Смотрю картинки из мультиков и не понимаю, почему у Карлсона на руках по четыре пальца?<br />
- А ты подумай хорошенько! Если у тебя с детства мясорубка за спиной? А спина-то чешется!', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (579, N'Дорогие Денежки! Очень скучаю без Вас. Обещаю приобрести для Вас новый кошелечек. Если хотите, можете пригласить своих родственников из Европы или Америки — возражать не стану. Приют обеспечу по первому разряду..', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (580, N'Сборная Лихтенштейна по футболу вместе со своими болельщиками на 2-х автобусах уехали на чемпионат мира. В стране остался сторож...', CAST(0x0000A199014019DF AS DateTime), 11, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (581, N'Отдамся в хорошие женские руки. В еде неприхотлив, налево отгулял, к туалету приучен, зарплату домой. Есть паспорт и прививки. Отзываюсь на Котю, Птеню, Солнце мое и др. Грязные носки складываю в специально отведенное место. 
 Фразу: "Мама делает по-другому! " не употребляю. Не кастрирован.', CAST(0x0000A19A014E4D27 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (582, N'- Ну, вот, через пару минут поезд уходит. И я уеду служить: 
 - Я буду ждать тебя, любимый! 
 - Не надо, иди домой, меня долго не будет.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (583, N'- Алло, это психиатрическая больница? 
 - Да. 
 - У меня угнали машину, помогите найти вора. 
 - Это не к нам, звоните в милицию. 
 - Понимаете, угнали «Запорожец» 86-го года выпуска. ', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (584, N'- У тебя секс с женой до свадьбы был? 
 - Нет. А у тебя? 
 - У меня был, но я же не знал, что ты на ней женишься...', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (585, N'Жена мужу: 
 - Слушай, я вчера случайно посмотрела список твоих звонков. Каждый третий звонок от какого-то Гены. Ты мне про него ничего не рассказывал! 
 Муж: 
 - Дура ревнивая! Во-первых, если я ещё раз узнаю, что ты "случайно" посмотрела мой телефон - молись, во-вторых, GЕNА - это ЖЕНА!!!', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (586, N'Перевыборы на Украине между Ющенко и Януковичем.Нет никакого доверия к центральной избирательной комиссии.Поэтому попросили подсчитать голоса соседнюю республику.В итоге,без вариантов победил Лукашенко!', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (587, N'В Москве выявлена преступная группа, которая продавала поддельное средство для мытья посуды "Фейри", сообщили в понедельник в пресс-службе Главного управления по борьбе с экономическими преступлениями МВД России. Основные отличия подделки - стоит дешевле, моет лучше...', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (588, N'Как-то раз на скамейке у дома престарелых сидели три старухи. Когда мимо проходил дедок, одна из них сказала ему: 
 - Спорим, что мы можем точно угадать, сколько тебе лет? 
 - Да никогда в жизни не угадаете, старые курицы! - ответил дед. 
 - Запросто, - сказала одна из бабулек. - 
 Ты только опусти брюки и подштанники, и мы сможем определить твой возраст. 
 Дед поначалу засмущался, но желание выиграть спор взяло верх, и он опустил штаны. Старухи попросили его несколько раз повернуться и несколько раз подпрыгнуть. Затем они угомонились и сказали: 
 - Тебе 87 лет. 
 - Ядрена вошь! Как вы угадали? 
 Старухи рассмеялись и ответили: 
 - Мы вчера были у тебя на дне рождения, старый ты склеротик...', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (589, N'Машина, с растерявшейся женщиной за рулем, несется в стену. 
 Остается пара метров, вдруг сидящий рядом с ней мужчина дергает ручник и автомобиль замирает в сантиметрах от преграды. Сидящие в салоне начинают его благодарить. 
 Мужик: 
 - Да ладно, я ж летчик-истребитель, просто у меня в кабине в этом месте находится рычаг катапультирования.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (590, N'В ответ на оправдание жены, что из-за стола нужно вставать с чувством лёгкого голода, муж пообещал, что с постели она завтра встанет с чувством легкого недоеба.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (591, N'Учительница в школе предлагает детям придумать предложение в коротом слово "прекрасно" употребляется дважды. 
 -Маша: " Вчера папа купил маме прекрасное платье в котором мама прекрасно выглядела". 
 -Петя: " Моя бабушка готовит прекрасное печенье которое я прекрасно кушаю ". 
 .... 
 -Вовочка: " Вчера за ужином моя сестра обьявила что беременна, а отец сказал - прекрасно, б%%%ь, прекрасно!"', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (592, N'А знаете, почему ведра с противопожарных щитов с острым дном? А чтобы пожарники, бегая с этими ведрами туда-сюда, не останавливались перекурить и попиздеть!', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (593, N'В США опубликован рейтинг неблагополучных стран, препятствующих 
 продвижению демократии в мире, где Россия стоит в одном ряду с Северной 
 Кореей, Нигерией, Венесуэлой. 
 
 В России составлен рейтинг:"А не пошли бы вы на хер со своими рейтингами!" 
 в котором США уверенно занимают 1-е место.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (594, N'Похоже, что российской правящей элите известна формула вечной жизни. 
 Иначе объяснить - зачем СТОЛЬКО воровать, - просто невозможно!', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (595, N'Самая трудная задача - перевести всех женщин своего ареала обитания на один и тот же парфюм. Задача сложная, но важная и нужная. Для их же спокойствия.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (596, N'Преподователь - студенту: 
 - Вы были в армии? 
 Студент: 
 - Нет, а что? 
 Препод: 
 - Да так... могу устроить.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (597, N'В связи с выходом в прокат очередной части &#171; Властелина колец&#187; на наших прилавках появилась новая водка &#171; Две крепости&#187; - 80 градусов. 
 Водка "две крепости" - почувствуй себя орком!', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (598, N'К сведению автомобилистов: 
 Иногда сигнализация воет не из-за того, что окна разбиты, а окна разбиты из-за того, что воет сигнализация.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (599, N'Спрашивает сын у отца откуда он. Ну отец думает, какие же дети дегенераты, и, краснея, обходя самые пикантные моменты, объясняет. 
 Закончил и спрашивает: 
 - Ну как все понял? 
 Сын в полном ауте: 
 - Вау, как оказывается все интересно. А когда Петька своего папу спросил тот ответил просто - из Красноярска.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (600, N'Два охотника пошли в лес на охоту. Целый день проходили, уставшие голодные злые, никого не подстрелились. Под вечер встретили зайца, целятся, стреляют и оба попадают. Теперь не знают как делить, уже чуть ли не до драки дело доходит. Тут один охотник предлагаем второму: 
 - Давай, сначала я тебе по яйцам ногой врежу, а потом ты мне, кто не заорет, тот 
 зайца себе берет. 
 Сказано сделано – первый второму как даст по яйцам, тот корчится, по земле валяется, прыгает, но ни звука не произнес, говорит: 
 - Ну теперь твоя очередь. 
 - Знаешь, бери лучше зайца.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (601, N'- Тетя Роза! - бросается к гостье маленькая племянница. - Как хорошо, что вы приехали. Теперь у нас будет полное счастье. 
 - Почему ты так решила? - спрашивает тетя. 
 - Потому что папа, когда узнал, что вы к нам едете, сказал: "Только ее нам для полного счастья не хватает! "', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (602, N'- Значит, Дмитрий, нам придется посадить вас на диету. Смотрите-Понедельник-яблоки, Вторник-рыба, Среда-только минеральная вода... 
 - А минералку можно на понедельник перекинуть??  ', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (603, N'Военком несколько лет гонялся за парнем. Поймал, притащил в военкомат - довоооольный. 
 -Ну, теперь два пути: или в армию, или в тюрьму. 
 -А я не могу служить. 
 -Что же это - все могут, а ты не можешь. 
 -А я пидорас. 
 -И что, доказать можешь? 
 -Могу, вот вам мой паспорт. 
 -А что паспорт? 
 -Вот, смотрите, 28 лет, ебал я весь ваш военкомат!', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (604, N'Стоят верблюд-сын и верблюд-отец. 
 Сын: Папа, а зачем нам на спине нужен горб? 
 Отец: В горбу, сынок мы накапливаем воду и когда идем по пустыне нас не мучает жажда. 
 С: Папа, а зачем нам такие копыта? 
 О: Это чтобы ходить по песку и ноги не провливались. 
 С: А зачем нам такие большие и жесткие губы? 
 О: Это чтобы в пустыне можно было есть колючки 
 С: Тогда папа объясни мне, нахрена нам весь этот тюнинг в Саратовском зоопарке?...', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (605, N'Для женщины существуют 3 вида секса. Если Выдумаете, что это "классика", "орал" и "анал", то Вы - ошибаетесь. . Это: из жалости, в благодарность и по любви', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (606, N'Хорошие девочки верят в рай, плохие – в ад, умные – в Дарвина; 
 Хорошие девочки ждут принца на белом коне, плохие – миллионера на черном «Мерседесе», умные считают обоих персонажей вымышленными; 
 Хорошие девочки спят в пижаме, плохие – голыми, умные – по ситуации; 
 Хорошие девочки ищут свои эрогенные зоны, плохие знают их, умные считают, что неэрогенных зон не существует; 
 Хорошие девочки верны мужу, плохие – любовнику, умные – обоим; 
 Хорошие девочки любят всех детей, плохие – только совершеннолетних, умные – своих; 
 Хорошие девочки не носят мини, плохие – носят, но без белья, умные – не носят мини на работу; 
 Хорошие девочки загорают в купальнике, плохие – топлесс, умные – в тени; 
 Хорошие девочки имеют работу, плохие – спонсора, умные – свой бизнес; 
 Хорошие девочки верят в чистую любовь, плохие – в частую, умные – в качественную; 
 Хорошие девочки одеваются аккуратно, плохие – вызывающе, умные – быстро; 
 Хорошие девочки становятся заботливыми женами, плохие – феерическими любовницами, умные – верными друзьями.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (607, N'Мужик заходит в ресторан, садиться за столик и видеть очень красивую женщину, сидящую напротив него. Он подсаживается к ней и говорит: 
-  Не согласились бы вы составить мне компанию? 
Она:
 - Чтобы я на это согласилась, вы должны обладать следующими качествами: у вас должен быть Мерседес S-класса, миллион долларов на счету в банке и член длиною 25 сантиметров. 
- Знаете, у меня нет Мерседеса, но есть Ламбарджини  Дябло, в банке у меня 20 миллионов, но даже ради такой суки как вы Я НЕ ОТРЕЖУ НИ САНТИМЕТРА ОТ СВОЕГО ЧЛЕНА!!!', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (608, N'Муж переодевается. Жена смотрит на него и спрашивает: 
 - Дорогой, а кто тебе так спину расцарапал? 
 Муж краснеет от смущения: 
 - Представляешь, вчера шел по улице, и вдруг с балкона мне на спину свалилас кошка... . Неужели не веришь? 
 - Конечно верю. Там губной помадой так и написано: "Это я, твоя киска! "', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (609, N'ГАИ останавливает братка, проверяет документы: 
 - Что ж вы так, гражданин хороший. В такой крутой тачке ездите, в таком прикиде, а права-то замусолены донельзя? 
 - Понимаешь, братан, всякая сволота руками их трогает.', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (610, N'Маленький мальчик возвращается домой с катка и бросает свои коньки прямо посреди коридора. Через некоторое время из комнаты выходит дедушка, замечает коньки и говорит: 
 - Внучек, это ты здесь коньки оставил? 
 - Дедушка, да откинь ты их в сторону. 
 - Ну ладно. 
 Дедушка отшвыривает ногой коньки и идет дальше, а внук кричит: 
 - Урррааааа!!! У нас теперь машина будет! 
 - С чего это ты взял? 
 - Папа маме вчера сказал: "Вот когда дед коньки отбросит, мы с тобой машину купим".', CAST(0x0000A19A014E4D28 AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (611, N'В ответ на установление в Киеве памятника Жеглову и Шарапову в Донецке установили памятник Фоксу и Горбатому!', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (612, N'- Дашь!<br />
 - Меня зовут Дарья и я не глагол.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (613, N'Английские футбольные комментаторы месяц привыкали к фамилии Аршавин (arse shaving - бритье задницы). Еще два месяца они не могли уживаться с фамилией Жирков (jerk off - мастурбировать).', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (614, N'- Абрам, ты представляешь, я наполовину еврей и наполовину украинец!<br />
- Понимаю, понимаю...! Обрезать жалко, а надкусить больно.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (615, N'- У меня ноут - я могу работать где угодно.<br />
- А у меня нету - я могу не работать где угодно.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (616, N'Мама сегодня ехала в удивительном автобусе - в нём стояла абсолютная, полная тишина. Люди входили, тихо оглядывались, молча ехали, так же тихо выходили. Не играло радио, не объявлялись остановки, даже телефоны не звонили. А знаете почему?<br />
Кондуктор сладко спала на заднем сиденье, никто не хотел будить её.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (617, N'2020-й год, бывший президент на пенсии, даёт эксклюзивное интервью молодой журналистке:<br />
 - Чим ви зараз займаєтесь?<br />
 - Я заканчиваю свою вторую книгу....<br />
 - Ооооо, ви пишете?<br />
 - Не,.... читаю.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (618, N'Странные наблюдения:<br />
 Ошибочно набранный номер телефона никогда не бывает занят...', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (619, N'Ларек, два забора, скамейка - в дрова. Настя вчера получила права.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (620, N'Да уж. Летит время. Раньше она писала ему смс: &quot;Люблю тебя, скучаю&quot;, а теперь: &quot;Молоко, батон, сметана&quot;.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (621, N'Саша: привет, че делаешь?<br />
Даша: играю со своей киской.<br />
Даша: в смысле с кошкой.<br />
Даша: я знаю о чем ты подумал, козел.<br />
Пользователь &quot;Даша&quot; удалил вас из списка друзей.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (622, N'После того, что прaвительство сделaло с нaродом - оно просто обязaно нa нем жениться!!!', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (623, N'Чем заняты в свои выходные люди, которые всю неделю не высыпались?<br />
Они высыпаются.<br />
А чем заняты те, которые высыпались?<br />
Правильно, они сверлят дрелью.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (624, N'- Дайте презерватив.<br />
- 18 есть?<br />
- Не знаю, не измерял.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (625, N'Моя подруга училась в музыкальном училище. Каждый год у них проводилось что-то вроде отчетного концерта. На одном таком концерте хор должен был петь русскую народную песню в обработке Шостаковича. <br />
 И вот во время концерта на сцену выходит ведущая и объявляет: <br />
 - Русская народная песня &quot;Как меня младую&quot; обработал Шостакович... <br />
 Хор после этого петь не смог:', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (626, N'В тюрьме:<br />
- Иванов! К тебе жена!<br />
- Ни хрена! В приговоре ниче такого не было!', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (627, N'- Экую ты, Марфа, рецессию отрастила!<br />
- Чего-чего отрастила, Кузьмич?<br />
- Темная ты, культурных слов не знаешь! Вот по телевизору говорили: наша экономика - в глубокой рецессии.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
GO
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (628, N'На крупном предприятии-производителе соков студенты проходят практику.<br />
Главный технолог рассказывает им особенности производства:<br />
- И так... Для того, чтобы получить 1 литр сока нам понадобится примерно два с половиной килограмма отборных, красивых яблок. Сидоров, ты яблоки купил?<br />
Сидоров: - Купил!<br />
Главный технолог: - Молодец. Теперь их помой и нарежь кусочками.<br />
Сидоров: - И мы будем из них делать сок?<br />
Главный технолог: - Нет, мы ими будем закусывать коньяк!<br />
Все: - А как же сок?<br />
Главный технолог: - А вот для сока в этой бочке есть дешевый китайский концентрат, который нужно правильно развести с водой!', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (629, N'Жена говорит мужу: « Дорогой, сегодня твоя очередь купать ребенка. Я устала, хочу спать. Воду в ванну я уже налила, так что иди». Муж берет на руки ребенка и идет в ванную. Через некоторое время жена слышит душераздирающий вопль. Она вскакивает с постели, бежит в ванную и видит следующее: муж держит ребенка пассатижами за ухо и полощет в ванне. Жена на некоторое время теряет дар речи, потом в ужасе кричит: «Ты изверг!!!». Муж: «Сама - изверг! Налила в ванну кипятку - руку не опустишь!»', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (630, N'Самая классная штука - это штука баксов.', CAST(0x0000A19A014E4D94 AS DateTime), 6, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (631, N'Она:<br />- А я утверждаю, что нет такого дела, которое может сделать мужчина, но не может сделать женщина!<br />Он, с подколом:<br />- Яйца почеши!<br />Она:<br />- Заглянула в холодильник, почесала.<br />Он:<br />- Блин...', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (632, N'Стрела Амура не ранит душу так, как стрелка весов.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (633, N'- Люди говорят, что я излишне старомоден.<br /> - Кто, например?<br /> - Мои крепостные в усадьбе.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (634, N'У Анны Семенович в 7-ом классе была твёрдая четвёрка.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (635, N'- Представляешь,Москву признали мировым лидером по длине пробок!<br />- Да. А ещё у нас в Москве много миллиардеров. Думаю, что эти два факта взаимосвязаны.<br />- Каким образом?<br />- Миллиардеры из-за пробок не могут перебраться в другие города и вынуждены жить в Москве.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (636, N'Возле скульптуры Церетели:<br />- Бинокли, армейские бинокли!<br />- Вы что, мужчина, - говорит турист. - Скульптура и так огромна, чуть шею не свернул, а вы тут со своими биноклями!<br />- Дак поэтому и продаю, чтоб нормально рассмотреть вы бинокль большими стёклами к себе поверните.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (637, N'Директору ЦРУ: задание не понял, но выполнил.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (638, N'Проще сгенерировать десяток идей, чем претворить в жизнь одну.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (639, N'Порой генерал путал воинский долг с супружеским.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (640, N'Совпадение взглядов - это два взгляда, встретившиеся в замочной скважине.', CAST(0x0000A19A014E4DAB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (641, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/9/5/261259.gif">Прикольная гифка "Дед и усы"<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (642, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/7/5/261257.jpeg">Смешная картинка про жену и дом<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (643, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/1/1/261211.jpeg">Подборка фантастических животных<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (644, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/0/1/261210.jpeg">Креативные фото на документы<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (645, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/9/0/261209.jpeg">Блин, кто же я тогда?<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (646, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/8/0/261208.jpeg">Суровый Челябинский спа-центр<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (647, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/3/0/261203.jpeg">Креативная реклама "Узнай тайны московских зданий"<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (648, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/2/8/261182.jpeg">Волшебные чувства на пленке от Олег Оприско<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (649, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/1/8/261181.jpeg">А нет...показалось ..<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (650, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/9/7/261179.jpeg">Хорошая жена в хозяйстве нужна<br clear="all" />', CAST(0x0000A19A014E4E94 AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (660, N'<img src="http://umor.onru.ru/media/prikol/2nimo4.jpg" alt="" />', CAST(0x0000A19A014E5414 AS DateTime), 10, 7)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (661, N'<img src="http://umor.onru.ru/media/prikol/0ywx2n.jpg" alt="" />', CAST(0x0000A19A014E5414 AS DateTime), 10, 5)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (662, N'<img src="http://umor.onru.ru/media/prikol/u89gqh.jpg" alt="" />', CAST(0x0000A19A014E5414 AS DateTime), 10, 1)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (663, N'Когда мне грустно, пью я виски
Без льда, из двухлитровой миски.
Ещё грустней - лакаю граппу,
Налив её в большую шляпу.
Коль счастлив - балуюсь шампанским
В смешенье с коньяком армянским.
Чтоб не болеть - стакан наливки
Хлобысь! - и к чёрту все прививки.
День жаркий, солнечный - просеко
Я пью, прищурив хитро веко.
А если за окном дождливо,
Я потребляю бочку пива.

Когда ж коса найдёт на камень,
Когда в душе бушует пламень,
И грустно с весело похожи
Как две с похмелья пухлых рожи,
Тогда гляжу я в небо кротко:
Ага... Сегодня будет водка...

Не стыдно мне, скорее лестно
Явить, что всем и так известно:
Сильнейший априори довод -
Пить - всё равно что.
Был бы повод.', CAST(0x0000A19A014E5414 AS DateTime), 10, 5)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (664, N'Лежу я вся такая - в неглиже...
Хотя лежать не хочется уже.

Лежу, щетюнюсь в этом неглижу -
Массаж не полагается ежу.

Но ты всегда балдишь от неглижей...
А мне хоть в петлю, хоть ещё того хужей.

Дались тебе все эти неглижи?
Расслабься, просто рядом полежи.

Погладь меня по этим неглижам...
Пройдись по самым нежным падежам.

И кончим спор об этих неглижах,
А то пошлю подальше - в падежах.', CAST(0x0000A19A014E5414 AS DateTime), 10, 7)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (665, N'Ради бабы своей все дела отложу,
Чтоб в тоске у окна не сидела.
То коня шугану, то избу подожгу... 
Ей нельзя без любимого дела!', CAST(0x0000A19A014E5414 AS DateTime), 10, 1)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (666, N'История моя представляет, скорее всего, локальный интерес. Т.е. интересна только лицам, вовлеченным в процесс, родственникам и т.д. Но, тем не менее, не могу не поделиться.
Сыну моему ... Пока не важно.
Гуляем с ним сегодня. Мальчик общительный, здоровается на улице часто.
Идут 2 девчушки-школьницы, лет по 10-12.
Ваня им:
- Привет.
Они в ответ тоже:
- Привет. - И идут дальше.
Ваня:
- Как дела - но девчушки уже отошли далеко.
Тогда Ваня мне:
- Папа, а ты почему не поздоровался?
Я что-то ответил в том смысле, что он за нас двоих поздоровался...
В ответ:
- Папа, ну их же двое, и нас тоже двое...
Смеялся я минут десять, даже жене позвонил, рассказал.
Мужик растёт, 3,5 года уже!
P.S. Жена вечером сказала, что вдвоём нас отпускать больше не будет...', CAST(0x0000A19A014E5414 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (667, N'Мы когда-то держали хомячков. Чтобы развеселить меня, мне подарили _на 8 марта_ пару Мишку и Машку. Было очень весело, учитывая, что период беременности у них 7 дней.
Но сейчас не об этом.
Когда Машка вылупила свой первый приплод, мы, чтобы им не было скучно, выпустили всех из клетки на балкон. Застекленное помещение, никакой обуви, мебели, проводов. Портить нечего.
Ну что они могут (7 хомячков) сделать в таком положении? Ха! Неглядя!
Там сушилось белье. И в сааамом дорогом пододеяльнике из шикарного комплекта Машунька сделала гнездо для своих малышей :)
Партизаны умирают, но не сдаются.', CAST(0x0000A19A014E5414 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (668, N'Приезжали тут зимой знакомые москвичи.
Рассказывали, как ездили недавно на Шри Ланку. Была масленица, и местный ланкийский персонал отеля, прочитав что-то о традициях гостей из цивилизованной Европы приготовил особый подарок - чучело Масленицы.
Прочитали цейлонские товарищи видимо не до конца...
Эти европейцы, врезав в меру, устроили вокруг чучела сначала хоровод с языческими плясками, а затем подожгли его!
А ошарашенные до крайнего предела ланкийцы, не ожидавшие такого поворота, оказывается изготовили его из крупной пластиковой куклы, украшенной текстилем.
На следующий день на пляже лежал исключительно аутентичный труп сгоревшего ребенка, а в отеле были и другие европейцы...
Ночью останки Масленицы цейлонского образца исчезли.', CAST(0x0000A19A014E5414 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (669, N'Блондинка жалуется:<br /> - У меня компьютер не видит принтер, я уже и монитор на него повернула, а он всё равно пишет, что не видит. Что мне делать?<br /> - Пальцем покажи.', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (670, N'Когда мужчина идёт к проститутке, он платит ей не за секс, а за право больше её не видеть.', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (671, N'Семейное положение: положил на семью.', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (672, N'От знаний еще никто не умирал. Хотя скелет в кабинете биологии настораживает.', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (673, N'"Жить надо так, чтобы тебя надолго запомнили. Особенно всякая сволочь". Фаина Раневская', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (674, N'Человек как только родился, сразу должен понять - обратной дороги нет!', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (675, N'Понедельники, на самом деле, не так уж и плохи.<br />Просто работа у тебя дерьмовая.', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (676, N'Просыпаюсь после корпоративной вечеринки, где конкретно перебрал… Если честно, помню только как всё начиналось, но абсолютно не помню, что было потом. Беру сотку и… я в шоке! Вижу смс от Васи: «Дорогой, всё было супер! Ты просто великолепен! О как ты божественно трахаешься!» Думаю: «Пляяяяяять!!!! Васёк! Мой лучший друг, как я мог!!!???» Смотрю, а там следующее сообщение и опять от Васи: «Мне так понравилось! Каким ты был темпераментным!!! Как ты входил в меня, снова и снова! Просто шалунишка! … Я прям краснею как это всё было мило и неприлично…»… Он краснеет… А уж как я краснею теперь… Шок! Ведь до сих пор я был нормальным мужиком! Что со мной случилось???... Да и от Васи ТАКОГО абсолютно не ожидал…. Но… ТОЛЬКО НЕ ЭТО: опять сообщение от Васи: «Милый, хочу, чтоб ты меня трахал каждый день, делай со мной всё, что хочешь, теперь ты от меня не отмажешься!» ….!!!!!!.... Надо срочно набухаться опять, иначе я этого не переживу… Лезу в бар, достаю пиво, выпиваю банку практически залпом… Потом ещё одну и ещё… Начинаю расслабляться и вспоминать… вспоминать… ВСПОМИНАТЬ…. ЕМАЁ!!!! Это же Ирка из отдела маркетинга!!! Я её в сотке подписал именем Васи, чтоб жена ничего не заподозрила!!!!!!', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (677, N'Вчера жена Петра Голопупенко родила четвертого ребёнка. Он оказался черным. Весь день из их хаты были слышны крики, маты, Петро кричал, что значит и остальные дети не от него. А к вечеру всё затихло и из их трубы повалил белый дым… Видать они наконец-то выбрали папу.', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (678, N'Как стало известно, на допросе фигурантка дела "Оборонсервиса" Евгения Васильева сказала, что огромную квартиру, в которой она сейчас находится, ей подбросили оперативники. Подбросили вместе с грудой ювелирных изделий, коллекцией картин из музеев и неким гражданином Сердюковым в халате. Причем последний был искусно подброшен прямо в кровать.', CAST(0x0000A19B0156A4EB AS DateTime), 4, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (679, N'Сообщение в газете: продам автомобильную сигнализация Stаrlinе А9, не распечатанная, в упаковке, не дорого. 
 Р.S. Не успел поставить...', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (680, N'Блондинка решила доказать, что она не дура. Для этого она перекрасилась в чёрный цвет и пошла на пастбище. Там она увидела пастуха со своим стадом и говорит ему: 
 -Давай, если я скажу сколько в твоём стаде овец, ты мне дашь за это одну овцу. 
 -Хорошо 
 -354 
 -Правильно! 
 Блондинка, довольная, уходит с наградой 
 Пастух(кричит вдогонку): 
 -А давай, если я скажу твой натуральный цвет волос, ты вернёшь мне мою собаку', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (681, N'Приходит мужик (М) к председателю колхоза (ПК) на работу наниматься, а тот спрашивает:"Кто ты по профессии?" 
 М:-Я зоолингвист, языки животных понимаю! 
 ПК:- Не может быть, пойдем проверим. 
 Заходят они на свинарник, а свинья хрю-хрю-хрю... 
 ПК:-Что она сказала? 
 М:- говорит что опоросилась 12-тью поросятами, а осталось только десять! 
 ПК:-Федька свинарь, где два поросенка? 
 А тот отвечает, что бес попутал, давно без зарплаты и все компенсирует. 
 ПК:- Вижу, языки свиней знаешь, пойдем в коровник! 
 Заходят к коровник, а там корова Му-у-у-у-у.... 
 ПК:-Что она сказала? 
 М:-Сказала, что доярка Машка на два часа на дойку опоздала! 
 ПК:<br/>-Машка, почему опаздала на дойку? 
 Машка затряслась и просит её простить, т.к. годы молодые и допозна гуляла, больше не повторится. 
 ПК:<br/>- Слышь мужик, а ты правда феномен, беру тебя на работу, пошли ко мне домой, обмоем твой прием и обговорим зарплату. Да пошли смелее, я живу один, дома кроме козы ни кого нет! 
 Заходят во двор к председателю, а из-за угла коза бежит навстречу и блеет. Председатель бьет её ногой и кричит:"Не слушай мужик эту дуру, это было только один раз и то по пьяне!"', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (682, N'Новая технология выборов - на избирательных участках вывешиваются мишени с лицами кандидатов, избирателям выдаются дротики. 
 Самый задроченный кандидат не проходит.', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (683, N'Две подруги: 
 - После того, как я от своего бывшего ушла, он мне каждый день весь в слезах звонит! 
 - Ага, прощения просит, гад?! 
 - Нет, благодарит...  ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (684, N'Во время занятия в анатомическом театре студенты решили подшутить над своей однокурсницей и положили ей в карман халата отрезанный у трупа член. 
 Но девушка оказалась с крепкой нервной системой. Она вытащила указанный предмет из кармана и громко поинтересовалась: 
 - Мальчики! Кто из вас потерял?!  ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (685, N'Разговаривают два гаишника. 
 - Слышал новость? Президент Лужкова в отставку отправил из-за какой-то ерунды! 
 - А в чем он провинился? 
 - Да доверенность какую-то потерял.  ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (686, N'Посетитель, тщетно прождав полчаса официантку с заказом, подзывает к себе хозяина ресторана: 
 - Вот вам деньги, купите цветы для вашей официантки. 
 - С удовольствием, - отвечает польщенный хозяин ресторана. - Она вам так понравилась? 
 - Совсем нет. По-моему, она скончалась... ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (687, N'В кабинет к психиатру заползает мужик с чем то в зубах. Психиатр: 
 - Ой, и кто это к нам пришёл? Кошечка? 
 Мужик ползёт в угол. Врач умилёно следует за ним: 
 - Собачка? 
 Мужик провёл рукой по плинтусу и пополз в другой угол. Врач не отставая: 
 - А, наверное ёжик! Нет? Черепашка? 
 Мужик вынимает провод изо рта и говорит: 
 - Слышь, мужик, ты мне дашь спокойно Интернет провести или нет?!  ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (688, N'Сидят двое, выпивают. Один разоткровенничался: 
 - А помнишь, тебя в прошлом квартале премии лишили? 
 - Помню. 
 - Так это я капнул. А помнишь, тебе выговор объявили? 
 - Помню. 
 - Так это я капнул. 
 Тогда второй ему с досады: 
 - А помнишь, у тебя два года назад сын родился? 
 - Помню. 
 - Так это я капнул… ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (689, N'- В понедельник я всегда чувствую себя Робинзоном Крузо. 
 - Это почему? 
 - Очень скучаю по Пятнице!..', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (690, N'Интервью у президента одной страны: 
 - Говорят, что в вашей стране притесняют гомосексуалистов? 
 - Пидарасов, что ли? 
 ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (691, N'Звонок в четыре утра: 
 - Алё! Это общество защиты животных? 
 Медленный ответ заспанного человека: 
 - Ну и кто тебя обидел, козёл?', CAST(0x0000A19B0156A4FC AS DateTime), 1, 1)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (692, N'Молодой человек, пытаясь справиться с автоматом для продажи сигарет  в холле отеля, нечаянно ударил локтем в грудь проходящую мимо симпатичную  девушку. 
 - Я приношу самые глубочайшие извинения, - говорит он ей, - но если  ваше сердце такое же мягкое, как ваша грудь, то вы меня, наверное,  простите. 
 - Я вас прощаю, - отвечает она с улыбкой, - а если и все остальное  у вас столь же твердо, как и ваш локоть, то я живу в номере 603.', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (693, N'Просыпается Снегурочка после Нового года, и к Деду Морозу: 
 - Слышь, дед, после вчерашнего ничего не помню. 
 - Ну когда к детишкам на елку пришли, ты уже была пъяная, потом еще пару стаканов намахнула, и начала стриптиз танцевать. 
 - Я-то и думаю, че у меня полные трусы конфет.', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (694, N'- "Борт 1418", я "Земля"!! Потерял вас с экранов радаров, что с топливом и высотой? Если слышите меня, качните крылом!!! 
 - Я "Борт 1418", слышу вас отлично, топливо на нуле, высота тоже. Уже целый час нахожусь в ангаре 2. Если слышите меня - качните вышкой.', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (695, N'В Кувейте , на счет родившегося, государством кладется 20000$ ... и сумма вклада растет вместе с ним. 
 В отечестве нашем, при рождении человека на него кладется хер... и чем старше человек , тем на больший хер он вправе рассчитывать...', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (696, N'Сын звонит домой: 
 - Ма, привет - папу позови!.. Па, привет - Спартак выиграл? 
 - Да, конечно!.. Маму позвать?! 
 - Угу... Ма, слышала?! Папа разрешил!!', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (697, N'"Случайными бывают только браки, - говорила мне бабушка. - А в любовники нужно брать человека надежного".', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (698, N'Встретились двое новых русских, разговорились. Разговор зашёл об их надоевших жёнах. 
 - А я от своей легко избавился. 
 - Как? 
 - Купил ей "Шевроле". Она на нем поехала, скорость - под 200, а тут  - поворот... Машина - вдребезги, жена - на том свете. 
 - Здорово, надо попробовать. 
 Через неделю: 
 - Ну, как дела? 
 - Плохо. Купил ей "Шевроле". Она поехала, скорость под 200, поворот, машина - вдребезги, жена жива осталась. 
 - Хм, ну, попробуй "Альфа-Ромео". 
 Через неделю: 
 - Ну, а теперь как? 
 - Всё равно плохо. Машина вдребезги, столб - вдребезги, гаишник заикается, а ей хоть бы хны! 
 - Хм... Ну, попробуй "Ягуар". 
 Еще через неделю: 
 - Ну, как дела? 
 - Прекрасно, надо было сразу с ягуара начинать. Не пришлось даже никуда ехать - он её прямо в гараже нахуй разорвал!', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (699, N'2030-й год. Новый русский приобретает для своей фирмы новинку - 
 секретаршу-робота с внешностью Памелы Андерсон, печатающую со скоростью 
 500 знаков в минуту, говорящую на 8-ми иностранных языках и обладающую 
 энциклопедическими познаниями. Он, естественно, приглашает друга, чтобы 
 похвалиться: 
 - Ты гляди, Колян, какая клевая телка, все умеет! 
 - Да, Вован, это ваще! Слушай, может, и мне такую же купить? Дай я ее 
 тут че-нибудь подиктую, типа потестирую. 
 - Без базара! 
 Вован выходит из кабинета. Вдруг через несколько минут оттуда раздаются 
 ужасные крики. Вован хватается за голову: 
 - Ой, блин, я ж его забыл предупредить, что у нее во рту точилка!', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (700, N'"Здравствуй мама. Мы живем хорошо. Недавно у нас родился ребенок, но так как у жены не было молока, то мы отдали его на кормление черной женщине. И, представляешь, мама, ребенок почернел! ". 
 Ответ матери сыну: 
 "Знаешь, сынок, у меня вас было пятеро и у меня тоже не было молока, и я отдавала вас на кормление корове, но что характерно, рога выросли только у тебя одного".', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (701, N'Приходит мужик с помятой мордой на вин.завод и просится на работу дегустатором. Директор говорит:<br/>-Да ты знаешь, что дегустаторов по всей стране по пальцам пересчитать можно.Это особый дар. А мужик отвечает:<br/>-А вы меня проверьте. Ну собирают комиссию, секретарша приносит бокал с вином и протягивает мужику. Тот понюхал, пригубил и выдает:<br/>-Шардоне, урожай 1980г,собран на левом берегу Днестра. Вся комиссия во главе с директором в ауте. Директор шепчет секретарше, та снова приносит очередной бокал. Мужик:<br/>-Фетяска, урожай 1982г, собран на склоне такой то горы, в таком то месте и т.д. Комиссия снова в шоке -все правильно. Директор снова, что то шепчет секретарше и та снова приносит очередной бокал. Мужик опять понюхав и пригубив:<br/>-Моча женская, третий месяц беременности, могу сказать от кого! Деректор подпрыгивая как ужаленный: Нет,Нет, не надо, мы вас берем.', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (702, N'В казарме раздается телефонный звонок и проходивший мимо младший офицер поднимает трубку: 
 - Да! 
 - Скажите, сколько в вашей части джипов? 
 - Два, сэр, но один из них не работает, а на втором ездит эта жирная задница полковник Рассел! 
 - Что, такая жирная? 
 - Так точно, сэр, жирнее и представить трудно! 
 - А знаете ли вы, с кем разговариваете? 
 - Нет, сэр. 
 - Вы разговариваете с полковником Расселом! 
 - А знаете ли вы, с кем разговариваете? 
 - Нет. 
 - Ну тогда пока, жирная задница Рассел!', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (703, N'-Руки моей дочери просили сразу двое:инжинер и журналист. 
 -И кому улыбнулось счастье? 
 -Инженеру.Она вышла замуж за журналиста.', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (704, N'- Интересно, а у тех, кто не берет взяток, в кабинете тоже есть портрет Путина? 
- Ну ты даёшь! Откуда же у них свой кабинет?', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (705, N'Когда человек с деньгами встречает человека с опытом, человек с опытом уходит с деньгами, а человек у которого были деньги уходит с опытом.  ', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (706, N'- Я вас вынужден огорчить, ваша дочь вчера в клубе напилась! 
 - Врёшь! Она вчера в рот ничего не брала! 
 - Эээ... кажется, я огорчю вас дважды...', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (707, N'Зарплата - это наркотик. 
 - В день выдачи зарплаты беспричинно повышается настроение, хочется шутить и смеяться (Как после приема дозы) 
 - Получив зарплату один раз вы уже не можете без неё (Вызывает привыкание) 
 - При долгом отсутствии зарплаты наступает депрессия, весь мир видится в черных тонах (Сами все понимаете) 
 - Если по каким-то причинам доза зарплаты оказалась больше нормы, эйфория усиливается (При передозе реально загнуться от счастья) 
 - При длительном потреблении зарплаты требуется регулярное увеличение дозы (Старая доза довольно скоро переставляет вставлять)', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (708, N'Мужик звонит приятелю-гинекологу: 
 - Андрюха, привет, ты где?... Да не горячись ты, не горячись! Так бы сразу и сказал, что на работе.', CAST(0x0000A19B0156A4FC AS DateTime), 1, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (709, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/8/7/261378.jpeg">Ох уж эти новости..<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 3)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (710, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/6/7/261376.jpeg">К такому жизнь меня не готовила!<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (711, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/5/7/261375.jpeg">Прикольная картинка со Сталином<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 1)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (712, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/3/8/261283.jpeg">Идете ночью и видите это..<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (713, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/2/8/261282.jpeg">Прикольное фото "Правильный турист"<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 1)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (714, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/1/8/261281.jpeg">Памятка для блондинок и не только<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (715, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/0/8/261280.jpeg">Полицейские несут раненого коллегу<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (716, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/8/7/261278.jpeg">Мадемуазель Круассан<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (717, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/7/7/261277.jpeg">Идеальное сочетание для полного расслабления<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (718, N'<img align="left" vspace="5" hspace="10" src="http://s0.tchkcdn.com/jokes/article/6/7/261276.jpeg">"Красотка" Барби без макияжа<br clear="all" />', CAST(0x0000A19B0156A4FD AS DateTime), 3, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (728, N'<img src="http://umor.onru.ru/media/prikol/2k8pcj.jpg" alt="" />', CAST(0x0000A19B0156A724 AS DateTime), 10, 2)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (729, N'<img src="http://umor.onru.ru/media/prikol/dr6d64.jpg" alt="" />', CAST(0x0000A19B0156A724 AS DateTime), 10, 4)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (730, N'<img src="http://umor.onru.ru/media/prikol/qc7agq.jpg" alt="" />', CAST(0x0000A19B0156A724 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (731, N'Маш! Ты так заметно похудела!!!
Расскажи-ка, как? И я хочу!»
«Совершенству в мире нет предела!
Щас тебя, подруга, научу!

Вырезаешь из «Плейбоя» тётку,
Чтоб с фигурой, как у Мэрилин,
В холодильник крепишь эту фотку,
К полке, где сплошной холестерин

Ты хранить привыкла, где сосиски,
Где сыры, колбаска, сала шмат…
Как откроешь – видишь эту киску,
И не лезет в горло карбонат!»

«Здорово!» «Но только знай, подруга –
Есть эффект побочный! Оттащить
Не могу от полки той супруга –
Он по швам почти уже трещит!»', CAST(0x0000A19B0156A724 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (732, N'Дарите женщинам цветы:
Ромашки, розы, георгины
И живописные картины
Необычайной красоты.
Дарите женщинам стихи:
Поэмы, вирши и сонеты,
И шоколадные конфеты,
И иностранные духи.
Дарите женщинам любовь:
Земную, глупую, святую,
И греческих богов статуи,
И огородную морковь.
Дарите женщинам уют,
Везде: на улице и дома -
Своим. А если незнакомым -
То, что едят и то, что пьют.
Дарите женщинам все то,
Что в доме может пригодиться:
Тарелки, чашки и корытца,
Сковороду и долото.
Дарите женщинам комфорт
И в белом золоте алмазы,
Брильянты, стразы и топазы,
Ну, на худой конец, хоть торт.
Дарите женщинам престиж,
Пятиэтажные квартиры,
Рубины, платину, сапфиры,
Поездки в Лондон и Париж.
Дарите женщинам покой
Материальный и душевный,
Причем не палочкой волшебной,
А только собственной рукой.
Дарите женщине своей
Поля, леса, озера, реки,
Луну и Солнце, все на свете,
Короче, дачу стройте ей.
Дарите женщинам тепло:
Попарьтесь с ними в русской баньке,
И расскажите на ночь байки
Про то, что чисто и светло.
Дарите женщинам себя -
Без сожаленья, без остатка,
Альбомы, книжки и тетрадки,
И плащ-палатки от дождя.
Дарите женщинам детей:
Капризных, бойких и не очень,
Шепчите каждой днем и ночью
О том, что вы верны лишь ей.
Купите нижнее белье:
Не можете себе представить,
Как два кусочка мятой ткани
Способны вдохновить ее.
Сходите к женщине домой,
Купите женщине одежду.
Вселите в женщину надежду.
Ей посвятите выходной.
Сводите даму в ресторан,
И накормите до упаду,
Вина старинного прохладу
Налейте женщине в стакан.
Сводите женщину в яхт-клуб
Спустите вниз на горных лыжах,
И с парашютной скиньте вышки
(Да, не забудьте парашют!).', CAST(0x0000A19B0156A724 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (733, N'Не в защиту мата 


Быль 

Редактор женского журнала, 
Культурная, само собой, 
Однажды поутру шагала 
Вдоль по дорожке дворовОй. 

А двор у нас – что та поляна, 
Трава, цветочки, камни, мох, 
Короче чисто икебана... 
А между тем водитель-лох 

Всей окружающей природой 
Нисколько был не изумлён 
И хладнокровно задним ходом 
Припарковался на газон. 

Но тут редакторша отважно 
Вступила в трудный монолог, 
Таким пустила трёхэтажным, 
Не всякий бы филолог смог. 

Ему вдобавок обещала 
На полный бэнц невпроворот 
Задуть под брюхо коленвалом 
И в пасть засунуть дристамёт! (*) 

Парнишка сразу виновато 
Подался Жопелем (**) вперёд. 
.................................................. .. 
Я не в защиту авто-мата, 
Но чтоб культурным был народ. 


Из кладовой авто-мата: 
(*) глушитель 
(**) Опель', CAST(0x0000A19B0156A724 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (734, N'Учился он в институте в 70х годах прошлого века. На курсе парней было процентов 30. Вот один чудик где-то раздобыл справку, с подписями врачей, с печатями, что он импотент. Так вся женская часть курса посчитала своим долгом проверить, правда это или нет.', CAST(0x0000A19B0156A724 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (735, N'Мой HTC Velocity 4G иногда в кармане шорт включается сам по себе и несмотря, что его нужно разблокировать протащив кольцо, начинает активничать. Обычно просто звонит кому-нибудь из адресной книги, но сегодня он превзошёл себя: опубликовал одну из фотографий в моём фейсбуке.:)', CAST(0x0000A19B0156A724 AS DateTime), 10, 0)
INSERT [dbo].[Joke] ([JokeId], [Description], [CreatedDate], [ResourceId], [Rating]) VALUES (736, N'Кассир уличного биотуалета способна задержать дыхание на 5-7 часов.', CAST(0x0000A19B0156A724 AS DateTime), 10, 0)
SET IDENTITY_INSERT [dbo].[Joke] OFF
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (1, N'anekdotov.net', N'http://anekdotov.net/export/randomanekdots.rss', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (2, N'foolks.org', N'http://foolks.org/feed/rss/', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (3, N'fun.tochka.net', N'http://fun.tochka.net/rss/all/', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (4, N'anekdot.ru', N'http://www.anekdot.ru/rss/export_j.xml', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (5, N'anekdotoff.com', N'http://anekdotoff.com/feed/rss', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (6, N'prikol.bigmir.net', N'http://prikol.bigmir.net/rss/anekdots/', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (7, N'prikols.in.ua', N'http://prikols.in.ua/rss/jokes/', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (8, N'prikolnianekdot.ru', N'http://prikolnianekdot.ru/rss/index.html', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (9, N'shytok.net', N'http://www.shytok.net/rss.php', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (10, N'umor.onru.ru', N'http://umor.onru.ru/rss', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (11, N'miranekdotov.com', N'http://miranekdotov.com/rss.xml', 1)
INSERT [dbo].[Resource] ([ResourceId], [Name], [Url], [TypeId]) VALUES (12, N'shortiki.com', N'http://shortiki.com/rss.php', 1)
SET IDENTITY_INSERT [dbo].[ResourceProcessingRule] ON 

INSERT [dbo].[ResourceProcessingRule] ([ResourceProcessingRuleId], [ResourceId], [Rule], [Argument], [Active]) VALUES (1, 2, N'RemoveFrom', N'Запись', 1)
INSERT [dbo].[ResourceProcessingRule] ([ResourceProcessingRuleId], [ResourceId], [Rule], [Argument], [Active]) VALUES (2, 1, N'RemoveFrom', N'anekdotov', 1)
INSERT [dbo].[ResourceProcessingRule] ([ResourceProcessingRuleId], [ResourceId], [Rule], [Argument], [Active]) VALUES (3, 3, N'RemoveFrom', N'Array', 1)
INSERT [dbo].[ResourceProcessingRule] ([ResourceProcessingRuleId], [ResourceId], [Rule], [Argument], [Active]) VALUES (4, 1, N'Replace', N': -;:<br/>-', 0)
INSERT [dbo].[ResourceProcessingRule] ([ResourceProcessingRuleId], [ResourceId], [Rule], [Argument], [Active]) VALUES (6, 2, N'Replace', N' -;<br> -', 0)
INSERT [dbo].[ResourceProcessingRule] ([ResourceProcessingRuleId], [ResourceId], [Rule], [Argument], [Active]) VALUES (10, 5, N'Replace', N' -;<br> -', 0)
INSERT [dbo].[ResourceProcessingRule] ([ResourceProcessingRuleId], [ResourceId], [Rule], [Argument], [Active]) VALUES (11, 1, N'Replace', N' -;<br> -', 0)
SET IDENTITY_INSERT [dbo].[ResourceProcessingRule] OFF
INSERT [dbo].[ResourceType] ([ResourceTypeId], [Name]) VALUES (1, N'RSS')
ALTER TABLE [dbo].[Joke] ADD  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[ResourceProcessingRule] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Joke]  WITH CHECK ADD  CONSTRAINT [Joke_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([ResourceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Joke] CHECK CONSTRAINT [Joke_Resource]
GO
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD  CONSTRAINT [FK_Resource_ResourceType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ResourceType] ([ResourceTypeId])
GO
ALTER TABLE [dbo].[Resource] CHECK CONSTRAINT [FK_Resource_ResourceType]
GO
ALTER TABLE [dbo].[ResourceProcessingRule]  WITH CHECK ADD  CONSTRAINT [FK_ResourceProcessingRule_Resource] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([ResourceId])
GO
ALTER TABLE [dbo].[ResourceProcessingRule] CHECK CONSTRAINT [FK_ResourceProcessingRule_Resource]
GO
USE [master]
GO
ALTER DATABASE [Aachen] SET  READ_WRITE 
GO
