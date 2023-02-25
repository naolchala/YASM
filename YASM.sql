-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 25, 2023 at 11:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `YASM`
--
CREATE DATABASE IF NOT EXISTS `YASM` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `YASM`;

-- --------------------------------------------------------

--
-- Table structure for table `Blogs`
--

CREATE TABLE `Blogs` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Blogs`
--

INSERT INTO `Blogs` (`id`, `title`, `content`) VALUES
('01eceb20-626d-45ef-812b-a1796fa789ec', '13 Amazing React Libraries You Should Try in 2021', 'There are literally 100s of great React libraries to choose from, but which libraries do you need most for your React projects? \n\nIn this article, were going to break down 13 libraries worth adding to your React projects in five essential categories.\n\nEach of them will cover virtually every major tool you need, plus well cover what are the best ones to choose in 2021 and beyond.\n\nLets dive right in!\n\n## A Quicker Create-React-App\nIf you want to create a React project, you probably reach for a tool like Create-React-App.\n\nWhile Create-React-App remains an amazing tool and allows you to create a React project by running a single command, there is a new competitor to it that you should know about called Vite.\n\nCreate-React-App uses Webpack under the hood to build our React code for development. But build tools have emerged that compete with Webpack in speed.\n\nVite is one such build tool that uses a faster bundler called esbuild. In short, it makes use of the browsers native ES modules to make for a quicker development experience.\n\n## A (Better) Data Fetching Library\nWhen it comes to basically any React application, we have to manage some server state.\n\nThis means were fetching data from an external server (like an API) and were bringing that data into our app, which is then combined it with the local state that we have across our apps components.\n\nMany React developers, no matter their skill level, can have a hard time figuring out how to manage server state with their local state. Most developers resort to a library like Redux as a solution.\n\nIn the past year, a couple of libraries have emerged that make it very easy to manage server state within our React components. These are React Query and SWR.\n\nThey help us with fetching data by giving us some very helpful custom hooks. But what is most important about them is that they have their own internal cache.\n\nThis built-in cache allows us to very easily integrate external data with our app. We assign each query to a custom key. To read or update any data we have fetched, we just need to reference that key!'),
('2a82e354-2b35-4e2e-afab-8627bd47d5e0', 'what ', '```\r\nalert(\"Hello world\");\r\n```'),
('4308b65d-f36c-488e-b973-0a8dd26233aa', 'The Importance of Learning in University', 'As students embark on their university journey, they are presented with a plethora of opportunities and challenges. While making new friends and exploring extracurricular activities are important, learning remains the primary goal of higher education. In this article, we will discuss the importance of learning in university and how it can shape your future.\r\n\r\n## Acquisition of Knowledge and Skills\r\n\r\nLearning in university allows students to acquire knowledge and skills that are essential for their future careers. Students have access to a diverse range of subjects and courses, which enable them to explore their interests and develop expertise in various fields. Whether it&qout;s learning about history, science, or business, students can gain a deep understanding of their chosen subjects and develop critical thinking and analytical skills.\r\n\r\n![Acquisition of Knowledge and Skills](https://cdn.pixabay.com/photo/2015/02/18/11/50/workplace-640854_1280.jpg)\r\n\r\n## Personal Growth and Development\r\n\r\nLearning in university also provides opportunities for personal growth and development. By attending lectures, participating in group discussions, and engaging in research, students can improve their communication, teamwork, and problem-solving skills. They also have the chance to explore new perspectives, challenge their beliefs, and expand their worldview. Additionally, students can learn how to manage their time effectively, set goals, and develop a strong work ethic.\r\n\r\n![Personal Growth and Development](https://cdn.pixabay.com/photo/2016/11/19/14/00/person-1838584_1280.jpg)\r\n\r\n## Preparation for Future Careers\r\n\r\nOne of the primary goals of learning in university is to prepare students for their future careers. By gaining knowledge and skills, and developing personal and professional competencies, students are better equipped to enter the workforce and pursue their desired careers. Additionally, universities often provide opportunities for internships, co-op programs, and networking events, which can help students gain valuable work experience and connect with potential employers.\r\n\r\n![Preparation for Future Careers](https://cdn.pixabay.com/photo/2015/01/07/16/59/entrepreneur-592169_1280.jpg)\r\n\r\n## Conclusion\r\n\r\nLearning in university is a crucial part of the higher education experience. It provides students with the knowledge and skills they need to succeed in their chosen careers, and also offers opportunities for personal growth and development. As you embark on your university journey, make the most of your learning opportunities and remember that your education is an investment in your future.\r\n\r\n![University Learning](https://cdn.pixabay.com/photo/2018/06/27/17/14/students-3500990_1280.jpg)'),
('4bbae22d-7695-4b58-88ba-79ff4846b613', 'hhh', '```\r\nalert(\"Hello\");\r\n```'),
('54c788da-8d1b-40b7-b6ef-0780f8363360', 'trrrrr', '# Decrescunt fluctibus tot flumina illis\r\n\r\n## Ille fata moriente ante lacertis tritumque divinante\r\n\r\nLorem markdownum hanc mala natumque, in est septem iussis notas vidit prole\r\nvivunt fraterni Me certe; in. Parabat ramos tua Hippotades *redeunt*!\r\n```\r\n    d_mini_aiff(animated_clock_restore(processorXhtmlPack,\r\n            supercomputerPortal));\r\n    if (ripping_json_subnet + hashtagTebibyte > fileCharacter / file_card) {\r\n        diskFileHard.worm = troubleshooting_soft_media(5);\r\n        windows_raw_ups += system_application_rte;\r\n    } else {\r\n        up_threading *= website_plug_browser.fatCyberspace(autoresponder_applet\r\n                - 517945);\r\n    }\r\n    if (brouter_runtime_market) {\r\n        thick_half = reader;\r\n        interactive *= voipKernel(wysiwyg) / retina_drag_tag + web;\r\n    } else {\r\n        wep_memory_ppi = client + rubyLaser;\r\n        big(5, flashGibibyte);\r\n    }\r\n    if (trash_ivr) {\r\n        quicktimeBootSeo.enterprise = northbridgeKilohertz(macVduBar, terahertz,\r\n                trashPath);\r\n    }\r\n    if (rup + modeDisplay) {\r\n        utilityDigitize.macPing = source_stack + zone + 3 + ftp;\r\n    } else {\r\n        scrolling = 15;\r\n        hexadecimalCertificate(4 + ddl);\r\n        flopsPaste /= outboxBar;\r\n    }\r\n```\r\nAit tela [egressa](http://flos.com/) tertia vires Iuventae: paene nam vertice,\r\nuna, fugis: quoniam. Laudatae rapi quid *nec*, modo quibus Diomedis.\r\n\r\n## Cum aquae incidit natumque Interea\r\n![](https://source.unsplash.com/random/600x400)\r\n\r\nEtiam [ventis](http://dianae-illi.com/in) lugebat miranti causa dicentem et\r\nherbarum tergum oculos! Suus mihi caelum valles, armenta coronam sontibus\r\nconversa, nunc obstipuit amorem, quaesitus venerat terras fretoque. Mercibus\r\nvisurus deos mugitus adest praesens, non putat noster capillos altera velles:\r\nprima. Omnia Noricus Troades mentiturque, littera erit est artus, resupinus\r\nhoste recurvo, claudunt ab *duraque intrat* cum.\r\n\r\nViolentior ausus silvae ramos in rabie in abditus, et mulcebat simul electae.\r\nCypron tum matres, veniebat manibus atque est e bella petit! Penetrabile tradita\r\nPhoenissa saxa neque tremulo perstant *Corythumque* ille excussit prima, oscula\r\nguttura carissima nimia gemit laurea movere.\r\n\r\n## Rogant habent hac\r\n\r\nThalamos rustica heros, nec ad at quae letataque fallor *iam* auxilioque Nelea.\r\nNatantia a radiis? Donec sit stravit, adsueta postquam sitim illis; Stabiasque\r\nore. Hederae reliquerat, ante ipse habe quamvis verba quas cthonius latus\r\n*fatalia*.\r\n\r\n> Saetis auras ubi nigrae efficient Troia, dicimus paulum supersunt faciem.\r\n> Gratamque sensit, Philemon vincit nulla, hodierna, mellaque, eram pater\r\n> spernite stabant petit in quam, patri. Sed gurgite simul Latialis quae\r\n> nostros, ipse orbe aequora capellas. *Per legit* cognoscere Threiciis,\r\n> congressus teque exemploque mutet optima Tyndaris myrteta exsilit vidit\r\n> visendae hic vocatum coeunt: serpens?\r\n\r\nLocorum fronti. Isdem marmoreo supplex, dixit carmina **vertigine cibos**\r\ncadentum et effudit ardet membris et saecula? Qui et pedes liceret adimuntque\r\nnefasque iuventus aurea sub iam! Telamone doctior educta est. De modo *diva\r\nflumina* absensauxilium verbaque superare habet, aequor; fama?'),
('6dee169a-a0e5-47a3-b304-4c49b1c5d03c', 'Java Socket', '# The Socket Server\r\n```\r\nimport java.net.*;\r\npublic Server {\r\n		public static void main(String args[]) {\r\n				ServerSocket socket = new ServerSocket(1000);\r\n				Socket client = socket.accept();\r\n				DataInputStream in = new DataInputStream(client.getInputStream());\r\n				DataOutputStream = new DataOutputStream(client.getDataOutputStream());\r\n				out.writeUTF(\"Hello World\");\r\n				System.out.println(in.readUTF());\r\n		}\r\n}\r\n```'),
('8276519a-0156-4a8f-abd8-0d174fb7a163', 'aaaa', '```\r\nalert(&qout;trrrr..&qout;);\r\n```'),
('9bd02ef0-047d-4230-880d-299c1fa71c42', 'Some content i found on the Internet', '# Esse vidit flagrantis in illi ille decent\r\n\r\n## Iuves quod laedunt ex\r\n\r\nLorem markdownum Epidauria in vestras: templa fertur requiescit alvum defendere\r\npatriosque credit, *perveniunt lacertis socialis* quam. Adeo locuta repugnat\r\nlitore venias: est sollemni micantes digitis. Illa pericli **exsecrantia**,\r\nlaboriferi ferox, ruat fuerat cessent adspicerent Peleus.\r\n\r\n    if (70) {\r\n        typeCommercialFormat.dcim(hardSimplexHard, 1, lamp.sdDocking(\r\n                metalMulticasting, ergonomics_unicode_file));\r\n        boot *= 2 + archieMetafileClipboard.trackback_podcast(fat,\r\n                protector_software, cybercrime);\r\n    } else {\r\n        sdsl_isdn_dll.layout_cell_hard(bespoke_superscalar_tebibyte);\r\n    }\r\n    clean_terahertz_data(infotainment, pplLinuxFormat);\r\n    sip.hertzGoodputRpm(midiRtfXml + passive + iscsiFile, rich_utf, caps(19));\r\n    if (pretest) {\r\n        guidDac(interfaceBookmark, server);\r\n        map(-1, tutorial_vlb_localhost, 5 + t);\r\n    } else {\r\n        ram_algorithm_row += -2;\r\n    }\r\n    var illegalCharacterProgressive = telnetDonationware(-4, 11 + plug, cps) *\r\n            viral.beta_python.interface(computerYahooExif -\r\n            spriteFileAssociation);\r\n\r\n## Et rationis veniet et fata indulgens mente\r\n\r\nVocant urbes fudit nemorumque ictus commune naufragus durescit, **flumine** et\r\nsed iugulumque caelo. [Sua](http://illa.io/eam.php) prior sacerdos, nomine et\r\nillam, procul quae. Erectheus dictis fretum rorant.\r\n\r\n- Nata animos eadem mihi turaque\r\n- Ut heu alto pulsi\r\n- Nubis utrimque\r\n- Plurima non simplex forte\r\n- Aliud isdem epulas partus\r\n\r\nOmnes vulneribus tristia Piraeaque carmina flebam credas **terrae**? Mea labor\r\nobliquaque verte privignae fortibus digerit Lycormas; uni. Manu levavit\r\nargumenta moriens! Tota idem est, duxit **concubitus** non specta gaudete\r\npignusque ab digna tenui Troica Quirini.\r\n\r\n## Nisi ventis clipeus meo sed dubites\r\n\r\nPraedam altera; Rutulum cautibus templa postquam omnibus nondum; deum *et\r\nintentare*, omnes adspicit. Extemplo amplexa **artes cum negatur** movisse in\r\nCerberei Combe, partimque suis, et. Prona exiguo sed ita Aegea movet, littera\r\nsua hausit grave, Tyrrhena. Vires dabat Italicis depresso: vices celanda,\r\nadflavit tauros velocibus **memorant**. Illa arma vestigia.\r\n\r\n    balancing = interlacedCopyright(adCharacterTerahertz - power, host.ofCms(\r\n            jpegFileApplet, dimm_algorithm));\r\n    system(27 + waisSwipe, digitalFile);\r\n    if (pageUndoGif) {\r\n        thread_bar.google_ajax -= dvd(pciBareRom(cpmTweak), petabyteImSmm);\r\n    }\r\n    debugWhois = compression;\r\n    var ata = pinterest_facebook_ddr + zif.memoryVersion(on) + source +\r\n            ivrPacketIm;\r\n\r\nFemineae ponderis [quod digitis solito](http://vocant-erat.net/fuit) luctibus tu\r\niamque suus augendo pulcherrime dubio nisi moras Caenis. Pugnet sed: patruo,\r\nmihi feros numerem et longa ab motatque esse oro vitamque precor cumque Syringa\r\nutque! Per in rebus.\r\n\r\nLoqui Lenaeo dissimilisque facere aurum esses puer simulat pallae verruntur\r\nspoliare subito venatibus editus resurgere accipis;\r\n[medeatur](http://invidit-nec.org/munus). Aegide invictumque ramos poenaque\r\nquoque totidemque ne quem aevo, moris instantes **metuens Pylius partem**\r\ngeneris **abesto decus**: leto. Parentis virgineis; terga forma, ille vellera\r\ndefendere idem; **te** speculo.');

-- --------------------------------------------------------

--
-- Table structure for table `Choices`
--

CREATE TABLE `Choices` (
  `id` varchar(36) NOT NULL,
  `pollId` varchar(36) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Choices`
--

INSERT INTO `Choices` (`id`, `pollId`, `content`) VALUES
('36d078c4-744c-43d6-8c32-fd89ab89b0f2', '9bd0a612-7890-447d-82d1-00b771282f68', 'Rust'),
('4310c527-7d8f-439d-9e5f-a47a12e6755d', '9bd0a612-7890-447d-82d1-00b771282f68', 'Dart'),
('4888edcb-2c01-4f9b-9afe-fbb5a826b23f', '9bd0a612-7890-447d-82d1-00b771282f68', 'Python'),
('a34b87b9-6adb-41ed-8ca9-61540401bcd8', '9bd0a612-7890-447d-82d1-00b771282f68', 'Javascript'),
('bacfeb1f-9946-418d-8956-0605f0a07fb8', '9bd0a612-7890-447d-82d1-00b771282f68', 'Java');

-- --------------------------------------------------------

--
-- Table structure for table `CommentReactions`
--

CREATE TABLE `CommentReactions` (
  `id` varchar(36) NOT NULL,
  `commentId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CommentReactions`
--

INSERT INTO `CommentReactions` (`id`, `commentId`, `userId`, `type`) VALUES
('22ecc8a7-d704-469b-a766-a97880210906', '18833c6e-ddf2-4949-a4c4-bcd49fd5d2b0', '7f459eb6-0279-44c8-9ccc-90461baed437', 'UPVOTE'),
('450c0831-6f2a-4a86-bf09-45a420d9d894', 'f05ec4b2-68fd-46fc-92b3-bf643a9d1e69', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'DOWNVOTE'),
('5c05c99e-3af0-4d85-89da-5230bd8efd7b', '11ea0c8a-226b-48bf-8532-9b76d30feda7', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'DOWNVOTE'),
('90a15361-5168-4c20-b708-78c9a03f2b6d', '18833c6e-ddf2-4949-a4c4-bcd49fd5d2b0', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'UPVOTE'),
('bbe55a18-d3b1-4da1-875a-64454bcefa0c', 'b21b9e64-c9dd-4b46-856b-67d272cccd6f', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'DOWNVOTE'),
('f85a4f91-22a3-4cf6-86af-81473bd9811e', 'cc4072e5-ce5a-406f-a5d9-d89d76bda658', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'UPVOTE');

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `postId` varchar(36) NOT NULL,
  `content` text NOT NULL,
  `commentedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `score` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`id`, `userId`, `postId`, `content`, `commentedAt`, `score`) VALUES
('0a662908-349b-4a09-8c85-f4256f3b3896', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '9bd0a612-7890-447d-82d1-00b771282f68', 'Hi How are you', '2023-02-07 20:00:50', 0),
('11ea0c8a-226b-48bf-8532-9b76d30feda7', '7f459eb6-0279-44c8-9ccc-90461baed437', '2a82e354-2b35-4e2e-afab-8627bd47d5e0', 'stop', '2023-02-10 02:21:39', 0),
('18833c6e-ddf2-4949-a4c4-bcd49fd5d2b0', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2a82e354-2b35-4e2e-afab-8627bd47d5e0', 'hello world', '2023-02-09 23:30:58', 0),
('8694f742-24fa-4352-8d84-9fb274630077', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '32594c2d-4d0e-4e8a-8d1f-cf20d6dd36a9', 'Trrrr', '2023-02-08 20:32:10', 0),
('b21b9e64-c9dd-4b46-856b-67d272cccd6f', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '54c788da-8d1b-40b7-b6ef-0780f8363360', 'adfadsf', '2023-02-25 18:07:56', 0),
('cc4072e5-ce5a-406f-a5d9-d89d76bda658', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '54c788da-8d1b-40b7-b6ef-0780f8363360', 'What is this \r\nI didn\'t Understand\r\n\r\n\r\nPS: make it clear\r\n\r\n\r\nworst tutorial ever &#128549;', '2023-02-25 18:06:57', 0),
('d057d3ea-d58c-48c9-bb27-562c3b7c9c2d', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '9bd0a612-7890-447d-82d1-00b771282f68', 'Trrrrr.', '2023-02-07 20:00:43', 0),
('e51031a4-89c4-4007-9fda-a520aad1c9f3', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '3180078d-f100-4ce6-9de2-38b7b92f7ecf', 'hi', '2023-02-09 23:23:44', 0),
('f05ec4b2-68fd-46fc-92b3-bf643a9d1e69', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', '6dee169a-a0e5-47a3-b304-4c49b1c5d03c', 'u suck', '2023-02-12 17:17:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `FriendRequest`
--

CREATE TABLE `FriendRequest` (
  `id` varchar(36) NOT NULL,
  `fromId` varchar(36) NOT NULL,
  `toId` varchar(36) NOT NULL,
  `status` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `FriendRequest`
--

INSERT INTO `FriendRequest` (`id`, `fromId`, `toId`, `status`, `datetime`) VALUES
('2c57e9d8-a877-4d5e-be20-774c2de50d9a', '8e0b7d9a-2c6e-412f-8d93-c0934020f515', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED', '2023-02-12 17:26:28'),
('535a25c9-13d9-4e55-ae1a-c7d27695a2de', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', 'ACCEPTED', '2023-02-12 17:16:54'),
('55f5d17a-2dee-4c38-8d6c-66faac62a9d6', 'bd7152ca-e757-467b-95c8-df9301f7fa69', 'c7dcada6-d925-44d2-b061-8191af30089f', 'WAITING', '2023-02-06 11:05:06'),
('8321bde7-a59c-4492-b286-0b8d8ac15182', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'c7dcada6-d925-44d2-b061-8191af30089f', 'WAITING', '2023-02-07 13:59:54'),
('9159bf8f-ae7d-471f-bd5a-4fffad670310', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', 'eb9e262b-b37d-4a0f-ade0-799ae9634979', 'WAITING', '2023-02-12 17:16:44'),
('93ae32a4-a008-41a2-a31a-e7d145c0706e', '8e0b7d9a-2c6e-412f-8d93-c0934020f515', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', 'WAITING', '2023-02-12 17:26:20'),
('a3563b69-bbc6-40ed-b553-d3701c3ec099', '838048cd-7fe1-412e-90c8-3c9d37c4bac8', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED', '2023-02-12 03:42:21'),
('cc653101-aaa7-459d-b4a1-34be3592cbb0', '7f459eb6-0279-44c8-9ccc-90461baed437', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED', '2023-02-07 11:35:40'),
('e8c686d7-8ff3-49e8-ae37-fcfba29f71cb', 'bd7152ca-e757-467b-95c8-df9301f7fa69', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED', '2023-02-06 11:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `NId` varchar(36) NOT NULL,
  `receiverId` varchar(36) NOT NULL,
  `fromId` varchar(36) NOT NULL,
  `type` varchar(50) NOT NULL,
  `postId` varchar(36) DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Notification`
--

INSERT INTO `Notification` (`NId`, `receiverId`, `fromId`, `type`, `postId`, `datetime`) VALUES
('00a9f45d-32a3-422c-87c3-7ade93a3c033', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '7f459eb6-0279-44c8-9ccc-90461baed437', 'SENT_REQUEST', NULL, '2023-02-07 11:35:40'),
('00c12c34-07fe-44e2-82d5-aa98e3e8c4f3', '7f459eb6-0279-44c8-9ccc-90461baed437', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'LIKED_POST', '01eceb20-626d-45ef-812b-a1796fa789ec', '2023-02-07 13:12:15'),
('26c11106-286a-4796-a555-83848de12dc5', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'SENT_REQUEST', NULL, '2023-02-12 17:16:54'),
('38f07217-03f2-4ec0-96e0-42b586855c51', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', 'ACCEPTED_REQUEST', NULL, '2023-02-12 17:16:59'),
('3e7cbe55-030a-43cb-a82b-a240cb669c73', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', '8e0b7d9a-2c6e-412f-8d93-c0934020f515', 'SENT_REQUEST', NULL, '2023-02-12 17:26:20'),
('42efd65c-874c-402b-9b29-eca8ae538786', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', 'COMMENTED_POST', '6dee169a-a0e5-47a3-b304-4c49b1c5d03c', '2023-02-12 17:17:42'),
('45c7ea3f-c98b-4f4e-8bf4-df720406d689', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '7f459eb6-0279-44c8-9ccc-90461baed437', 'LIKED_POST', '2a82e354-2b35-4e2e-afab-8627bd47d5e0', '2023-02-12 03:40:08'),
('572b6be7-f89e-445a-83d6-5d6668a8b6ff', 'bd7152ca-e757-467b-95c8-df9301f7fa69', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED_REQUEST', NULL, '2023-02-06 11:05:17'),
('5852f3ae-ac0b-4f77-8b44-d11d4a3b9089', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '7f459eb6-0279-44c8-9ccc-90461baed437', 'LIKED_POST', '54c788da-8d1b-40b7-b6ef-0780f8363360', '2023-02-12 03:40:11'),
('664a4012-3332-49a4-9792-42fdfe1a8c1c', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '7f459eb6-0279-44c8-9ccc-90461baed437', 'LIKED_POST', '2e3952b7-1d96-4bd4-96f1-047a5cd71e91', '2023-02-07 13:13:56'),
('66a8f013-d548-4ee7-a312-8696246ffde4', 'bd7152ca-e757-467b-95c8-df9301f7fa69', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'LIKED_POST', '34281656-fa59-435c-85a6-ac9c9bfc1c8c', '2023-02-07 13:25:18'),
('79c2d2a9-4fe5-4d9f-b65b-11ba0986059f', '838048cd-7fe1-412e-90c8-3c9d37c4bac8', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED_REQUEST', NULL, '2023-02-12 03:42:36'),
('8369922a-1d71-4102-b8d9-8648b2e66fcd', 'bd7152ca-e757-467b-95c8-df9301f7fa69', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'LIKED_POST', '34281656-fa59-435c-85a6-ac9c9bfc1c8c', '2023-02-07 13:25:15'),
('83866b5f-3eea-4fa7-b7a4-61a6f592d9c2', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'bd7152ca-e757-467b-95c8-df9301f7fa69', 'SENT_REQUEST', NULL, '2023-02-06 11:05:10'),
('99f71f71-3695-41ff-a5a6-377187ae8cec', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'LIKED_POST', '34ad53a2-5f81-40f9-9957-7ddb978bbb07', '2023-02-07 13:12:50'),
('a4aa78ac-50d6-48e7-8568-d811d75e9a4c', '8e0b7d9a-2c6e-412f-8d93-c0934020f515', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED_REQUEST', NULL, '2023-02-12 17:27:49'),
('a936f448-c1d3-4759-9a14-8d1ffba3bab2', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '8e0b7d9a-2c6e-412f-8d93-c0934020f515', 'LIKED_POST', '3fd82c05-4c16-46da-a127-fad39e3b1c09', '2023-02-12 17:28:30'),
('c20cd9e5-a2a0-45a7-9471-91c4d671bb7c', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '7f459eb6-0279-44c8-9ccc-90461baed437', 'LIKED_POST', '3180078d-f100-4ce6-9de2-38b7b92f7ecf', '2023-02-12 03:40:10'),
('d4589069-7f44-424f-ae94-872957e9bdba', 'eb9e262b-b37d-4a0f-ade0-799ae9634979', 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6', 'SENT_REQUEST', NULL, '2023-02-12 17:16:44'),
('d7212351-02ad-4324-a225-7000b2913f97', '7f459eb6-0279-44c8-9ccc-90461baed437', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'ACCEPTED_REQUEST', NULL, '2023-02-07 11:35:58'),
('db02b3ea-d68a-49dc-adbc-b588bd42aa8f', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '8e0b7d9a-2c6e-412f-8d93-c0934020f515', 'SENT_REQUEST', NULL, '2023-02-12 17:26:28'),
('db2ea250-6653-43cb-a8b6-c10838657419', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '7f459eb6-0279-44c8-9ccc-90461baed437', 'LIKED_POST', '9bd02ef0-047d-4230-880d-299c1fa71c42', '2023-02-12 03:40:13'),
('e9a52eb8-96cd-4e26-81ba-c5ba5aced635', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '838048cd-7fe1-412e-90c8-3c9d37c4bac8', 'LIKED_POST', '9bd0a612-7890-447d-82d1-00b771282f68', '2023-02-12 03:42:59'),
('ea3216b9-d8f5-4e74-bd9e-07d210d3f2f1', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '7f459eb6-0279-44c8-9ccc-90461baed437', 'COMMENTED_POST', '2a82e354-2b35-4e2e-afab-8627bd47d5e0', '2023-02-10 02:21:39'),
('ea5a5ec9-887d-4a2a-a66c-f049035f8cca', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '838048cd-7fe1-412e-90c8-3c9d37c4bac8', 'SENT_REQUEST', NULL, '2023-02-12 03:42:21'),
('fa3f251f-9091-4f5b-a024-a45d97f37d0f', 'c7dcada6-d925-44d2-b061-8191af30089f', 'bd7152ca-e757-467b-95c8-df9301f7fa69', 'SENT_REQUEST', NULL, '2023-02-06 11:05:06'),
('ff4183f5-10b4-41c5-9b22-ac9fe9649c81', 'c7dcada6-d925-44d2-b061-8191af30089f', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'SENT_REQUEST', NULL, '2023-02-07 13:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `Polls`
--

CREATE TABLE `Polls` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Polls`
--

INSERT INTO `Polls` (`id`, `title`) VALUES
('9bd0a612-7890-447d-82d1-00b771282f68', 'What is the best Programming language of 2023?');

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `postedAt` datetime NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`id`, `userId`, `postedAt`, `type`) VALUES
('01eceb20-626d-45ef-812b-a1796fa789ec', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-05 16:47:07', 'BLOG'),
('2a82e354-2b35-4e2e-afab-8627bd47d5e0', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-09 23:05:29', 'BLOG'),
('2e3952b7-1d96-4bd4-96f1-047a5cd71e91', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-05 14:33:33', 'STORY'),
('3180078d-f100-4ce6-9de2-38b7b92f7ecf', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 20:30:59', 'STORY'),
('32594c2d-4d0e-4e8a-8d1f-cf20d6dd36a9', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-05 21:31:58', 'STORY'),
('34281656-fa59-435c-85a6-ac9c9bfc1c8c', 'bd7152ca-e757-467b-95c8-df9301f7fa69', '2023-02-06 11:07:07', 'STORY'),
('34ad53a2-5f81-40f9-9957-7ddb978bbb07', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-06 10:30:36', 'STORY'),
('3fd82c05-4c16-46da-a127-fad39e3b1c09', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-12 17:21:27', 'STORY'),
('4308b65d-f36c-488e-b973-0a8dd26233aa', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-25 23:49:41', 'BLOG'),
('4bbae22d-7695-4b58-88ba-79ff4846b613', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-25 16:22:07', 'BLOG'),
('54c788da-8d1b-40b7-b6ef-0780f8363360', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 20:26:42', 'BLOG'),
('6dee169a-a0e5-47a3-b304-4c49b1c5d03c', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-12 04:04:40', 'BLOG'),
('8276519a-0156-4a8f-abd8-0d174fb7a163', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-25 16:26:46', 'BLOG'),
('84d5b9d8-8c2c-4f4e-a139-e25d5759ad61', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-05 14:29:19', 'STORY'),
('9bd02ef0-047d-4230-880d-299c1fa71c42', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 20:04:28', 'BLOG'),
('9bd0a612-7890-447d-82d1-00b771282f68', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-06 22:43:02', 'POLL'),
('c747f280-7a9e-4098-95de-8f7ade58c276', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-05 14:35:14', 'STORY'),
('f1905d80-8a6e-4eeb-866b-a40722d2de4f', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-25 16:27:42', 'STORY');

-- --------------------------------------------------------

--
-- Table structure for table `Reactions`
--

CREATE TABLE `Reactions` (
  `id` varchar(36) NOT NULL,
  `postId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `datetime` datetime NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Reactions`
--

INSERT INTO `Reactions` (`id`, `postId`, `userId`, `datetime`, `type`) VALUES
('0028b765-4515-47e7-9348-dbe9f6420c48', '32594c2d-4d0e-4e8a-8d1f-cf20d6dd36a9', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 13:11:25', NULL),
('1fbc326f-568d-4036-9f0d-f69b27c12936', '34ad53a2-5f81-40f9-9957-7ddb978bbb07', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 13:12:50', NULL),
('3a06119e-8a22-46cc-bd16-8f15ca6b40a8', '32594c2d-4d0e-4e8a-8d1f-cf20d6dd36a9', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-07 13:11:15', NULL),
('3f4da135-e0e1-4ec5-82af-82c1d46bf65a', '9bd02ef0-047d-4230-880d-299c1fa71c42', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-12 03:40:13', NULL),
('54b084b3-1767-4cec-81d6-09c6998a745e', '3180078d-f100-4ce6-9de2-38b7b92f7ecf', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-12 03:40:10', NULL),
('5cf32619-5657-4697-b52b-161f735dd5fa', '3180078d-f100-4ce6-9de2-38b7b92f7ecf', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-09 22:58:22', NULL),
('6c7db328-907c-4d4c-b3b3-aa2468e0d619', '2a82e354-2b35-4e2e-afab-8627bd47d5e0', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-12 03:40:08', NULL),
('807223a0-7463-470a-92e3-15281e71c89f', '54c788da-8d1b-40b7-b6ef-0780f8363360', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-12 03:40:11', NULL),
('8f79bd20-fe75-4718-bafc-e01986bec373', '9bd0a612-7890-447d-82d1-00b771282f68', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 18:03:11', NULL),
('90d621b6-838b-4f20-b21f-660b186d8f0b', '01eceb20-626d-45ef-812b-a1796fa789ec', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-07 13:12:15', NULL),
('92380045-4183-4fa3-a217-698fad81a0ba', '2e3952b7-1d96-4bd4-96f1-047a5cd71e91', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-07 13:13:56', NULL),
('a3adf409-27ad-48c5-9688-fd75bae53aba', '54c788da-8d1b-40b7-b6ef-0780f8363360', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-12 03:06:21', NULL),
('a4c3f3b0-591d-4d0f-a9a9-16248edc616b', '34281656-fa59-435c-85a6-ac9c9bfc1c8c', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 13:25:18', NULL),
('ac40fe38-8bc7-4e73-ae45-0ad22648b2c8', '9bd0a612-7890-447d-82d1-00b771282f68', '838048cd-7fe1-412e-90c8-3c9d37c4bac8', '2023-02-12 03:42:59', NULL),
('ae92fd5b-c9d4-410a-a484-c0ba64b78826', 'f1905d80-8a6e-4eeb-866b-a40722d2de4f', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-25 19:10:03', NULL),
('c199bcd3-4f7b-46d6-9f3f-e5072a7391da', '3fd82c05-4c16-46da-a127-fad39e3b1c09', '8e0b7d9a-2c6e-412f-8d93-c0934020f515', '2023-02-12 17:28:30', NULL),
('c8f648e6-6d2a-4ce7-9ccd-ce6c96459e78', '2a82e354-2b35-4e2e-afab-8627bd47d5e0', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-09 23:08:49', NULL),
('d0a0d11b-bbf4-4d4e-a986-fb9e6c0ba2d7', '6dee169a-a0e5-47a3-b304-4c49b1c5d03c', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-12 13:16:59', NULL),
('d802945a-b37e-4586-a2e1-d80fd72376f6', '9bd0a612-7890-447d-82d1-00b771282f68', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-07 11:36:13', NULL),
('db3845a2-e193-47a7-bd29-b65f00e295f7', '3fd82c05-4c16-46da-a127-fad39e3b1c09', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-25 20:07:16', NULL),
('e349d160-faf3-46a7-8f60-12d1626ee78d', '34ad53a2-5f81-40f9-9957-7ddb978bbb07', '7f459eb6-0279-44c8-9ccc-90461baed437', '2023-02-07 13:08:30', NULL),
('f4676aef-06c3-48ce-b5a6-a520e53e298a', '84d5b9d8-8c2c-4f4e-a139-e25d5759ad61', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '2023-02-07 14:17:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Stories`
--

CREATE TABLE `Stories` (
  `id` varchar(36) NOT NULL,
  `photoUrl` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Stories`
--

INSERT INTO `Stories` (`id`, `photoUrl`, `caption`) VALUES
('2e3952b7-1d96-4bd4-96f1-047a5cd71e91', '1675596813911..jpg', 'Coool &#127378;'),
('3180078d-f100-4ce6-9de2-38b7b92f7ecf', '1675791059098.jpg', 'SpaceX'),
('32594c2d-4d0e-4e8a-8d1f-cf20d6dd36a9', '1675621918159.jpg', 'uiuy'),
('34281656-fa59-435c-85a6-ac9c9bfc1c8c', '1675670827611.jpg', ''),
('34ad53a2-5f81-40f9-9957-7ddb978bbb07', '1675668636009.jpg', ''),
('3fd82c05-4c16-46da-a127-fad39e3b1c09', '1676211687467.png', 'Ai goes brrrrrr.....'),
('84d5b9d8-8c2c-4f4e-a139-e25d5759ad61', '1675596559807..jpg', 'Beautiful day, beautiful life &#128515;'),
('c747f280-7a9e-4098-95de-8f7ade58c276', '1675596914029.jpg', '&#9888; WANTED &#9888;'),
('f1905d80-8a6e-4eeb-866b-a40722d2de4f', '1677331662790.png', 'khlk');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` varchar(36) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `securityQuestion` varchar(100) NOT NULL,
  `securityAnswer` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `profileUrl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `firstName`, `lastName`, `email`, `password`, `securityQuestion`, `securityAnswer`, `gender`, `profileUrl`) VALUES
('0ad599f1-948c-4eb4-8458-e31d83e9fbed', 'Abebe', 'Debebe', 'abebe@gmail.com', '123456', 'What is your hometown?', 'somewhere', NULL, '0ad599f1-948c-4eb4-8458-e31d83e9fbed--1677361367591.png'),
('0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', 'Naol', 'Chala', 'naolchala6@gmail.com', '111111', 'What is your hometown?', 'Addis Alem', NULL, '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a--1677331728820.png'),
('1ddebbb8-2b13-4bba-86fd-96e0fd030148', 'Thomas', 'Cabrera', 'jihe@mailinator.com', 'Pa$$w0rd!', 'What is your favorite sports team?', 'Consectetur minima p', NULL, '1ddebbb8-2b13-4bba-86fd-96e0fd030148--1675507718832.jpg'),
('68ad14bb-9128-4c68-b517-cbcfb68f4187', 'Todd', 'Sherman', 'noji@mailinator.com', 'Pa$$w0rd!', 'What is your favorite book?', 'Sint sed deserunt h', NULL, NULL),
('7f459eb6-0279-44c8-9ccc-90461baed437', 'Naol', 'The Second', 'naolchala7@gmail.com', '123456', 'What is your favorite book?', 'Think fast and slow', NULL, NULL),
('838048cd-7fe1-412e-90c8-3c9d37c4bac8', 'YASM', '', 'official@yasm.com', '123456', 'What is your favorite movie?', 'Don\'t Look Up', NULL, '838048cd-7fe1-412e-90c8-3c9d37c4bac8--1676039369095.png'),
('8e0b7d9a-2c6e-412f-8d93-c0934020f515', 'Gulma', 'Gulmu', 'gulma@mail.com', 'gulma098', 'What is your hometown?', 'home', NULL, NULL),
('9e3406d8-f3e9-496c-984b-9e991d577236', 'Serena', 'Adams', 'muweqib@mailinator.com', 'Pa$$w0rd!', 'What is your favorite book?', 'Quia omnis alias occ', NULL, NULL),
('b1b36748-9ad5-4b54-bac3-aedb46d8dde6', 'Besufikad', 'Tilahun', 'besufikadtilahun298@gmail.com', 'azxcvbnm', 'What is your favorite color?', 'dark', NULL, 'b1b36748-9ad5-4b54-bac3-aedb46d8dde6--1676211505126.png'),
('bd7152ca-e757-467b-95c8-df9301f7fa69', 'Ephrem', 'Getachew', 'ephywaanofii@gmail.com', '1234567', 'What is your hometown?', 'adama', NULL, 'bd7152ca-e757-467b-95c8-df9301f7fa69--1675670774176.jpg'),
('c7dcada6-d925-44d2-b061-8191af30089f', 'Alec', 'Rios', 'ravecipuz@mailinator.com', 'Pa$$w0rd!', 'What is your favorite color?', 'Ex in et molestias n', NULL, NULL),
('d92d1fc9-53ae-4558-98da-4c93ef034759', 'Yeabsra ', 'Tesfaye', 'lalaland@gmail.com', 'lalaland', 'What is your favorite color?', 'black', NULL, NULL),
('eb9e262b-b37d-4a0f-ade0-799ae9634979', 'Dane', 'Duran', 'vipuxed@mailinator.com', 'Pa$$w0rd!', 'What is the name of your high school?', 'Sint sit quia fugit', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Votes`
--

CREATE TABLE `Votes` (
  `id` varchar(36) NOT NULL,
  `pollId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `choiceId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Votes`
--

INSERT INTO `Votes` (`id`, `pollId`, `userId`, `choiceId`) VALUES
('7246a6bd-5932-42ce-9946-c6f28197257e', '9bd0a612-7890-447d-82d1-00b771282f68', '7f459eb6-0279-44c8-9ccc-90461baed437', '36d078c4-744c-43d6-8c32-fd89ab89b0f2'),
('b0ba910e-ea00-4a40-966d-f5bec5a25625', '9bd0a612-7890-447d-82d1-00b771282f68', '838048cd-7fe1-412e-90c8-3c9d37c4bac8', '4888edcb-2c01-4f9b-9afe-fbb5a826b23f'),
('c68ae130-388a-494d-83cb-f6eb2a378462', '9bd0a612-7890-447d-82d1-00b771282f68', '0dce9fe5-63e9-4eeb-8cf6-fb8e54260a2a', '36d078c4-744c-43d6-8c32-fd89ab89b0f2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Choices`
--
ALTER TABLE `Choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_choice` (`pollId`);

--
-- Indexes for table `CommentReactions`
--
ALTER TABLE `CommentReactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentreaction_user` (`userId`),
  ADD KEY `comment_reaction_comment` (`commentId`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_post` (`postId`),
  ADD KEY `user_comment` (`userId`);

--
-- Indexes for table `FriendRequest`
--
ALTER TABLE `FriendRequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`fromId`),
  ADD KEY `receiver` (`toId`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`NId`),
  ADD KEY `from_notification` (`fromId`),
  ADD KEY `to_notification` (`receiverId`);

--
-- Indexes for table `Polls`
--
ALTER TABLE `Polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_added` (`userId`);

--
-- Indexes for table `Reactions`
--
ALTER TABLE `Reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `like_post` (`postId`),
  ADD KEY `like_user` (`userId`);

--
-- Indexes for table `Stories`
--
ALTER TABLE `Stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Votes`
--
ALTER TABLE `Votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_vote` (`pollId`),
  ADD KEY `vote_user` (`userId`),
  ADD KEY `vote_choice` (`choiceId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD CONSTRAINT `post_blog` FOREIGN KEY (`id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Choices`
--
ALTER TABLE `Choices`
  ADD CONSTRAINT `poll_choice` FOREIGN KEY (`pollId`) REFERENCES `Polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CommentReactions`
--
ALTER TABLE `CommentReactions`
  ADD CONSTRAINT `comment_reaction_comment` FOREIGN KEY (`commentId`) REFERENCES `Comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentreaction_user` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `comment_post` FOREIGN KEY (`postId`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_comment` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `FriendRequest`
--
ALTER TABLE `FriendRequest`
  ADD CONSTRAINT `receiver` FOREIGN KEY (`toId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sender` FOREIGN KEY (`fromId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Notification`
--
ALTER TABLE `Notification`
  ADD CONSTRAINT `from_notification` FOREIGN KEY (`fromId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_notification` FOREIGN KEY (`receiverId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Polls`
--
ALTER TABLE `Polls`
  ADD CONSTRAINT `post_poll` FOREIGN KEY (`id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `post_added` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Reactions`
--
ALTER TABLE `Reactions`
  ADD CONSTRAINT `like_post` FOREIGN KEY (`postId`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_user` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Stories`
--
ALTER TABLE `Stories`
  ADD CONSTRAINT `post_story` FOREIGN KEY (`id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Votes`
--
ALTER TABLE `Votes`
  ADD CONSTRAINT `poll_vote` FOREIGN KEY (`pollId`) REFERENCES `Polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_choice` FOREIGN KEY (`choiceId`) REFERENCES `Choices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_user` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
