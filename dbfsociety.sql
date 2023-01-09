-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-01-2023 a las 02:00:58
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbfsociety`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `idautor` int(11) NOT NULL,
  `autor` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`idautor`, `autor`) VALUES
(1, 'Kentaro Miura'),
(2, 'Yoshihiro Togashi'),
(3, 'Akira Toriyama'),
(4, 'Taishi Tsutsui'),
(5, 'Haruichi Furudate'),
(6, 'Iniio Asano'),
(7, 'Takehiko Inoue'),
(8, 'One'),
(9, 'Tsugumi Ohba'),
(10, 'Riichiro Inagaki'),
(11, 'Gege Akutami'),
(12, 'Hajime Isayama'),
(13, 'Hiroaki Samura'),
(14, 'Hiroya Oku'),
(15, 'Hiromu Arakawa'),
(16, 'Akihito Tsukushi'),
(17, 'Yuki Tabata'),
(18, 'Aya Yajima'),
(19, 'Kugane Maruyama'),
(20, 'Gege Akutami'),
(21, 'Marchisio'),
(22, 'Ed Brubaker'),
(23, 'Raulo Caceres'),
(24, 'Illojuan'),
(25, 'J. Michael Straczysnki'),
(26, 'Ricardo Vilbor'),
(27, 'Eiichirō Oda'),
(28, 'Shinichi Fukuda'),
(29, 'Alex Ross'),
(30, 'Giuseppe Camuncoli, Kieron Gillen, Marco Checchetto, Salvador Larroca'),
(31, 'Pablo León'),
(32, 'Steve Englehart y Marshall Rogers'),
(33, 'Frank Miller'),
(34, 'Frank Miller y David Mazzucchelli'),
(35, 'Mike W. Barr y Jerry Bingham'),
(36, 'Alan Moore y Brian Bolland'),
(37, 'Jim Starlin y Bernie Wrightson'),
(38, 'Marv Wolfman, George Perez y Jim Aparo'),
(39, 'Grant Morrison y Dave McKean'),
(40, 'Brian Augustyn y Mike Mignola'),
(41, 'Jeph Loeb y Jim Lee'),
(42, 'Mark Waid, Howard Porter y Steve Scott'),
(43, 'Jeph Loeb y Jim Lee'),
(44, 'Grant Morrison y Tony Daniel'),
(45, 'Neil Gaiman y Andy Kubert'),
(46, 'Scott Snyder y Greg Capullo'),
(47, 'Tom King y Michael Janín'),
(48, 'Ai Yazawa'),
(49, 'Kishimoto Masashi'),
(50, 'Tatsuki Fujimoto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `categoria`) VALUES
(1, 'Otra'),
(2, 'Boxsets'),
(3, 'Paquetes'),
(4, 'Novelas'),
(5, 'Mangas'),
(6, 'Comics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colecciones`
--

CREATE TABLE `colecciones` (
  `idcoleccion` int(11) NOT NULL,
  `coleccion` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `colecciones`
--

INSERT INTO `colecciones` (`idcoleccion`, `coleccion`) VALUES
(1, 'Berserk'),
(2, 'Hunter x Hunter'),
(3, 'Dragon ball'),
(4, 'We Never Learn'),
(5, 'Haikiu'),
(6, 'Oyasumi Punpun'),
(7, 'Vagabond'),
(8, 'One punch man'),
(9, 'Death note'),
(10, 'Dr. Stone'),
(11, 'Jujutsu Kaisen'),
(12, 'Before The Fall'),
(13, 'Blade of the Inmortal'),
(14, 'Gantz'),
(15, 'Full Metal Alchemist'),
(16, 'Made in Abyss'),
(17, 'Black Clover'),
(18, 'DEMON SLAYER - NOVELA MARIPOSA DE UN ALA'),
(19, 'OVERLORD: THE UNDEAD KING'),
(20, 'STAR WARS: THE HIGH REPUBLIC - RASTRO DE SOMBRAS'),
(21, 'RECKLESS'),
(22, 'CINEMA PURGATORIO CÓDIGO PRU'),
(23, 'STAR WARS THE MANDALORIAN'),
(24, 'THE RESISTANCE HC'),
(25, 'NARCOS'),
(26, 'CALENDARIO ONE PIECE'),
(27, 'MY DRESS-UP DARLING'),
(28, 'CUATRO FANTÁSTICOS: CÍRCULO COMPLETO'),
(29, 'STAR WARS: DARTH VADER (2015)'),
(30, 'MILES MORALES: SHOCK WAVES'),
(31, 'STAR WARS (2015)'),
(32, 'BATMAN COMICS'),
(33, 'LIGA DE LA JUSTICIA'),
(34, 'NANA'),
(35, 'NARUTO'),
(36, 'CHAINSAW MAN'),
(37, 'ONE PIECE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idcomentario` int(11) NOT NULL,
  `usuarios_idusuario` int(11) NOT NULL,
  `productos_idproducto` int(11) NOT NULL,
  `comentario` varchar(1000) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fechacomentario` date NOT NULL,
  `horacomentario` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idcomentario`, `usuarios_idusuario`, `productos_idproducto`, `comentario`, `calificacion`, `fechacomentario`, `horacomentario`) VALUES
(2, 2, 2, 'No me gusto', 3, '2022-11-04', '02:15:13'),
(3, 3, 5, 'El material no es bueno, pero vale la pena', 3, '2022-10-03', '02:15:14'),
(4, 4, 4, 'Realmente no estoy muy satisfecho', 2, '2022-10-02', '02:15:15'),
(5, 5, 5, 'Me encanto', 5, '2022-10-01', '02:15:16'),
(6, 6, 6, 'No se porque lo compre', 2, '0000-00-00', '02:15:17'),
(7, 7, 1, 'Esto no es lo que buscaba', 1, '2022-10-01', '02:15:18'),
(8, 8, 7, 'Me encanto todo lo que tenia', 4, '2022-10-02', '02:15:19'),
(9, 9, 17, 'Quiza lo mejor que he leido', 5, '2022-10-03', '02:15:20'),
(10, 10, 9, 'Supeeeer', 5, '2022-10-04', '02:15:21'),
(11, 11, 10, 'Este es el manga, no hay mas', 5, '2022-10-05', '02:15:22'),
(12, 12, 11, 'sin palabras', 4, '2022-10-06', '02:15:23'),
(13, 13, 1, 'ni bueno ni malo', 3, '2022-10-07', '02:15:24'),
(14, 14, 13, 'Lo recomiendo 100%', 5, '2022-10-08', '02:15:25'),
(15, 15, 14, 'Me gusto mucho', 5, '2022-10-09', '02:15:26'),
(16, 16, 15, 'Supeer', 5, '2022-10-10', '02:15:27'),
(17, 17, 16, 'Esperaba algo mas', 3, '2022-10-11', '02:15:28'),
(18, 18, 5, 'No entiendo las malas criticas de esto', 5, '2022-10-12', '02:15:29'),
(19, 19, 18, 'Me encanto', 5, '2022-10-13', '02:15:30'),
(20, 20, 1, 'No me gusto', 2, '2022-10-14', '02:15:31'),
(21, 11, 31, 'Muy bien manga, muy recomendable', 4, '2022-11-18', '00:09:19'),
(22, 6, 22, 'Me encanto muchisimo', 5, '2022-11-18', '00:09:19'),
(23, 2, 20, 'Ni bueno ni malo', 3, '2022-11-18', '00:09:19'),
(24, 18, 26, 'Simplemente perfecto', 5, '2022-11-18', '00:09:19'),
(25, 20, 25, 'Me destrozo por completo', 5, '2022-11-18', '00:09:19'),
(26, 1, 31, 'Es un buen manga respecto a la forma en que plantea el universo ', 5, '2023-01-02', '15:48:41'),
(27, 8, 30, 'Espectacular este manga, pero a veces siento que va muy lento', 4, '2023-01-02', '15:48:41'),
(28, 18, 29, 'Bueno, no es malo del todo', 3, '2023-01-02', '15:48:41'),
(29, 20, 28, 'Vagabond es vida en todo sentido', 5, '2023-01-02', '15:48:41'),
(34, 1, 1, 'Es un excelente manga, pero el final no es para nada bueno', 3, '2023-01-04', '02:05:50'),
(35, 1, 14, 'Miura es increíble con la forma en la que dibuja de verdad', 5, '2023-01-04', '02:36:22'),
(36, 32, 1, 'Me pregunto si sacaran la segunda parte de este manga', 4, '2023-01-04', '19:09:38'),
(37, 17, 1, 'Al final ya no termine de leerlo, no me pareció muy bueno', 1, '2023-01-04', '19:29:32'),
(38, 33, 14, 'Excitacion por cada muerte', 5, '2023-01-05', '13:44:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `ideditorial` int(11) NOT NULL,
  `editorial` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`ideditorial`, `editorial`) VALUES
(1, 'Ninguna'),
(2, 'Planet Manga'),
(3, 'Panini Comics'),
(4, 'Panini Books'),
(5, 'DC COMICS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listadeseos`
--

CREATE TABLE `listadeseos` (
  `usuarios_idusuario` int(11) NOT NULL,
  `productos_idproducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `listadeseos`
--

INSERT INTO `listadeseos` (`usuarios_idusuario`, `productos_idproducto`) VALUES
(1, 2),
(1, 5),
(1, 14),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 28),
(1, 31),
(2, 2),
(2, 22),
(3, 3),
(3, 23),
(4, 4),
(4, 24),
(5, 5),
(5, 25),
(6, 6),
(6, 26),
(7, 7),
(7, 27),
(8, 8),
(8, 28),
(9, 9),
(9, 29),
(10, 10),
(10, 30),
(11, 11),
(11, 31),
(12, 12),
(12, 31),
(13, 13),
(13, 30),
(14, 14),
(14, 29),
(15, 15),
(15, 28),
(16, 16),
(16, 27),
(17, 17),
(17, 26),
(18, 18),
(18, 25),
(19, 19),
(19, 24),
(20, 20),
(20, 23),
(33, 3),
(33, 15),
(33, 21),
(34, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `categorias_idcategorias` int(11) NOT NULL,
  `colecciones_idcoleccion` int(11) NOT NULL,
  `editoriales_ideditorial` int(11) NOT NULL,
  `autores_idautor` int(11) NOT NULL,
  `nombreproducto` varchar(800) NOT NULL,
  `volumen` int(11) NOT NULL,
  `descripcionprod` varchar(1000) NOT NULL,
  `aniopublicacion` varchar(50) NOT NULL,
  `mespublicacion` varchar(300) NOT NULL,
  `numeropaginas` int(11) NOT NULL,
  `precio` float NOT NULL,
  `unidades` int(11) NOT NULL,
  `imagen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `categorias_idcategorias`, `colecciones_idcoleccion`, `editoriales_ideditorial`, `autores_idautor`, `nombreproducto`, `volumen`, `descripcionprod`, `aniopublicacion`, `mespublicacion`, `numeropaginas`, `precio`, `unidades`, `imagen`) VALUES
(1, 2, 12, 2, 12, 'AOT BEFORE THE FALL - BOXSET', 1, 'Este es un mundo controlado por los titanes... La humanidad convertida en alimento de gigantes ha construido paredes gigantescas y pagó el poder evitar los ataques con su libertad. Sin embargo la aparición del gran gigante destruye la paz simbólica que se había conseguido y provoca el inicio de una guerra sin esperanza. ¡Este es el inicio de la esperada serie!', '2022', 'Abril', 0, 1683, 15, 'AOT.PNG'),
(2, 2, 13, 2, 13, 'BLADE OF THE INMORTAL N.1 BOXSET', 1, 'Durante la era Edo de Japón, Manji, un guerrero con grandes cualidades para pelear, es conocido como el “asesino de los cien”, porque logró matar a ese número de samuráis. Yaobikuni, la anciana inmortal, es una sacerdotisa de más de 800 años que le concedió el don de la inmortalidad introduciéndole unos gusanos llamados kessenchuu, que curan cualquier herida e incluso restauran miembros amputados. Al morir su hermana, Manji desea redimir su culpa y adopta una misión: matar a 1,000 criminales.', '2022', 'Septiembre', 0, 1099, 4, 'BLADEOFTHEINMORTAL.PNG'),
(3, 2, 14, 2, 14, 'GANTZ 2 - BOXSET', 2, 'Es un manga seinen creado por Hiroya Oku en el año 2000. Combina la acción, la ciencia ficción, y las relaciones personales en el Japón contemporáneo, donde un grupo de personas, las cuales normalmente mueren en accidentes, aparecen en un enigmático apartamento en el cual se impone una gran esfera negra llamada Gantz. Poco después de su llegada y confusión, la esfera les indica que efectivamente han muerto y son obligados a cumplir las órdenes o misiones que el ser que habita dentro de la esfera les encomienda, obteniendo como premio el conservar sus vidas, si sobreviven al cumplimiento de dichas órdenes.', '2015', 'Diciembre', 0, 1300, 11, 'GANTZBOX.PNG'),
(4, 2, 14, 2, 14, 'GANTZ BOXSET 1', 1, 'Es un manga seinen creado por Hiroya Oku en el año 2000. Combina la acción, la ciencia ficción, y las relaciones personales en el Japón contemporáneo, donde un grupo de personas, las cuales normalmente mueren en accidentes, aparecen en un enigmático apartamento en el cual se impone una gran esfera negra llamada Gantz. Poco después de su llegada y confusión, la esfera les indica que efectivamente han muerto y son obligados a cumplir las órdenes o misiones que el ser que habita dentro de la esfera les encomienda, obteniendo como premio el conservar sus vidas, si sobreviven al cumplimiento de dichas órdenes.', '2015', 'Diciembre', 0, 1200, 10, 'GANTZBOX1.PNG'),
(5, 2, 15, 2, 15, 'FULL METAL ALCHEMIST N.1', 1, 'Del grandioso trazo de Hiromu Arawaka llega el tan esperado primer tomo de ¡Fullmetal Alchemist! Acompaña a los hermanos Elric en su búsqueda de la piedra filosofal, la cual necesitan para regresar sus cuerpos a la normalidad. En el camino, conocerán nuevos amigos y enemigos y, claro, también se divertirán. Así las cosas, corre a tu distribuidor más cercano y ¡pon en práctica el ´intercambio equivalente´ con él!', '2014', 'Diciembre', 0, 1999, 2, 'FMA-BOX.PNG'),
(6, 2, 9, 2, 9, 'DEATH NOTE BOXSET', 1, 'La historia se centra en Light Yagami, un estudiante de escuela secundaria. Un día, encuentra un cuaderno con poderes sobrenaturales llamado «Death Note», con el cual es capaz de matar personas si se escriben los nombres de estas en él, a la vez que si el portador visualiza mentalmente la cara de quien quiere asesinar.​ Light, percatándose del potencial del cuaderno, intenta eliminar a todos los criminales y crear un mundo donde no exista la maldad; sin embargo, un misterioso detective privado que se hace llamar L, famoso mundialmente por resolver grandes casos en el pasado, tratará de frustrar sus planes.', '2015', 'Diciembre', 0, 1249, 5, 'DN-BOX.PNG'),
(7, 3, 16, 2, 16, 'MADE IN ABYSS PACK 3', 1, 'La historia se centra en Riko, una joven huérfana que vive en la ciudad de Orth, en una isla en el mar de Beoluska. La ciudad rodea a un extraño agujero gigante cuyo fondo se dirige a las profundidades de la tierra. Dicho agujero es conocido como el Abismo. Dentro del Abismo se encuentran misteriosos artefactos abandonados y restos de una civilización avanzada que desapareció hace milenios y es por tanto un sitio explorado por excavadores cazarrecompensas denominados Cave Raiders', '2018', 'Diciembre', 0, 299, 2, 'MIA-PACK3.PNG'),
(8, 3, 7, 2, 7, 'VAGABOND PACK 3', 1, 'La historia del guerrero màs famoso del Japòn Musashi Miyamoto, basándose en las novelas de Eiji Yoshikawa sobre su vida', '2018', 'Diciembre', 0, 259, 10, 'VA-PACK3.PNG'),
(9, 3, 17, 2, 17, 'BLACK CLOVER PACK 3', 1, 'Asta y Yuno son huérfanos que se criaron juntos desde que nacieron después de ser abandonados en un orfanato de la iglesia de Hage, ubicada en la zona olvidada del Reino del Trébol al mismo tiempo. En un mundo donde todos tienen poder mágico, Asta es el único que ha nacido sin magia, lo que lo lleva a entrenar físicamente como compensación. Por el contrario, Yuno nació como un prodigio con un inmenso poder mágico y el talento para controlarlo.', '2017', 'Diciembre', 0, 259, 2, 'BC-PACK3.PNG'),
(10, 4, 18, 2, 18, 'DEMON SLAYER - NOVELA MARIPOSA DE UN ALA N.1', 1, '¡La segunda novela ligera de la popular serie Kimetsu no Yaiba! Aya Yajima, en compañía de las ilustraciones de Koyoharu Gotouge, regresan para contar más historias sobre algunos de los personajes para importantes del mundo de Demon Slayer. Desde los inicios de los Pilares más poderosos, el pasado de los personajes más silenciosos, hasta los entrenamientos especiales de los espadachines. Además, no puede faltar la segunda entrega del spin-off Instituto Kimetsu, en donde los autores nos mostraran una nueva faceta de los personajes. ', '2022', 'Septiembre', 216, 169, 10, 'DS-NOV1.PNG'),
(11, 4, 19, 2, 19, 'OVERLORD: THE UNDEAD KING N.14 (NOVELA)', 14, 'Sinopsis Overlord se sitúa en el año 2126, con la preocupación por el desuso de un videojuego llamado DMMORPG Yggdrasil, el cual fue bastante famoso por muchos años, pero la descontinuación del mismo implicó en que su repercusión poco a poco fue perdiéndose.', '2018', 'Diciembre', 560, 259, 1, 'OVER-NOV14.PNG'),
(12, 5, 1, 2, 1, 'BERSERK N.11', 11, 'Luego de que Guts abandonara a la Banda del Halcón, Griffith provocó la ira del rey de Midland, por lo que fue capturado y torturado. Además, el ejército de Midland atacó a la Banda del Halcón. Un año después, y a punto de colapsar, la banda hizo a Kasca su líder y todos comenzaron una vida de fugitivos. Tras escuchar los rumores, Guts regresa para repeler a quienes perseguían a la Banda del Halcón. Él y Kasca aclaran todo entre ellos y se piden perdón el uno al otro.Guts y los demás rescatan a Griffith y en las cañerías acaban con Bakiraka, el asesino. ¡Después, el rey envía a los Caballeros del Perro Negro, encabezados por Wyald!', '2020', 'Enero', 240, 99, 0, 'BERK11.PNG'),
(13, 5, 1, 2, 1, 'BERSERK N.12', 12, 'Con el regreso de Guts, la Banda del Halcón busca recuperar fuerzas y volver a los viejos días de gloria. Los pocos integrantes que quedaron de la banda rescatan a Griffith, quien quedó malherido tras la tortura a la que fue sometido tras seducir a la princesa Charlotte. Ahora, tras un extraño eclipse y la aparición de cuatro entes demoniacos, el futuro de estos guerreros se vuelve incierto…', '2021', 'Junio', 232, 99, 2, 'BERK12.PNG'),
(14, 5, 1, 2, 1, 'BERSERK N.10', 10, 'Luego de que Guts abandonara la Banda del Halcón, Griffith provocó la ira del rey al tener relaciones con su hija, la princesa Charlotte, por lo que fue capturado y torturado. Además, el ejército de Midland acorraló y atacó a la Banda del Halcón. Después de eso, los miembros de la banda vivieron como fugitivos durante un año con Kasca como líder. Tras escuchar los rumores, Guts regresa para ahuyentar a quienes perseguían a la Banda del Halcón y jura a sus integrantes que rescatará a Griffith. A la mañana siguiente, Kasca deja fluir sus sentimientos, Guts le hace el amor y, con ello, sus heridas emocionales surgen nuevamente.', '2020', 'Enero', 240, 99, 8, 'BERK10.PNG'),
(15, 5, 2, 2, 2, 'HUNTER X HUNTER N. 1', 1, '¡Ya está aquí una de las series más esperadas: Hunter x Hunter de Yoshihiro Togashi! Esta es la historia de Gon Freecss, un muchacho que vive en la Isla Kujira, y aspirante a ser cazador. Fascinado por la naturaleza y los animales exóticos, decide atrapar a la bestia del pantano de su isla para que Mito, su tía, le permita presentar la prueba de cazador. Gon no conoce a sus padres, ellos dejaron a Gon al cuidado de Mito y su abuela desde que pequeño. Así es como este muchacho emprende la travesía por mar y tierra para lograr su sueño: ser un hunter. ¡No te pierdas ningún volumen de esta serie!', '2017', 'Diciembre', 184, 99, 4, 'HXH1.PNG'),
(16, 5, 2, 2, 2, 'HUNTER X HUNTER N. 2', 2, 'Gon, Leorio y Kurapika llegaron a la sede de la prueba de cazador. Después de haber enfrentado diversas etapas de eliminación, lograron seguir, sanos y salvos, dentro de la serie de competencias. Pero no será tan fácil: los examinadores más astutos están listos para poner a prueba las habilidades físicas y mentales de los concursantes y de qué manera… ¡también verán al presidente del comité de evaluación! ¿Gon logrará sobresalir del resto de los contrincantes? ¡No te pierdas el tomo 2 de Hunter X Hunter!', '2017', 'Diciembre', 184, 99, 0, 'HXH2.PNG'),
(17, 5, 2, 2, 2, 'HUNTER X HUNTER N. 5', 3, 'La última prueba del examen de cazador ha terminado. Gon fue uno de los pocos competidores en aprobar. Pero pasa algo inesperado, Killua desaparece y se cree que es a causa de su hermano mayor, Illumi Zoldyck, encubierto como Gittarackur en el examen. Gon, Kurapika y Leorio deciden partir hacia la Kukuroo Mountain en donde vive la familia Zoldyck para rescatar a su amigo. ¿Lograrán entrar a la mansión de la familia Zoldyck sin un solo rasguño? ¡Descúbrelo en Hunter X Hunter 5!', '2017', 'Diciembre', 184, 99, 12, 'HXH3.PNG'),
(18, 5, 3, 2, 3, 'DRAGON BALL N.1', 1, 'Goku, es un niño muy especial que ha tenido que valerse por sí mismo en medio de la naturaleza y sin contacto con otras personas. Un día conoció a Bulma, una chica que busca las siete Esferas del Dragón, estos son elementos mágicos que al ser reunidos invocan a un dios dragón llamado Shenlong, el cual concederá un único deseo, cualquiera que este sea. Goku se une a Bulma en la búsqueda de las esferas sin imaginar que hay otros seres muy peligrosos que también las desean.', '2020', 'Enero', 192, 99, 5, 'DB1.PNG'),
(19, 5, 3, 2, 3, 'DRAGON BALL N.2', 2, 'Después de ayudar a Milk y a Ox Satán en el monte Frypan, Goku y Bulma se disponen a conseguir la última esfera no sin antes meterse en problemas con el Jefe Conejo y el terrible Pilaf que desea las esferas para dominar al Mundo. Veremos la primera aparición de Shenlong y aprenderemos porqué Goku y la Luna llena no son una buena combinación. Al final del tomo, Goku regresa con el Maestro Roshi para iniciar su entrenamiento.', '2021', 'Diciembre', 192, 99, 10, 'DB2.PNG'),
(20, 5, 4, 2, 4, 'WE NEVER LEARN N.9', 9, 'Una serie protagonizada por un estudiante aplicado de tercer año que desea superarse y obtener una beca especial para poder ayudar a su familia. Tendrá que superar numerosos obstáculos para cumplir su sueño.', '2020', 'Diciembre', 192, 129, 3, 'WNL9.PNG'),
(21, 5, 4, 2, 4, 'WE NEVER LEARN N.4', 4, 'Una serie protagonizada por un estudiante aplicado de tercer año que desea superarse y obtener una beca especial para poder ayudar a su familia. Tendrá que superar numerosos obstáculos para cumplir su sueño.', '2020', 'Diciembre', 192, 129, 7, 'WNL4.PNG'),
(22, 5, 6, 2, 6, 'OYASUMI PUNPUN N.6', 6, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 4, 'OPUNPUN6.PNG'),
(23, 5, 6, 2, 6, 'OYASUMI PUNPUN N.7', 7, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Octubre', 224, 129, 10, 'OPUNPUN7.PNG'),
(24, 5, 6, 2, 6, 'OYASUMI PUNPUN N.3', 3, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Octubre', 224, 129, 4, 'OPUNPUN3.PNG'),
(25, 5, 6, 2, 6, 'OYASUMI PUNPUN N.12', 12, 'Sachi se preocupa por la ausencia de Punpun, así que lo busca incluso con su padre, quien le revela varias situaciones duras que pudieron haber influido en su personalidad depresiva. Mientras tanto, Aiko y Punpun continúan huyendo tras la muerte de la madre de ella. Y justo cuando deciden establecerse en una provincia lejana, se enteran por las noticias que la policía descubrió el cuerpo de la mujer y está buscando a su hija desaparecida. Con todo en contra, ¿podrán construir un futuro mínimamente feliz? Lánzate a la aventura de la vida con las páginas de Oyasumi, Punpun 12.', '2022', 'Junio', 256, 129, 3, 'OPUNPUN12.PNG'),
(26, 5, 7, 2, 7, 'VAGABOND N.15', 15, 'La historia del guerrero màs famoso del Japòn Musashi Miyamoto, basándose en las novelas de Eiji Yoshikawa sobre su vida', '2018', 'Diciembre', 208, 129, 1, 'VA15.PNG'),
(27, 5, 7, 2, 7, 'VAGABOND N.14', 14, 'La historia del guerrero màs famoso del Japòn Musashi Miyamoto, basándose en las novelas de Eiji Yoshikawa sobre su vida', '2018', 'Diciembre', 208, 129, 0, 'VA14.PNG'),
(28, 5, 7, 2, 7, 'VAGABOND N.9', 9, 'La historia del guerrero màs famoso del Japòn Musashi Miyamoto, basándose en las novelas de Eiji Yoshikawa sobre su vida', '2018', 'Octubre', 208, 139, 8, 'VA9.PNG'),
(29, 5, 8, 2, 8, 'ONE PUNCH N.21', 21, '¡Saitama es un héroe tan fuerte que puede acabar con las criaturas más brutales de un solo golpe! ¡Comienza la leyenda de este sobrio héroe, en un manga de peleas como los demás, traído por una estrella de la red y un supertalento del dibujo! “Supongo que debería ir a aplicar justicia” – Saitama“Mi vida como héroe no es más que un pasatiempo” – Saitama“Quiero ser tu discípulo” - Genos', '2020', 'Julio', 232, 109, 10, 'OPM21.PNG'),
(30, 5, 8, 2, 8, 'ONE PUNCH N.11', 11, '¿Por qué los monstruos que pululan en las ciudades están ganando terreno? ¿Porque no hay suficientes héroes? ¿O porque aquellos que los enfrentan no saben trabajar en equipo, sino que cada uno busca su propia gloria para así poder subir de categoría en la Asociación de Héroes? ¿Y el desenfadado Saitama? ¿Aparecerá en el último minuto para vencer con su poderoso puño a las bestias destructoras? ¿O seguirá participando en el torneo de peleadores, para aprender artes marciales?', '2022', 'Julio', 216, 99, 7, 'OPM11.PNG'),
(31, 5, 8, 2, 8, 'ONE PUNCH N.1', 1, '¡Saitama es un héroe tan fuerte que puede acabar con las criaturas más brutales de un solo golpe! ¡Comienza la leyenda de este sobrio héroe, en un manga de peleas como los demás, traído por una estrella de la red y un supertalento del dibujo! “Supongo que debería ir a aplicar justicia” – Saitama“Mi vida como héroe no es más que un pasatiempo” – Saitama“Quiero ser tu discípulo” - Genos', '2020', 'Enero', 200, 119, 1, 'OPM1.PNG'),
(32, 5, 11, 2, 20, 'JUJUTSU KAISEN #4', 4, 'Yuji llega a detener el ataque de Junpei a su escuela. Este le cuenta lo que ocurrió con su madre, y Yuji lo invita a unirse a la Escuela de Brujería. Se aparece Mahitoy provoca una desgracia al mismo tiempo que ataca a Yuji con el propósito de hacer que Sukuna salga. Nanami llega a apoyar a Yuji y se libra una batalla épica contra la maldición. Por otro lado, por fin comienza el evento con el plantel de Kioto', '2020', 'Diciembre', 200, 119, 20, 'JJK4.PNG'),
(33, 5, 11, 2, 20, 'JUJUTSU KAISEN #3', 3, 'Fushiguro y Nobaratienen un enfrentamiento con los del plantel de Kioto, pero estos se retiran cuando los compañeros de segundo se presentan. No pinta bien para el evento de los dos planteles. Por otro lado, tres jóvenes mueren deformes en un cine a manos de Mahito, mientras Junpei, un chico normal, es testigo. Itadori y Nanami, un hechicero de primer grado, investigan el caso, y el rastro los lleva hasta Mahito y Junpei, quien manifiesta poder maldito.', '2020', 'Diciembre', 192, 119, 21, 'JJK3.PNG'),
(34, 5, 11, 2, 20, 'JUJUTSU KAISEN N.9', 9, 'Muerte Prematura (玉折 Gyokusetsu?) es el nombre del noveno volumen de la serie manga Jujutsu Kaisen, escrita e ilustrada por Gege Akutami. La misión de escolta del recipiente del plasma estelar cae en la peor situación cuando Satoru Gojo es atacado repentinamente por Toji Fushiguro. Y sí no fuera poco, Gojo debe enfrentarse a su amigo por problemas entre sus ideales. ¿Cuál fue el final del incidente del pasado día que hizo a Gojo el más fuerte y provocó la rebelión de Geto?', '2020', 'Diciembre', 192, 119, 40, 'JJK9.PNG'),
(35, 5, 11, 2, 20, 'JUJUTSU KAISEN N.13', 13, 'El Incidente de Shibuya, Estruendo (渋谷事変 -霹靂- Shibuya Jihen -Hekireki-?) es el nombre del décimo tercer volumen de la serie. ¡Una maldición se ha transformado en un espíritu aterrador...! ¡¡El interminable torrente del poder maldito del espíritu aterrador ataca a Naobito, Maki Zenin y Kento Nanami!! ¿¡Pero--!?', '2020', 'Diciembre', 192, 119, 12, 'JJK13.PNG'),
(36, 5, 11, 2, 20, 'JUJUTSU KAISEN N.6', 6, 'Destello Oscuro o Destello Negro (黒閃 Kokusen?) es el nombre del sexto volumen de la serie manga Jujutsu Kaisen, escrita e ilustrada por Gege Akutami. Durante el Evento de Buena Voluntad, las autoridades de la Escuela de Kioto ordenan a sus estudiantes asesinar a Itadori. Sin embargo, Mahito y una horda de maldiciones de grado especial y usuarios malditos complican las cosas atacando a los estudiantes.\n\nLos profesores se mueven rápidamente para contraatacar, pero se encuentran aislados por una barrera. ¡¿Podrán los estudiantes sobrevivir a este ataque demoníaco?![', '2020', 'Diciembre', 192, 119, 15, 'JJK6.PNG'),
(37, 5, 11, 2, 20, 'JUJUTSU KAISEN N.5', 5, 'Festival de Intercambio de las Escuelas Hermanas o Evento de Buena Voluntad de las Escuelas Hermanas (京都姉妹校交流会 Kyōto shimai-kō kōryū-kai?) (lit. Reunión de Intercambio con Kioto) es el nombre del quinto volumen de la serie manga Jujutsu Kaisen, escrita e ilustrada por Gege Akutami. Todos se sorprenden (y no necesariamente en buen sentido) cuando descubren que Itadori todavía está vivo, ¡pero no hay tiempo para una reunión conmovedora cuando el Colegio Técnico de Magia Metropolitana de Tokio está en medio de una intensa competencia con sus rivales de Kioto! Pero el buen espíritu deportivo no parece estar en juego una vez que las autoridades deciden eliminar la amenaza de Sukuna de una vez por todas...', '2020', 'Diciembre', 192, 119, 30, 'JJK5.PNG'),
(38, 5, 11, 2, 20, 'JUJUTSU KAISEN N.14', 14, 'Sukuna continúa libre causando estragos por todo Shibuya. Después de su duelo con Jogo, libra otra lucha de proporciones titánicas con el shikigami más poderoso que Fushiguro puede invocar. ¿Qué consecuencias traerá esto para Itadori? Además, Mahito sale de las sombras para llevar a cabo su jugada.', '2022', 'Enero', 192, 129, 50, 'JJK14.PNG'),
(39, 5, 11, 2, 20, 'JUJUTSU KAISEN N.18', 18, 'Itadori y Fushiguro se trasladan a Tochigi donde Hakari, de tercero de la Escuela de Brujería, opera un club clandestino de pelea. Su propósito es pedirle ayuda para acabar con el Viaje a la Extinción. Ahí se reúnen inesperadamente con un compañero de segundo, pero la pareja de Hakari los pone en aprietos con una técnica ritual muy peculiar.', '2022', 'Mayo', 192, 129, 47, 'JJK18.PNG'),
(40, 5, 11, 2, 20, 'JUJUTSU KAISEN N.17', 17, 'Okkotsu aparenta haber ejecutado a Itadori para que Naoya lleve la noticia a los altos mandos. Okkotsu e Itadori se reúnen con Fushiguro y Maki, y visitan al señor Tengen en su santuario para obtener información sobre Noritoshi Kamo y cómo detener su plan del “Viaje a la Extinción”. Después, Maki se dirige a la mansión Zenin para conseguir armas, pero no puede creer lo que ve ahí.', '2022', 'Abril', 192, 129, 47, 'JJK17.PNG'),
(41, 5, 11, 2, 20, 'JUJUTSU KAISEN N.10', 10, '¡MECHAMARU SE ENFRENTA A MAHITO! ôkichi Muta, tambien conocido como Mechamaru, se puso del lado de los espíritusalditos con tal de conseguir un cuerpo capaz de moverse. Sin embargo,as negociaciones entre ellos se han roto definitivamente y ahora se vebligado a enfrentarse a Mahito. Pero, ¡¿acaso Muta está llevando a cabo unlan secreto con el que escapar de una muerte segura?!', '2020', 'Diciembre', 192, 119, 21, 'JJK10.PNG'),
(42, 5, 11, 2, 20, 'JUJUTSU KAISEN N.12', 12, '¡El incidente de Shibuya se profundiza! Todos caen en confusión cuando el más fuerte de los chamanes cae en una situación imprevista.', '2020', 'Diciembre', 192, 119, 15, 'JJK12.PNG'),
(43, 5, 11, 2, 20, 'JUJUTSU KAISEN N.11', 11, 'El andén subterráneo de la estación de Shibuya se llena de civiles comunes y corrientes. Satoru Gojo lucha contra las maldiciones y se encuentra en una situación desesperada sin escapatoria. Sin embargo, el golpe decisivo del sello Gojo está en manos del enemigo... ¡¡Un aliado inesperado aparece corriendo hacia la plataforma subterránea!!', '2020', 'Diciembre', 192, 119, 43, 'JJK11.PNG'),
(44, 5, 11, 2, 20, 'JUJUTSU KAISEN N.8', 8, 'Tras la derrota de los hermanos malditos de grado especial, el trío de estudiantes del Colegio Técnico de Magia Metropolitana de Tokio logran recuperar los dedos de Sukuna. En respuesta a los resultados, son recomendados a subir como chamanes de primera clase. Mientras, Gojo investiga lo sucedido recientemente... ¿¡La especulación de Gojo detrás de escena es...!? - ¡¡La historia se remonta al caso del segundo año de la universidad técnica de Gojo y Geto!!', '2020', 'Diciembre', 192, 119, 23, 'JJK8.PNG'),
(45, 5, 11, 2, 20, 'JUJUTSU KAISEN N.7', 7, 'A pesar de las heridas y pérdidas que sufrieron del ataque en el Evento de Buena Voluntad, los estudiantes del Colegio Técnico de Magia Metropolitana de Tokio y del Colegio de Jujutsu de Kioto tienen poco tiempo para descansar ya que la gente comienza a morir en circunstancias misteriosas. ¿Podrían estas extrañas muertes tener algo que ver con los dedos perdidos de Sukuna?', '2020', 'Diciembre', 192, 119, 32, 'JJK7.PNG'),
(46, 5, 11, 2, 20, 'JUJUTSU KAISEN N.0', 0, 'Yuta Okkotsu es un estudiante de secundaria que desea su muerte debido a que es acechado por el espíritu de su amiga de la infancia, Rika Orimoto, quien murió en un accidente de tráfico. Mientras tanto, Satoru Gojo, un profesor del Colegio Técnico de Magia Metropolitana de Tokio tiene planes de ayudar a Yuta a controlar a la maldición y convertirlo en un chamán', '2020', 'Diciembre', 200, 119, 21, 'JJK0.PNG'),
(47, 5, 11, 2, 20, 'JUJUTSU KAISEN N.16', 16, 'Itadori se encuentra a merced de Geto, pero llegan inesperados aliados a asistirlo. Sin embargo, Geto libera a sus espíritus malditos en Tokio, los que crean un caos. ¿Cómo se enfrentará Itadori a las repercusiones que tendrán lo acontecido en Shibuya en el mundo de la brujería y en el de los no hechiceros?', '2022', 'Marzo', 192, 129, 43, 'JJK16.PNG'),
(48, 5, 11, 2, 20, 'JUJUTSU KAISEN N.15', 15, 'El corazón de Itadori está a punto de romperse por todas las desgracias que le han ocurrido en Shibuya, pero de repente se le une uno de sus más grandes aliados. Entonces la batalla contra Mahito continúa con gran ímpetu, desde los corredores de la Estación de Shibuya hasta las desoladas ruinas de la superficie. ¿Cuál será el desenlace del duelo de estos archienemigos?', '2020', 'Diciembre', 192, 129, 19, 'JJK15.PNG'),
(49, 5, 11, 2, 20, 'JUJUTSU KAISEN N.19', 19, 'Itadori y Fushiguro entran a la Colonia N.° 1 de Tokio en busca de Higuruma, un jugador del Viaje a la Extinción que posee 100 puntos, con el objetivo de crear una nueva regla que sirva como ruta de escape del juego mortal. Sin embargo, caen en diferentes puntos de la colonia, y cada uno tiene que hacer uso de la violencia para defenderse de los jugadores que los atacan.', '2022', 'Septiembre', 208, 129, 54, 'JJK19.PNG'),
(50, 5, 11, 2, 20, 'JUJUTSU KAISEN N.1', 1, 'Yuji Itadori es un joven con habilidades físicas excepcionales que se une al club de ocultismo de la escuela porque le permite salir temprano y visitar a su abuelo en el hospital. Este, antes de morir, le pide que use su fuerza para ayudar a las personas. Ahí se aparece un estudiante de hechicero, Fushiguro, y le pide a Yuji el objeto maldito que encontró. Él le dice que sus compañeros del club van a abrirlo en la escuela, y ambos corren a rescatarlos. Al llegar, están rodeados de maldiciones (monstruos), y para salvar a sus compañeros, Yuji se traga el objeto maldito y se convierte en Sukuna.', '2020', 'Septiembre', 200, 109, 2, 'JJK1.PNG'),
(51, 5, 11, 2, 20, 'JUJUTSU KAISEN N.2', 2, 'En medio de la misión, Yuji cambia de lugar con Sukuna, quien derrota con facilidad a la maldición de grado especial. Sin embargo, este se sale de control y ataca a Fushiguro. Sukuna se arranca él mismo el corazón para que Yuji no pueda regresar, pero aun así vuelve para salvar a Fushiguro, y muere. Gojo cree que esa misión fue un plan de los altos mandos para deshacerse de una vez de Sukuna. De vuelta en la escuela, los de segundo invitan a Fushiguro y Kugisaki a un evento con los del plantel de Kioto, en parte para que se sobrepongan del fallecimiento de Yuji. En otro lado, otras maldiciones de grado especial comienzan a conspirar contra Gojo.', '2020', 'Octubre', 200, 109, 9, 'JJK_2.png'),
(52, 5, 14, 2, 14, 'GANTZ N.23', 23, 'Aunque el experimentado equipo de Gantz Osaka ha acabado casi con todos los alienígenas, aún debe enfrentarse con los cómplices del jefe final, ¡pero son enormes e increíblemente fuertes! El equipo Gantz Tokio reconoce que el nivel de esta batalla lo supera y no tiene más opción que observar desde lejos. Nurarihyon, el jefe final, hace su aparición, ¡¿Cuál será el alcance de su poder?!', '2015', 'Diciembre', 216, 99, 12, 'GANTZ23.PNG'),
(53, 5, 14, 2, 14, 'GANTZ N.26', 26, 'Después de completar la complicada misión en Osaka, nuestro equipo es sorprendido nuevamente por una serie de enigmas con respecto a Gantz. Nishi le informa a todo el equipo acerca de “Katastrophe”, el evento que podría significar el fin del mundo tal y como lo conocemos. A tan solo una semana para el evento, nuestro equipo regresa a su vida diaria sin saber cómo lidiar con esta noticia. El equipo es llamado por Gantz en lo que podría ser su “última misión” antes de Katastrophe.', '2015', 'Diciembre', 200, 99, 19, 'GANTZ26.PNG'),
(54, 5, 14, 2, 14, 'GANTZ N.29', 29, 'El cielo se ha tornado rojo y así llegó la destrucción de los Estados Unidos. Mientras tanto, unos seres desconocidos están decididos a atacar a Japón. Finalmente ocurre el primer encuentro con una civilización alienígena. La última esperanza del planeta recae sobre los hombros de los equipos de Gantz… Se dibuja un panorama aterrador. Todos atestiguan algo que nunca antes habían visto.', '2015', 'Diciembre', 216, 99, 15, 'GANTZ29.PNG'),
(55, 5, 14, 2, 14, 'GANTZ N.33', 33, 'La humanidad es acribillada y expuesta como si se tratase de un vil espectáculo. En el campo de batalla se destaca la voluntad de aquellos que fueron obligados a pelear por aquellos que decidieron luchar hasta el final. Kato y los demás se enfrentarán en esta ocasión a monstruos muy poderosos, casi indestructibles. Por otra parte, Kurono finalmente encuentra a Tae y Nishi parece tener la clave para GANTZ… ¡¿Qué será lo que encontró?! El contraataque de la humanidad apenas comienza…', '2015', 'Diciembre', 216, 99, 12, 'GANTZ33.PNG'),
(56, 5, 14, 2, 14, 'GANTZ N.19', 19, 'Tras una difícil batalla, el jefe demoniense es derrotado. Los miembros del equipoesperan ansiosos sus puntajes y planean la mejor forma de aprovecharlos. Sorpresivamente, cuatro personas son traídas de vuelta, un arma con más poder essolicitada y... Kurono toma una decisión que trastocará su vida por completo. ¿Cómoretomar tu vida donde la dejaste, sin recordar nada de tu pasado? Las grandes batallas en Gantz no se libran solo en la calle, sino también en el interior de la mente.', '2017', 'Marzo', 232, 99, 23, 'GANTZ19.PNG'),
(57, 5, 14, 2, 14, 'GANTZ N.1', 1, '¡Vuelve a México el manga seinen Gantz de Hiroya Oku! Kurono y Kato debieron haber muerto tras ser arrollados por un tren dentro del metro, pero solo un segundo después se encuentran misteriosamente encerrados en un cuarto. Kurono y los demás reciben órdenes de una extraña esfera negra: deben asesinar a los alienígenas cebollenses. Sin entender claramente la situación, son llevados a donde se encuentran los alienígenas. De alguna manera logran matar a uno de los alienígenas, pero justo entonces aparece otro más grande y peligroso…', '2015', 'Diciembre', 216, 99, 12, 'GANTZ1.PNG'),
(58, 5, 14, 2, 14, 'GANTZ N.4', 4, 'Kurono y los demás reciben instrucciones para capturar al alienígena Tanaka. Inmediatamente después de ser enviado por Gantz, Kurono se encuentra con él, quien, con un semblante macabro y acompañado de pequeñas criaturas, continúa su camino ignorando a Kurono. “¿Yuzo-Kun?” es la misteriosa palabra que pronuncia al encontrarse con Kurono y los demás. Por otra parte, vemos como Nishi, aun en su estado invisible, es atacado por el alien Tanaka. Este último contraataca con un increíble ataque sonoro. ¡Además muchos de los misterios que guarda Nishi finalmente son develados!', '2015', 'Diciembre', 224, 99, 43, 'GANTZ4.PNG'),
(59, 5, 14, 2, 14, 'GANTZ N.15', 15, 'En Shibuya, Kurono e Izumi son emboscados por el grupo de los de traje negro. Durante el combate, Kurono se niega a ayudar a Izumi. Frente a esta reacción, Izumi no tiene más opción que acabar el solo con esos enemigos. Por otro parte, Kurono comienza a preocuparse por la seguridad de Kojima debido a los continuos ataques inesperados en los que termina involucrado. Además, se descubre el encuentro secreto entre él y la ídolo Reika, provocando su ruptura con Kojima. Con todo el pesar, Kurono decide continuar con las misiones; sin embargo, Gantz les pone como objetivo acabar con…', '2015', 'Diciembre', 232, 99, 21, 'GANTZ15.PNG'),
(60, 5, 14, 2, 14, 'GANTZ N.18', 18, 'Se intensifica la batalla contra los “demonienses”, que han mostrados poseer diferentes y muy variados poderes. Sin embargo, el equipo de Gantz logra vencer a los jefes de escuadrón, ¡lo cual provoca que frente a ellos aparezca el jefe final decidido a masacrarlos! La humanidad corre peligro frente a la incomparable fuerza de este enemigo que posee un poder destructivo nunca antes visto por los miembros de Gantz. Además, empiezan a suceder cambios en el escenario de Gantz, ¡pues ahora pueden ser vistos y la restricción de tiempo desaparece!', '2015', 'Diciembre', 214, 99, 10, 'GANTZ18.PNG'),
(61, 5, 14, 2, 14, 'GANTZ N.30', 30, 'La humanidad ha sido atacada de manera sorpresiva, la fuerza militar estadounidense se perdió en tan solo un instante. Inmediatamente después sobrevino una invasión terrestre con un ejército de gigantes alienígenas. Luego de dejar en ruinas a gran parte de las ciudades, los alienígenas han secuestrado a los humanos sobrevivientes, Tae se encuentra entre sus prisioneros, mientras que Kurono la busca con desesperación. ¡¿Qué le depara el destino cruel a Tae?!', '2015', 'Diciembre', 192, 99, 18, 'GANTZ30.PNG'),
(62, 5, 14, 2, 14, 'GANTZ N.36', 36, 'La humanidad, aprovechándose de la tecnología e información de GANTZ, finalmente ha detenido la amenaza de la invasión alienígena. Con la esperanza de la pronta victoria, los equipos de GANTZ son transportados hasta un misterioso espacio llamado, “La habitación de la verdad”. ¿Cuál ha sido el objetivo de los grupos alienígenas? ¡¿Qué demonios es GANTZ?! ¿Por qué Kurono y los demás han sido obligados a pelear hasta ahora? ¡Una infinidad de misterios más serán revelados!', '2015', 'Diciembre', 216, 99, 16, 'GANTZ36.PNG'),
(63, 5, 14, 2, 14, 'GANTZ N.34', 34, 'Kurono y Tae por fin logran reencontrarse, pero casi de inmediato Kurono es llamado nuevamente alo combate. En esta ocasión todos los guerreros aparecen montados sobre el arma definitiva de GANTZ. El contraataque que tanto anhelaba la rebelión da inicio, en lo que al mismo tiempo es la última misión de GANTZ. Por otra parte, Nishi logra hackear el programa de GANTZ… Y también Reika va en busca de un solitario Kurono en combate…', '2015', 'Diciembre', 216, 99, 10, 'GANTZ34.PNG'),
(64, 5, 14, 2, 14, 'GANTZ N.21', 21, 'El equipo de Gantz, que ya no cuenta con Izumi ni Kurono, es enviado a cumplir una nueva misión. Sin poder tener ni un solo momento para llorar la muerte de Kurono, el equipo llega a un lugar que nunca antes habían visitado durante sus misiones: Osaka. Allí los miembros descubren que existen más equipos de Gantz, ¿el equipo de Osaka será aliado o enemigo? ¡Se está gestando un nuevo mundo en el universo de Gantz!', '2017', 'Mayo', 208, 99, 25, 'GANTZ21.PNG'),
(65, 5, 14, 2, 14, 'GANTZ N.16', 16, 'Por instrucciones de Gantz, Tae Kojima se convierte en el objetivo de la siguiente misión. Así comienza una escisión entre los partidarios de Kurono y los de Izumi. Kurono mata por primera vez a un ser humano tratando de proteger a su ser querido. Aun así, Izumi acaba con la vida de Kojima…Tras la pérdida, Kurono descubre que si reúne 100 puntos, Gantz le ofrecerá un menú de posibilidades, entre ellas, el de poder revivir a los miembros caídos…', '2015', 'Diciembre', 224, 99, 12, 'GANTZ16.PNG'),
(66, 5, 14, 2, 14, 'GANTZ N.31', 31, 'La humanidad se encuentra devastada… Tokio está siendo reducida a cenizas… Ha comenzado la batalla de cada uno de los miembros de GANTZ. Finalmente nuestro equipo decide regresar a la habitación de GANTZ con el fin de encontrar más pistas sobre lo que está ocurriendo. Por otro lado, continúa la solitaria batalla de Kurono con el único objetivo de rescatar a Tae… Sin embargo, antes debe salvar a otro grupo de personas, que al igual que ella, han sido abducidos…. ¡¿Acaso habrá un atisbo de luz en esta guerra sin esperanza?! ¡¿Comenzará por fin el capitulo que da inicio a la rebelión?!', '2015', 'Diciembre', 216, 99, 32, 'GANTZ31.PNG'),
(67, 5, 14, 2, 14, 'GANTZ N.17', 17, 'Kurono sabe que debe acumular 100 puntos para revivir a sus amigos caídos en combate, ¡por eso ansía la llegada de la siguiente misión! Kurono entrena a todos los miembros del equipo en sus ratos libres con el fin de aumentar las posibilidades de sobrevivencia. Una misión nueva es asignada y aparece un nuevo enemigo: los demonienses, quienes se presentan de forma humana capaces de hablar. Ellos que son parte de la organización que está detrás del equipo Gantz. ¡Aquí comienza una batalla épica! En esta ocasión, los alienígenas conocen la debilidad del traje negro de Gantz.', '2015', 'Diciembre', 228, 99, 21, 'GANTZ17.PNG'),
(68, 5, 14, 2, 14, 'GANTZ N.12', 12, 'Izumi perpetra la masacre y toma a Kojima como rehén para atraer a Kurono. Ambos se baten en un duelo, pero son transportados a la habitación. Esta vez, la misión es acabar con dinosaurios. Una vez más, Kurono se encuentra en una situación difícil, ya que debe juntar al menos quince puntos para sobrevivir a la misión; y por si fuera poco, no lleva su traje. De regreso al mundo de Gantz, ¡Izumi deberá enfrentarse nuevamente a alienígenas!Frases“¿Has visto “westerns”? Resolvamos esto como en las películas” – Izumi a Kurono“Finalmente estoy en la habitación de Gantz” – Izumi“Decidí traer personas fuertes.” - Gantz', '2015', 'Diciembre', 224, 99, 11, 'GANTZ12.PNG'),
(69, 5, 14, 2, 14, 'GANTZ N.11', 11, 'Izumi, el estudiante transferido, muestra gran interés en Kurono. Le confiesa que desea entrar nuevamente en el mundo de Gantz y llevarse consigo nuevos reclutas por orden de la esfera negra. La manera de cumplir con los deseos de Gantz es llevar a cabo una gran matanza en Shinjuku en un día domingo. Kurono hace caso omiso, pero cuando se entera de que Kojima, su novia, se encuentra en Shinjuku, no le queda otra que dirigirse hasta ahí. Mientras tanto, ¡Izumi convierte el distrito de Shinjuku en un mar de sangre! ¡Volveré a la habitación el próximo domingo! – Izumi a KuronoSerás culpable de muertes inocentes… - Izumi a Kurono¡Sal de Shinjuku! – Kurono a Kojima¡¿Espera que me vengue y lo mate?!', '2015', 'Diciembre', 224, 99, 12, 'GANTZ11.PNG'),
(70, 5, 14, 2, 14, 'GANTZ N.27', 27, 'Por alguna razón la pantalla de Gantz comienza a fallar y el equipo es enviado a una misión en Italia, país que se ha convertido en el escenario de una gran batalla en donde equipos de todos los países luchan a muerte contra cientos de alienígenas que asesinan fácilmente a los equipos de Gantz, incluso con el traje puesto. ¿Quiénes sobrevivirán esta vez? ¡Aquellos que lo logren, solo encontrarán un mundo a punto de ser atacado por una misteriosa fuerza!', '2015', 'Diciembre', 232, 99, 25, 'GANTZ27.PNG'),
(71, 5, 14, 2, 14, 'GANTZ N.20', 20, 'Al caer la tarde, tres chicas siguen a unos atractivos jóvenes que las conducen a un club privado, para lo que promete ser una noche intensa y divertida. Pero en ese lugar, mezcla de antro nocturno y club de peleas, ellas encontrarán su cruento final, a manos de un grupo de hombres tenebrosos. ¿Quiénes son estos seres que no mueren fácilmente y que temen la luz del sol? ¿Porque quieren acabar con el Equipo Gantz? ¿A qué se debe su obsesión con Kurono y con Izumi? Sangre, masacres y feroces peleas en el tomo 20 de Gantz.', '2015', 'Diciembre', 210, 99, 21, 'GANTZ20.PNG'),
(72, 5, 14, 2, 14, 'GANTZ N.10', 10, 'Kurono, quien protege a Kojima, logra acabar con el alienígena enanense en medio del cerco policiaco. Sin embargo, a pesar de que todo el equipo de operaciones táctica atestiguó la existencia del alienígena, no revelan información sobre la existencia del mismo. Además, hay gente nueva: Sakurai, un chico que intentaba suicidarse, se hace con una nueva habilidad; y Kaze, un hombre que busca ser el más fuerte de todo el mundo. ¡¿Acaso su destino es formar parte del mundo de Gantz?!“Gantz va a matarme.” - Kurono“A pesar de haberlo visto, la policía guarda silencio”. – Kurono“¿Tú eres el más fuerte de esta escuela?” – Kaze“Vine para darte este poder.” - Sakata', '2015', 'Diciembre', 108, 99, 16, 'GANTZ10.PNG'),
(73, 5, 14, 2, 14, 'GANTZ N.22', 22, 'La batalla en Dotonbori en contra de los alienígenas se intensifica cada vez más. Las monstruosas criaturas que van apareciendo una tras otra son abatidas por el experimentado equipo de Gantz de Osaka. Sin embargo, Kato se da cuenta de que solo se preocupan por sobrevivir sin ayudar a los civiles. ¡¿Podrá el sentido de justicia de Kato derretir el corazón frío del equipo de Osaka?! ¡Un evento sin precedentes se está gestando en Osaka! ¡¿Acaso estamos cerca de la destrucción total?!', '2015', 'Diciembre', 208, 99, 12, 'GANTZ22.PNG'),
(74, 5, 27, 2, 28, 'MY DRESS-UP DARLING N.1', 1, 'Marin Kitagawa es una chica popular y atractiva que siempre está en el centro de su círculo de amigos. Para su compañero de clase Wakana Gojo, era casi como si ella viviera en un mundo aparte. Wakana desea convertirse en artesano de muñecas hina y, para eso, un día decide practicar en la sala de costura del colegio des pues de clase. ¿Y con quién se encuentra entonces…? Imaginen…¿Con quién va a ser? ¨ ¿Me ayudarías a hacerme un disfraz de cosplay? ¨ ¡Así empieza su emocionante relación en la que tendrán que compaginar el cosplay con su vida escolar!', '2023', 'Enero', 202, 149, 38, 'MDUD1.PNG'),
(75, 1, 26, 1, 27, 'Calendario / Agenda One Piece 2023', 0, '¡Enfrenta cada día de 2023 en compañía de tus nakama con el paquete de calendario y agenda de One Piece! Coloca el calendario donde puedas consultarlo con facilidad mientras disfrutas increíbles ilustraciones a color realizadas por Eiichiro Oda. Pero si necesitas realizar una planeación más detallada, cada mes de la agenda está dedicado a un tripulante de Sombrero de Paja (o a un socio o a un enemigo) en los colores oficiales que les asignó el creador de la serie. ¡Pasa el mejor de los años mientras buscan juntos la última isla!. Calendario / Agenda One Piece 2023. 44x60, a color', '2023', 'Enero', 0, 439, 300, 'OPCAL.png'),
(76, 6, 22, 3, 23, 'CODE PRU (CINEMA PURGATORIO BY ENNIS)', 1, 'Dos paramédicos, Prudence y Eric, recorren Nueva York intentado ayudar a la gente… solo que entre esa “gente” abundan vampiros, hombres lobo, alienígenas y todo tipo de monstruos fantásticos que también tienen derecho a recibir primeros auxilios nada… convencionales. Criaturas surgidas de los más insondables mundos de ficción se dan cita en Código Pru, una serie nacida y publicada en los 18 números de Cinema Purgatorio que este libro recopila. Se trata de una historia que aúna fantasía, terror, humor, parodia y serie negra a partes iguales, escrita por el británico Garth Ennis (The Punisher, Stitched, Crossed, Sara) y dibujada por el español Raúlo Cáceres (Crossed, The Extinction Parade, Galería de Engendros).', '2022', 'Diciembre', 176, 279, 15, 'CODE1.PNG'),
(77, 6, 23, 3, 24, 'STAR WARS THE MANDALORIAN GRAPHIC NOVEL SEASON 1 VOL.1', 1, 'Se suponía que sería una cacería de recompensa como tantas otras. Sin preguntas. Sin complicaciones. Pero la vida del Mandaloriano cambia por completo cuando descubre que la presa es un infante de una raza misteriosa, un huérfano como él mismo fue alguna vez. Dado que otros cazarrecompensas y lo que queda del Imperio Galáctico persiguen al infante, el guerrero solitario se ve obligado a viajar de planeta', '2022', 'Noviembre', 80, 209, 27, 'START2.PNG'),
(78, 6, 24, 3, 25, 'THE RESISTANCE VOL.2', 2, '¡Bienvenido de nuevo al mundo de The Resistance! Tras el asesinato de su líder, el caos reina en la Resistencia, sus miembros perdieron el contacto y las autoridades de todo el mundo van tras ellos... incluido un ejército de renacidos reclutados por el presidente estadounidense. Para evitar su aniquilación a manos de un gobierno con tendencia claramente fascista, la Resistencia deberá descubrir su as bajo la manga y la clave para usarlo. Un nuevo capítulo de la ambiciosa y aclamada serie creada por J. Michael Straczynski se desarrolla en estas páginas cargadas de reflexiones políticas y humanas.', '2022', 'Septiembre', 200, 319, 12, 'RES2.PNG'),
(79, 6, 25, 3, 26, 'EL VIEJO Y EL NARCO (EXPORT.)', 1, 'Se llamaba Don Alejo García. Era un viejo ranchero mexicano. Trabajador, honrado. Un hombre de palabra. En abril de 2011 dos camionetas cargadas de narcotraficantes irrumpieron en su finca y exigieron que la propiedad les fuera entregada en 24 horas. - Lo pensaré -dijo el viejo. -La finca o plomo, abuelo -respondieron los narcos. Así pues, D. Alejo reunió a sus trabajadores y les pagó. Ordenó que nadie acudiera a trabajar al día siguiente. Se encerró en su casa y, en la oscuridad de la noche, se lo pensó. En ese rancho había criado a su hija. Allí había enterrado a su esposa. El viejo desempolvó sus escopetas de caza y se sentó a esperar. La decisión estaba tomada. Solo hay una forma de vivir y de morir, pensó. De pie. Como un hombre.', '2019', 'Octubre', 64, 149, 13, 'NARC1.PNG'),
(80, 6, 28, 3, 29, 'CUATRO FANTÁSTICOS: CÍRCULO COMPLETO', 1, 'Es una noche lluviosa en Manhattan y no hay ni una criatura a la vista... excepto por Ben Grimm. Cuando un intruso aparece de pronto dentro del Edificio Baxter, los Cuatro Fantásticos — Mister Fantástico (Reed Rechards), la Mujer Invisible (Susan Storm Richards), la Antorcha Humana (Johnny Storm) y la Mole (Ben Grimm)— se ven rodeados de un enjambre de parásitos invasores. Estas criaturas carroñeras compuestas por energía negativa llegan a la Tierra usando a un anfitrión humano. ¿Pero cuál es su propósito? ¿Y quién está detrás de esta inoportuna invasión? ¡A los Cuatro Fantásticos no les queda más opción que viajar a la Zona Negativa, un universo alienígena compuesto enteramente de antimateria, arriesgando no solo sus vidas sino el destino del cosmos! Los Cuatro Fantásticos: Círculo completo es la primera obra larga escrita y dibujada por el aclamado artista Alex Ross, quien revisita una clásica historia de Stan Lee y Jack Kirby de los años 60 y la introduce para una nueva generación d', '2022', 'Octubre', 64, 499, 25, 'CUATROF1.PNG'),
(81, 6, 29, 3, 30, 'STAR WARS: DARTH VADER (2015) 12', 12, 'Por fin Darth Vader y Luke Skywalker coinciden en Vrogas Vas, el primero con la intención de convertir a Luke al lado oscuro y el segundo solo desea acabar con el oscuro Lord de los Sith. Pero no están solos porque varios escuadrones de la rebelión se coordinan para derrotar a Darth Vader que no caerá fácilmente. Leia, Han Solo y Chewbacca se apresuran para capturar a Darth Vader y Aphra para rescatarlo.“Bajen sus armas… y no los lastimaré.” – Darth Vader“Qué gusto saber cuáles son tus prioridades…” – Han Solo a Leia“Puedo lidiar con el ejército rebelde, pero Darth Vader da más miedo.” - Aphra', '2014', 'Diciembre', 24, 25, 34, 'DARTHVA12.PNG'),
(82, 6, 29, 3, 30, 'STAR WARS: DARTH VADER (2015) 8', 8, 'Después de su nostálgica visita a Tatooine, Darth Vader debe volver a sus ocupaciones normales por lo que él y Aphra toman caminos separados. Mientras tanto, en el planeta Son-Tuul del Borde Exterior un grupo de mercenarios y cazarrecompensas son recibidos por Aphra, quien les ofrece la oportunidad de robar, de una nave imperial, la fortuna de toda una vida…', '2014', 'Diciembre', 24, 25, 21, 'DARTHVA8.PNG'),
(83, 6, 29, 3, 30, 'STAR WARS: DARTH VADER (2015): VADER DOWN (TPB)', 0, 'En su afán de atrapar al piloto que destruyó la Estrella de la Muerte, Darth Vader se encuentra de lleno con toda la flota rebelde, pero en lugar de huir... ¡decide enfrentarla! En ese combate Luke le hace frente y ambas naves caen en un planeta cercano, donde empezará la cacería: Vader tras Luke, y todos, rebeldes e imperiales, tras Vader, en un encuentro sin precedentes. ¡Star Wars y Darth Vader colisionan en el primer crossover de la nueva era de Sar Wars! ¡Es Vader Down!', '2017', 'Diciembre', 192, 189, 54, 'DARTHVA0.PNG'),
(84, 6, 29, 3, 30, 'DARTH VADER (NUEVA SERIE) N.19', 19, 'Luego de poseer varios cuerpos, el espíritu de Momin traiciona a Vader usando el portal para resucitar su cuerpo original. Pero, al final, es destruido tras un duelo feroz. Dañado pero no vencido, Vader se prepara para pasar por el portal creyendo que puede resucitar el espíritu de su esposa muerta, Padmé Amidala. Y ahora, Darth Vader enfrentará su destino.', '2017', 'Diciembre', 64, 59, 25, 'DARTHVA19.PNG'),
(85, 6, 29, 3, 30, 'STAR WARS OMNIBUS: DARTH VADER DE CHARLES SOULE', 0, 'Posterior a los acontecimientos del Episodio III — La venganza de los Sith, Vader renace como el Lord Oscuro del Sith. Luego de perder todo lo que amaba y siendo más máquina que hombre, ¡Vader da sus primeros pasos en un mundo más oscuro al erradicar de la Galaxia a los Jedi restantes! La bibliotecaria Jocasta Nu hace un esfuerzo desesperado por preservar el legado Jedi, ¡y aparecen indicios de una rebelión en Mon Cala! Para garantizar que el control del Emperador sobre la Galaxia sea absoluto, Vader debe lidiar rápida y brutalmente con cualquier levantamiento… pero también tiene su propio objetivo. A medida que la oscuridad se eleva sobre Mustafar, escenario de su mayor derrota, ¿el hombre que alguna vez se llamó Anakin Skywalker se dará cuenta de su verdadero destino?', '2021', 'Diciembre', 624, 1800, 38, 'DARTHVAOM.PNG'),
(88, 6, 30, 3, 31, 'MILES MORALES: SHOCK WAVES', 0, 'Miles Morales es un chico normal que combina sus estudios con sus actividades heroicas como Spider-Man. Después de que un terremoto azota Puerto Rico, lugar de nacimiento de su madre, Miles ayuda a organizar una recaudación de fondos. Pero cuando desaparece el padre de una nueva estudiante, Miles empieza a hacer conexiones entre el hecho y una corporación gigante que patrocina la recaudación. ¿Quién está detrás de la desaparición y cómo se relaciona con Spider-Man?', '2020', 'Diciembre', 128, 129, 56, 'MILES0.PNG'),
(89, 6, 29, 3, 30, 'STAR WARS: DARTH VADER (2015) 1 - Portada C', 1, 'Las naves rebeldes que atacaron desde una base oculta en la luna de Yavin han obtenido una impactante y sorpresiva victoria en contra del legítimo reinado del Imperio Galáctico. El arma pacificadora definitiva del Imperio, LA ESTRELLA DE LA MUERTE, fue destruida. Sin su fuerza disuasiva, el Estado de Derecho está en peligro. El Amo del Sith, Lord DARTH VADER, ha servido lealmente a su Maestro durante 19 años. Pero ahora Vader le ha fallado al Emperador y debe pagar el precio… Kieron Gillen y Salvador Larocca nos traen la historia del hombre detrás de la máscara del mal.', '2014', 'Diciembre', 48, 39, 32, 'DARTHVA1C.PNG'),
(90, 6, 29, 3, 30, 'STAR WARS: DARTH VADER (2015) 1 - Portada B', 1, 'Las naves rebeldes que atacaron desde una base oculta en la luna de Yavin han obtenido una impactante y sorpresiva victoria en contra del legítimo reinado del Imperio Galáctico. El arma pacificadora definitiva del Imperio, LA ESTRELLA DE LA MUERTE, fue destruida. Sin su fuerza disuasiva, el Estado de Derecho está en peligro. El Amo del Sith, Lord DARTH VADER, ha servido lealmente a su Maestro durante 19 años. Pero ahora Vader le ha fallado al Emperador y debe pagar el precio… Kieron Gillen y Salvador Larocca nos traen la historia del hombre detrás de la máscara del mal.', '2014', 'Diciembre', 48, 39, 21, 'DARTHVA1B.PNG');
INSERT INTO `productos` (`idproducto`, `categorias_idcategorias`, `colecciones_idcoleccion`, `editoriales_ideditorial`, `autores_idautor`, `nombreproducto`, `volumen`, `descripcionprod`, `aniopublicacion`, `mespublicacion`, `numeropaginas`, `precio`, `unidades`, `imagen`) VALUES
(91, 6, 29, 3, 30, 'STAR WARS: DARTH VADER (2015) 22', 22, 'Vader venció a Voidgazer y sus abominables experimentos, pero luego fue golpeado por la explosión que Cylo planeó para él. E incluso si lograra escapar de eso, su siguiente oponente será Morit. Al mismo tiempo, la Doctora Aphra está huyendo luego de que su plan con Triple-Cero y BT funcionara, pero por más que corra, Vader irá tras ella, así que quizá sea momento de pensar en algo todavía más arriesgado. ¡A solo dos números del gran final de la serie, llega Darth Vader 22!', '2014', 'Diciembre', 24, 27, 21, 'DARTHVA22.PNG'),
(92, 6, 31, 3, 30, 'STAR WARS (2015) N.41', 42, 'Han, Leia y Luke llegaron a Jedha con el objetivo de contactar a los guerrilleros de Saw Gerrera. Leia está segura de que la diplomacia es el mejor camino para dialogar con estos guerrilleros, pero la sombra y hábitos de Gerrera aún imperan entre sus seguidores. Y Aphra sufre la tiranía de C3PO, quien la envió en una misión para sustraer valiosos datos de las Guerras Clónicas. Ahora Aphra está por encarar un inesperado encuentro y una desagradable sorpresa.', '2014', 'Diciembre', 48, 39, 32, 'STARTWA41.PNG'),
(93, 6, 31, 3, 30, 'STAR WARS (2015) N.40', 40, 'Han y Leia emprendieron una misión en el planeta Odona en busca de una nueva base rebelde secreta. Ahora se encuentran perdidos y amenazados por las salvajes criaturas del planeta y la tormenta de nieve que se avecina, pero eso no es lo peor, pues Han está por encarar a un viejo conocido que quiere cobrar una deuda pendiente. Y Black Krrsantan revela la historia sangrienta que comparte con los hermanos Xonti en entrevista con periodistas del Undervine, una red de comunicación intergaláctica que burla la censura del Imperio. ¡No te pierdas la tercera entrega de Star Wars Anual y la primera de Doctora Aphra Anual en Star Wars 40!', '2014', 'Diciembre', 64, 39, 21, 'STARTWA40.PNG'),
(94, 6, 31, 3, 30, 'STAR WARS (2015) N.39 - Portada Variante Doctor Aphra N.13', 13, 'El sargento Kreel y su escuadrón de élite regresan tras su misión fallida a bordo del Harbinger. Darth Vader encomendó al stormtrooper localizar y destruir un puesto de avanzada Rebelde en el sistema Horox y entregar con vida a Luke Skywalker. El Escuadrón Scar tiene una sola oportunidad de redimirse ante los ojos de Vader, y el Sargento Kreel no dudará en llegar hasta las últimas consecuencias para lograrlo… Además, este número incluye el cómic breve \"La arena proveerá\" y el desenlace de \"Enormes ganancias\", de Doctora Aphra.', '2014', 'Diciembre', 56, 39, 32, 'STARTWA39.PNG'),
(95, 6, 31, 3, 30, 'STAR WARS (2015) N.38 - Portada Variante Doctor Aphra N.12', 38, 'Cuando ninguno de los Rebeldes quiso arriesgar la flota para rescatar a C3PO, R2-D2 se lanzó en una misión en solitario para recuperar al quisquilloso droide de protocolo. Pero mientras el pequeño astromech aterroriza todo un escuadrón imperial, el enemigo avanza en silencio. Y los droides psicópatas BT y 0-0-0 al fin se rebelan y exigen su libertad. ¡Aphra debe lidiar con este boicot, sobrevivir a Rur y escapar sin ser descubierta por Vader!', '2014', 'Diciembre', 48, 39, 29, 'STARTWA38.PNG'),
(96, 6, 32, 5, 32, 'BATMAN: EL PEZ SONRIENTE (1978)', 0, 'La Comics Code Authority, aquel organismo de autorregulación que las editoriales de tebeos norteamericanas adoptaron en 1954 como alternativa a la censura gubernamental, fue especialmente dura para el Joker. Así, el cruel asesino en serie que debutó en la década de los cuarenta fue dejando paso a un inofensivo bromista incapaz de herir a una mosca, todo por no provocar a la CCA. Además, la interpretación de Cesar Romero en la serie televisiva de los años sesenta tuvo un curioso efecto colateral: los lectores de cómics se llegaron a cansar de un personaje que, aparte de ubicuo, había dejado de suponer una amenaza seria para Batman y Robin. El Joker fue retirado de la circulación durante unos años, pero su regreso fue absolutamente triunfal: en Las cinco venganzas del Joker (1973), Dennis O\'Neill y Neal Adams recuperaron al psicópata homicida de los orígenes. El payaso volvía a dar miedo y a espolear tramas tan imaginativas como la de El pez sonriente, en la que el muy maníaco intenta ha', '1978', 'Mayo', 80, 250, 45, 'BATMANPEZ.PNG'),
(97, 6, 32, 5, 33, 'BATMAN: EL REGRESO DEL CABALLERO OSCURO (1986)', 0, 'A mediados de los ochenta, DC Comics quiso experimentar con un nuevo formato, la miniserie de prestigio, que acercase su personajes a otro tipo de lectores. Para ello, le encomendaron al prometedor Miller la escritura y el dibujo de cuatro números fuera de la continuidad, y él (inspirándose en las películas de Harry el Sucio, así como en algunas novelas de ciencia-ficción distópica) imaginó un futuro con Bruce Wayne retirado y el crimen volviendo a alcanzar cotas catastróficas. El resultado fue uno de los tebeos de superhéroes más relevantes de todos los tiempos, así como el patrón oro de la relación entre Batman y Superman (retratado aquí como un fervoroso reaganita) durante las décadas posteriores.', '1986', 'Agosto', 110, 300, 32, 'BATMANRETORNO.PNG'),
(98, 6, 32, 5, 34, 'BATMAN: AÑO UNO (1987)', 0, 'Tras viajar hacia uno de sus porvenires posibles, Miller regresó al punto de origen. Y, como sabía que la historia que quería contar necesitaba a un dibujante mucho más realista que él, reclutó a Mazzucchelli, autor tan sintético como expresivo. Año Uno se plantea los primeros días de actividad del Cruzado de la Capa como si de una película noir setentera se tratase, con su dosis de policías corruptos, mafiosos, ladronas y dilemas morales. Uno de sus muchos aciertos es partir la historia en dos mitades simétricas: no sólo narra la consolidación de Batman como vigilante nocturno, sino también el ascenso de Jim Gordon dentro del cuerpo de policía. Sólo a través de ese binomio podrá el alma de Gotham ser salvada.', '1987', 'Diciembre', 130, 350, 40, 'BATMANONE.PNG'),
(99, 6, 32, 5, 35, 'BATMAN: HIJO DEL DEMONIO (1987)', 0, 'Esta novela gráfica tiene el honor de ser, probablemente, la mejor historia de todas las protagonizadas por Ra\'s al Ghul, uno de esos villanos pulp cercanos al género fantástico que los creadores suelen olvidar en favor de gángsters con pinta estrafalaria. Pero Hijo del Demonio se zambulle sin cortapisas en los aspectos más aventureros y extraños de la Bat-mitología, tanto que DC y los fans decidieron considerar esta aventura como una excursión fuera del canon… hasta que Grant Morrison se hizo con la serie regular en la década de los dosmil. Pero no adelantemos acontecimentos.', '1987', 'Diciembre', 150, 380, 32, 'BATMANSON.PNG'),
(100, 6, 32, 5, 36, 'BATMAN: LA BROMA ASESINA (1988)', 0, 'Repudiada por su guionista y aún hoy controvertida para un amplio sector del fandom, esta impactante novela gráfica fue, es y será tan relevante que, aún así, no podíamos dejarla fuera de la lista. Moore se adentra en la psicología del Joker en un relato lleno de flashbacks no lineares, reflexiones acerca de la locura como única respuesta cuerda a un mundo amoral y un final donde los dos arquetipos supremos del Orden y el Caos en el tebeo superheroico acaban revelándose como dos caras de una misma moneda.', '1988', 'Diciembre', 190, 400, 50, 'BATMANJOKE.PNG'),
(101, 6, 32, 5, 37, 'BATMAN: LA SECTA (1988)', 0, 'El temible Deacon Blackfire no se parece a ningún otro bat-villano, al igual que La Secta tampoco se conforma con jugar según las reglas. Una de las historias más brutales y violentas de Batman, quien aquí llega a hacer lo impensable (por ejemplo, matar o manejar armas de fuego) a lo largo de un via crucis que pone a prueba como nunca su mente y su cuerpo.', '1988', 'Mayo', 140, 230, 31, 'BATMANSECTA.PNG'),
(102, 6, 32, 5, 38, 'BATMAN: UN LUGAR SOLITARIO PARA MORIR (1989)', 0, 'Tim Drake fue el tercer personaje que asumió la identidad de Robin, pero no lo tuvo fácil: esta miniserie de cinco ejemplares detalla exactamente por lo que el chico tuvo que atravesar hasta estar a la altura del legado de Dick Grayson y Jason Todd, por no hablar de las expectativas que su padre adoptivo puso sobre él…', '1989', 'Enero', 150, 250, 21, 'BATMANSOLITARIO.PNG'),
(103, 6, 32, 5, 39, 'BATMAN: ASILO ARKHAM (1989)', 0, 'A medio camino entre el surrealismo de Lewis Carroll y el estudio psicológico en clave lisérgica, la primera toma de contacto de Morrison con el personaje se apoya en los increíbles dibujos de McKean (no tiene sentido leer este cómic en digital) para llevarnos hasta lo más profundo de la insoslayable psicosis que siempre ha recorrido el universo de Batman.', '1989', 'Diciembre', 200, 500, 51, 'BATMANASILO.PNG'),
(104, 6, 32, 5, 40, 'BATMAN: GOTHAM A LUZ DE GAS (1989)', 0, 'El sello Elseworlds recoge narraciones ambientadas en universos paralelos. Esta, por ejemplo, se plantea como una revisión de Año Uno en una Gotham victoriana y pone a nuestro héroe sobre la pista de un tal Jack el Destripador… Su sentido del steampunk increíblemente divertido. Y lo de Mignola es de otro planeta.', '1989', 'Enero', 150, 250, 31, 'BATMANGAS.PNG'),
(105, 6, 32, 5, 41, 'BATMAN: EL LARGO HALLOWEEN (1996-1997)', 0, 'The Batman (2022) bebe bastante de esta épica criminal, si bien es cierto que la trilogía de Christopher Nolan ya había tomado antes unos cuantos apuntes prestados. Lo más memorable de este clásico quizá sea el idealista sistema anticorrupción que Gordon, Batman y Harvey Dent establecen antes de que la fatalidad obligue al tercero a sucumbir a su lado oscuro.', '1996', 'Agosto', 250, 500, 40, 'BATMANHALO.PNG'),
(106, 6, 33, 5, 42, 'JLA: TORRE DE BABEL (2000)', 0, 'La pregunta de qué pintaba un hombre sin superpoderes en la Liga de la Justifica obtuvo al fin respuesta: Batman no es un ser humano normal, sino un superdetective que lleva años elaborando una lista con los puntos débiles de sus compañeros, en caso de tener que neutralizarlos algún día.', '2000', 'Enero', 220, 500, 21, 'JLATORRE.PNG'),
(107, 6, 32, 5, 43, 'BATMAN: SILENCIO (2002-2003)', 0, 'El equipo de El largo Halloween volvió para contar otra de sus tramas expansivas y llenas de secundarios con carácter. De hecho, es posible que Silencio ostente el récord de bat-villanos por página.', '2002', 'Diciembre', 250, 450, 21, 'BATMANSILENCIO.PNG'),
(108, 6, 32, 5, 44, 'BATMAN R.I.P. (2008)', 0, 'Cuando le dieron las llaves de la serie regular, Morrison sabía exactamente lo que quería hacer con Batman: nada menos que una Teoría del Todo. En lugar de privilegiar una faceta o época del personaje sobre las demás, el guionista asumió que todas las historias que se venían publicando desde 1939 le sucedieron realmente a una persona llamada Bruce Wayne, y después estudió el impacto psicológico que algo así podría tener en una identidad tan resquebrajada como la suya. En R.I.P. incluso orquestó la muerte ritual del mito, tras enfrentarlo al tabú definitivo: la posibilidad de que su padre, trauma fundacional, siguiese con vida.', '2008', 'Enero', 250, 450, 32, 'BATMANRIP.PNG'),
(109, 6, 32, 5, 45, 'BATMAN: ¿QUÉ LE SUCEDIÓ AL CRUZADO DE LA CAPA? (2009)', 0, 'Dado que la etapa de Morrison culminaba con una aparente muerte del Caballero Oscuro, lo que venía a continuación sólo podía ser un funeral. Y quién mejor que Gaiman para encargarse de la ceremonia… Su cuento de hadas gótico está concebida como la última historia jamás contada de Batman, de todos los Batmans posibles: una narración fuera del tiempo que reflexiona sobre la leyenda a la vez que la celebra en toda su absurda gloria. ', '2009', 'Diciembre', 350, 600, 34, 'BATMANSUC.PNG'),
(110, 6, 32, 5, 46, 'BATMAN: EL TRIBUNAL DE LOS BÚHOS (2011-2012)', 0, 'La idea de una sociedad secreta que lleva manejando los hilos de Gotham desde el principio de los tiempos ya aparecía en Morrison, pero Snyder y Capullo decidieron retomarla con un giro sobrenatural que acerca este estupendo arco argumental al cine de terror de la pasada década. ', '2011', 'Agosto', 350, 600, 45, 'BATMANBUHO.PNG'),
(111, 6, 32, 5, 47, 'BATMAN: LA GUERRA DE BROMAS Y ACERTIJOS (2017)', 0, 'Puede que la etapa de King sea recordada por la no-boda entre Batman y Catwoman, pero donde realmente demostró de lo que era capaz fue en La guerra de bromas y acertijos, una suerte de Historia de dos ciudades que enfrentaba a dos de los villanos más populares del cómic y obligaba al superhéroe a mirar desde los márgenes, incapaz de prevenir las consecuencias más inmediatas de esta espiral de autodestrucción.', '2017', 'Agosto', 350, 600, 32, 'BATMANGUERRA.PNG'),
(112, 5, 34, 2, 48, 'NANA N.1', 1, 'Dos chicas que poseen un nombre “con suerte”, pero que trazan su destino por voluntad propia… Se llaman igual, sin embargo, sus emotivas historias de amor son diferentes. Por un lado, tenemos a la jovial y enamoradiza Nana Komatsu. Por el otro, tenemos a Nana Osaki una estrella en ascenso del punk, con un pasado gris. Aparentemente, lo único que tienen en común es su nombre… ¿qué les deparará el destino cuando se encuentren?', '2022', 'Mayo', 184, 129, 40, 'NANA1.PNG'),
(113, 5, 34, 2, 48, 'NANA N.2', 2, 'Nana Komatsu se muda a Tokio para estar cerca de su novio y sus amigos. En tanto, Nana Osaki también decide moverse a la gran ciudad luego de una desgarradora despedida con su novio. Cada una tiene sus propios pensamientos en la mente… y se encuentran por casualidad en el mismo tren. Dos personas con personalidades y entornos completamente diferentes se reencuentran más adelante, por destino o por casualidad, y terminan viviendo en el mismo departamento. A pesar de que una es completamente abierta y la otra esconde muchos secretos, se llevan mejor de lo esperado.', '2022', 'Junio', 192, 129, 32, 'NANA2.PNG'),
(114, 5, 34, 2, 48, 'NANA N.3', 3, 'Nana Komatsu está decidida a independizarse, así que consigue un empleo en una tienda… pero esta cierra al poco tiempo. Pronto, Nana empieza a trabajar en una editorial y se encarga de tareas pequeñas, pero hace su mejor esfuerzo. Mientras tanto, a Nana Osaki se le encienden las ganas de regresar a cantar gracias a sus compañeros de su anterior banda, Yasu y Nobu, y de Shin, el nuevo integrante. Al mismo tiempo, Shoji inicia una relación con Sachiko, su compañera del trabajo y la universidad. Shoji parece confundido, pero finalmente decide contarle a Nana lo que sucede.', '2022', 'Julio', 184, 129, 43, 'NANA3.PNG'),
(115, 5, 34, 2, 48, 'NANA N.4', 4, 'Nana queda profundamente herida cuando Shoji presenta a Sachiko como su novia y se entera de su relación. Mientras tanto, Nana celebra su primer concierto en Tokio con los nuevos miembros de Blast y la aparición de la mayor admiradora del grupo termina por quebrar la voluntad de Hachi (Nana) al sentirse desplazada por todos. Ya repuesta, viaja a su ciudad natal junto con Nana para asistir al concierto de Trapnest… y las lágrimas de Nana ruedan cuando vuelve a ver a Ren.', '2022', 'Agosto', 192, 129, 32, 'NANA4.PNG'),
(116, 5, 34, 2, 48, 'NANA N.5', 5, 'Tokio, la gran metrópolis. Dos chicas llegan a la ciudad dispuestas a cumplir sus sueños, aunque aparentemente son totalmente opuestas: Nana Komatsu es dulce, ingenua, enamoradiza, y arrastra un largo historial de amores malogrados. Nana Oosaki es madura y segura de sí misma, sabe lo que quiere y qué debe hacer para conseguirlo. Los caminos de estas chicas tan distintas se cruzarán en la capital, donde empezarán compartiendo piso y acabarán\napoyándose la una en la otra. . . ¡¡Dos chicas con el mismo nombre!! ¡¡Dos emocionantes historias de amor!!', '2022', 'Septiembre', 192, 129, 32, 'NANA5.PNG'),
(117, 5, 34, 2, 48, 'NANA N.6', 6, 'Empieza la interacción entre Trapnest y Blast, pero las emociones de todos comenzaron a perturbarse por la relación de Nana con su anhelado Takumi. Las emociones de los demás comienzan a perturbarse por su relación. Nobu piensa que Takumi está manipulando a Nana, además, le declara su amor, con lo que revuelve las emociones de la chica. Por su parte, Shin y Reira… Y por fin llega el día del concierto que llevará a Blast a su debut profesional, ¡¿qué ocurrirá con este concierto rodeado de tantos pensamientos?!', '2022', 'Octubre', 192, 129, 32, 'NANA6.PNG'),
(118, 5, 34, 2, 48, 'NANA N.7', 7, 'El concierto de Blast resulta un rotundo éxito, así que Yasu, cauteloso al inicio y por presión de Nana, firma un contrato provisional con una gran disquera, así que Blast se acerca hacia su gran debut. Nana sale con Takumi, de Trapnest, pero el egoísmo de este provoca que Nana se decante por Nobu y, correspondiendo a sus sentimientos, decide quedarse con él. Nana se encuentra extrañamente complacida por la relación, pero…', '2022', 'Diciembre', 200, 150, 32, 'NANA7.PNG'),
(119, 2, 35, 2, 49, 'NARUTO BOXSET', 0, 'Un aprendiz de ninja de la Aldea Oculta de Konoha es un chico travieso que desea llegar a ser el Hokage de la aldea para demostrar a todos lo que vale.', '2014', 'Diciembre', 0, 1600, 30, 'NARUTOBOX.PNG'),
(120, 5, 35, 2, 49, 'NARUTO N.2', 2, 'Naruto, Sasuke y Sakura, los tres aprendices de ninja (genin) sobrevivieron el arduo examen de Kakashi sensei. Ahora, los espera su primera misión: proteger al constructor de puentes Tazuna. Lo que no saben es que una sombra se acerca sigilosamente.', '2021', 'Julio', 208, 99, 21, 'NARUTO2.PNG'),
(121, 5, 35, 2, 49, 'NARUTO N.1', 1, '¡EL INICIO DE ESTA INCREÍBLE SAGA!La historia comienza en un discreto pueblo llamado Konoha. Ahí encontramos a un niño llamado Naruto, quien estudia en la Escuela Ninja y se divierte haciendo travesuras a sus comañeros. ¿Será posible que Naruto cumpla su gran sueño de convertirse en el sucesor hokage y supere la leyenda de sus antepasados? Aunque, en realidad, los orígenes de este singular personaje siguen siendo un misterio.', '2020', 'Enero', 192, 99, 28, 'NARUTO1.PNG'),
(122, 5, 35, 2, 49, 'NARUTO N.3', 3, 'El “demonio Zabuza”, quien perdió la batalla contra el sharingan de Kakashi, ¡volvió a la vida! Y, al llegar al Reino de las Olas escoltado por Tazuna, Naruto y sus amigos fueron presa de la preocupación al enterarse de esto. ¡Pero no es el momento de ponerse a temblar! Para prepararse, los jóvenes genin deberán iniciar uno de los entrenamientos más arduos de su vida. Claro, ¡bajo la tutela de Kakashi sensei!', '2022', 'Marzo', 208, 99, 32, 'NARUTO3.PNG'),
(123, 5, 35, 2, 49, 'NARUTO N.4', 4, 'Con Sasuke caído, el zorro de nueve colas ha resurgido en Naruto, y ahora no solo Haku corre peligro, sino todos los que están en el puente. Además, Kakashi le demostrará a Zabuza cómo pelea sin usar el sharingan, y veremos el plan malévolo que Gato tuvo desde el comienzo. No te pierdas el gran final del arco “El puente de la valentía” en este Naruto #4.', '2022', 'Febrero', 184, 99, 22, 'NARUTO4.PNG'),
(124, 5, 35, 2, 49, 'NARUTO N.5', 5, 'Luego de vencer a Zabuza y a Gato, Naruto y los demás volvieron a Konoha. Ahí, Kakashi los propuso como candidatos para presentar los exámenes de selección chunin, famosos por su dificultad. Aunque todo el equipo decidió participar, podrían tener complicaciones para inscribirse, ahora que Rock Lee, un misterioso shinobi que también presentará la prueba, ha retado a Sazuke a un duelo. ¡No te pierdas esta aventura!', '2022', 'Marzo', 184, 99, 32, 'NARUTO5.PNG'),
(125, 5, 35, 2, 49, 'NARUTO N.6', 6, 'Naruto, Sasuke y Sakura pasaron la estresante primera parte del examen de selección chunin: la prueba escrita, donde más que saber, debían recabar información de sus compañeros como verdaderos shinobi. Ahora ha empezado la segunda parte del examen: la prueba de supervivencia, la cual será realmente difícil, sobre todo cuando un misterioso ninja con poderes de serpiente se les interponga. Encuentra Naruto #6 en los puntos de venta de Panini Manga. ¿O vas a dejar que te lo ganen?', '2022', 'Diciembre', 184, 99, 43, 'NARUTO6.PNG'),
(126, 5, 36, 2, 50, 'CHAINSAW MAN N.1', 1, 'Denji es un chico huérfano y pobre que trabaja como devil hunter junto con Pochita, el demonio perruno de la motosierra, para unos yakuza. Estos también desean el poder de los demonios y atacan a Denji y a Pochita, pero, al borde de la muerte, los dos se unen para formar a Chainsaw Man y logran salvarse. Makima, una devil hunter de Seguridad Pública, llega a la escena y recluta a Denji para que trabaje para ella y la promesa de una vida mejor trabajando al lado de la bella joven lo motiva.', '2020', 'Diciembre', 192, 129, 30, 'CSM1.PNG'),
(127, 5, 36, 2, 50, 'CHAINSAW MAN N.2', 2, 'Denji se enfrenta con el demonio de los murciélagos, causando muchos daños en la ciudad. Hayakawa sospecha que Power tuvo que ver en el asunto, pero Denji la defiende. Ella le da la recompensa que buscaba, pero no queda muy convencido. Luego, Makima le da la misión a Denji de acabar con un demonio muy poderoso. El escuadrón de Himeno se une al de Hayakawa yendo tras la pista de ese demonio en un hotel, pero quedan atrapados sin salida.', '2020', 'Diciembre', 192, 129, 21, 'CSM2.PNG'),
(128, 5, 36, 2, 50, 'CHAINSAW MAN N.3', 3, 'El escuadrón de Himeno sigue atrapado en el octavo piso del hotel por el demonio de la eternidad, quien exige la vida de Denji para dejarlos salir. Unos están a favor, pero Denji pone en marcha un plan temerario para salvarlos a todos. Luego los devil hunters se dan un respiro para salir a tomar. ¿Qué será del primer beso de Denji? Y, al final, aparecen unas maleantes que atacan a los devil hunters ¿¡por órdenes del demonio de las armas de fuego!?', '2020', 'Diciembre', 192, 129, 12, 'CSM3.PNG'),
(129, 5, 36, 2, 50, 'CHAINSAW MAN N.4', 4, 'Un grupo armado bajo órdenes del demonio de las armas de fuego ataca a los devil hunters. Makima y Kobeni los detienen lo suficiente para que Denji escape. Para hacerlos más fuertes y prepararlos para la siguiente batalla, Makima consigue que el mejor devil hunter entrene a Denji y a Power. Por otro lado, unas visitas en el hospital hacen que Aki decida permanecer en Seguridad Pública y continuar persiguiendo su máximo objetivo, lo que implica ir tras sus atacantes.', '2020', 'Diciembre', 192, 129, 10, 'CSM4.PNG'),
(130, 5, 36, 2, 50, 'CHAINSAW MAN N.5', 5, 'Continúa la redada para aprehender a la banda de Samurai Sword. Al final, Denji tiene un enfrentamiento con él dentro de un vagón de tren, donde las cosas se tornan un tanto sucias. Después de tanta conmoción, Makima invita a Denji al cine, y él no cabe de felicidad. Pero, al siguiente día, una chica llamada Reze se aparece ante Denji, y empieza a mostrar interés por él. ¿Denji será capaz de resistirse y seguir siéndole fiel a Makima en su corazón?', '2020', 'Diciembre', 192, 129, 12, 'CSM5.PNG'),
(131, 5, 36, 2, 50, 'CHAINSAW MAN N.6', 6, 'En el festival de fuegos artificiales, Reze le pide a Denji que escapen juntos de SP para que él ya pueda ir a la escuela. Pero él se rehúsa porque ya le va mejor en el trabajo. Ella sospecha que Denji quiere a alguien más, y esto desata una persecución por toda la ciudad llena de adrenalina y descargas de explosiones. ¡¡Incluso un tornado de tiburones hace su aparición!!', '2020', 'Diciembre', 192, 129, 32, 'CSM6.PNG'),
(132, 5, 36, 2, 50, 'CHAINSAW MAN N.7', 7, 'Después de los estragos causados por Bomb en la ciudad, los medios hacen pública la existencia del demonio de las motosierras. Eso hace que asesinos de todas partes del mundo lleguen a Japón tras Denji justo cuando él estaba listo para salir de vacaciones con Makima y los demás. SP monta una operación para protegerlo, pero ¿por qué Denji es tan importante?', '2020', 'Diciembre', 192, 129, 12, 'CSM7.PNG'),
(133, 5, 36, 2, 50, 'CHAINSAW MAN N.8', 8, 'Quanxi y sus poseídas lanzan su ataque contra el grupo de Denji, quienes apenas son capaces de defenderse. Por otro lado, Santa Claus establece un contrato con el demonio del infierno, y envía a todos al averno. Al ver a las poseídas temblando de miedo, Quanxi propone una tregua, y de repente se aparece ante ellos uno de los demonios primigenios...', '2020', 'Diciembre', 192, 129, 34, 'CSM8.PNG'),
(134, 5, 36, 2, 50, 'CHAINSAW MAN N.9', 9, 'De regreso después de la batalla en el infierno, Power tiene un gran trauma y fobia a la oscuridad. Denji prefiere quedarse en casa a cuidarla en vez de salir de viaje con Makima. Por otro lado, Aki se reúne con Kishibe y le pide que no mande a Denji y a Power a la próxima operación contra el demonio de las armas porque no los quiere perder. Pero algo sale terriblemente mal.', '2020', 'Diciembre', 192, 129, 43, 'CSM9.PNG'),
(135, 5, 36, 2, 50, 'CHAINSAW MAN N.10', 10, 'Makima acude en su ayuda, pero lo que parece por fin un momento de calma se convierte en el comienzo de una pesadilla… Cuando el joven abre la puerta prohibida de su alma, ¡las verdaderas intenciones de Makima y el secreto demoníaco de Denji chocan en un sangriento infierno!', '2020', 'Diciembre', 192, 129, 11, 'CSM10.PNG'),
(136, 5, 36, 2, 50, 'CHAINSAW MAN N.11', 11, '¡El control de la cruel y despiadada Makima tiene a Denji contra las cuerdas! Ella le ha robado todo lo que quería en la vida y todo lo que era importante para él, y ahora dentro de su corazón solo hay bazofia. ¡En ese momento, las voces que vitorean a Chainsaw Man en todo el país lo animan a levantarse de nuevo! Y eso lo lleva a batirse en un duelo sangriento contra Makima en unas tierras baldías.  ¡¡Y llegamos a la impactante conclusión de esta história!!', '2020', 'Diciembre', 192, 129, 12, 'CSM11.PNG'),
(137, 5, 37, 2, 27, 'ONE PIECE N.1', 1, 'Esta es la gran Era Pirata. Gold Roger, el legendario “Rey de los piratas” ha dejado el “One Piece” - su legendario Tesoro - escondido en una zona del mundo llamada “GRAND LINE” y los piratas más fuertes compiten por hallarlo.\nUn niño llamado Luffy idolatraba a los piratas, en especial a Shanks, el líder de una tripulación que visitó su villa. Un día, por accidente, Luffy comió una “fruta del diablo” del botín de Shanks.', '2020', 'Enero', 208, 99, 20, 'OP1.PNG'),
(138, 5, 37, 2, 27, 'ONE PIECE N.2', 2, 'Buggy “El payaso” (el villano favorito de Eiichiro Oda) y su tripulación creen que Luffy, Nami y Zoro pertenecen a una misma banda de ladrones que robó el mapa de la “Grand Line” y están decididos a hacerlos pagar por la ofensa. Luffy está decidido a hacer que Nami se una como su navegante pero antes de volver al mar deben enfrentarse a Moji, el vicecapitán y a Cabaji, el segundo oficial, los cuales demostrarán ser rivales con muchos trucos bajo la manga.', '2020', 'Enero', 208, 99, 32, 'OP2.PNG'),
(139, 5, 37, 2, 27, 'ONE PIECE N.3', 3, 'El capitán Buggy “El payaso” y Luffy, tienen una espectacular pelea como solo podría suceder con dos poseedores de las habilidades de las frutas del diablo. Durante la pelea aprendemos más del pasado en común de Shanks y Buggy. Ahora que Nami y Zoro se han unido a la tripulación de Luffy es momento de continuar su camino hacia la “Grand Line”. Han desembarcado en una villa para buscar un barco más resistente y algo de comida. Ahí se encuentran con el orgulloso pero mentiroso Usopp y es gracias a él que conocen a Kaya, la persona más rica de la villa, a quien le piden un barco. Sin embargo, el mayordomo Kurahadol se entromete y Luffy tiene que renunciar trágicamente a su petición.', '2020', 'Enero', 208, 99, 23, 'OP3.PNG'),
(140, 5, 37, 2, 27, 'ONE PIECE N.4', 4, 'Luffy por fin se enfrenta cara a cara con Kurahadol, ¡con el cruel mayordomo que resultó ser el capitán pirata Kuro! En la pendiente que lleva a la villa se ha desatado una batalla encarnizada que ha alcanzado su límite, ¡Ha llegado el momento de la verdad! Para salvar sus vidas, Kaya y los niños se internaron en el bosque pero no saben de la amenaza los sigue de cerca. ¡Usopp y Zoro deben apresurarse si quieren rescatarlos!', '2020', 'Enero', 208, 99, 21, 'OP4.PNG'),
(141, 5, 37, 2, 27, 'ONE PIECE N.5', 5, 'Luffy por fin se enfrenta cara a cara con Kurahadol, ¡con el cruel mayordomo que resultó ser el capitán pirata Kuro! En la pendiente que lleva a la villa se ha desatado una batalla encarnizada que ha alcanzado su límite, ¡Ha llegado el momento de la verdad! Para salvar sus vidas, Kaya y los niños se internaron en el bosque pero no saben de la amenaza los sigue de cerca. ¡Usopp y Zoro deben apresurarse si quieren rescatarlos!', '2020', 'Enero', 208, 99, 32, 'OP5.PNG'),
(142, 5, 37, 2, 27, 'ONE PIECE N.6', 6, 'Luffy y su tripulación hacen escala en el restaurante marítimo Baratie con la intención de encontrar a un cocinero. Mientras que Don Krieg (el almirante de una flota pirata de 50 embarcaciones) lleva a cabo su plan para secuestrar barcos; cierto personaje muy poderoso y lleno de misterio hace su aparición frente a la tripulación de Luffy…', '2020', 'Enero', 208, 99, 43, 'OP6.PNG'),
(143, 5, 37, 2, 27, 'ONE PIECE N.7', 7, 'La flota de Don Krieg le exige enérgicamente al capitán Zeff que libere a los rehenes. En un acto despreciable, Luffy se vuelve loco y ataca a los enemigos, pero por alguna razón, Sanji no contraataca. ¡Detrás de ese extraño comportamiento, se esconde el misterioso pasado de Zeff! La batalla en el restaurante marítimo Baratie va subiendo de intensidad, hasta que Don Krieg decide usar su arma definitiva. ¡Continua esta romántica aventura marina en busca del “One Piece”!', '2020', 'Enero', 208, 99, 43, 'OP7.PNG'),
(144, 5, 37, 2, 27, 'ONE PIECE N.8', 8, 'Luffy, con gran decisión, se enfrenta a Krieg. ¡Por fin llega a su final la impresionante batalla en el restaurante marítimo! La lucha es difícil porque ambos rivales son muy poderosos y decididos, en un momento determinado, Luffy toma la decisión de luchar sin temer a la muerte. Sanji recibe ayuda de Zeff y su tripulación para tomar una decisión que cambiará el rumbo de su vida. ¡Ya es hora de que Sanji vuelva a viajar por el mundo!', '2020', 'Enero', 208, 99, 12, 'OP8.PNG'),
(145, 5, 37, 2, 27, 'ONE PIECE N.9', 9, 'Arlong Park es una ciudad controlada por hombres pez que imponen su ley a todos los humanos. En esta ciudad a la que llegaron durante la persecución de Nami, Luffy y sus amigos se enfrentan a una verdadera sorpresa. ¿¡Los sentimientos de compañerismo conquistarán a Nami, quien lucha una solitaria batalla!? ¡Continúa la romántica aventura marina en busca del “One Piece”!', '2020', 'Enero', 208, 99, 43, 'OP9.PNG'),
(146, 5, 37, 2, 27, 'ONE PIECE N.10', 10, 'Tras escuchar el grito en el que Nami expresó sus sentimientos, ¡Luffy y sus amigos por fin se enfrentan a Arlong! ¡Pero cuando Luffy es lanzado al mar quedan en una crisis terrible! Entonces sus amigos, cada uno con sus propios sentimientos, se lanzan a un combate decisivo para salvar a Luffy. ¡Continúa la romántica aventura en busca del “One Piece”!', '2020', 'Enero', 208, 99, 12, 'OP10.PNG'),
(147, 5, 1, 2, 1, 'BERSERK N.1', 1, 'Un hombre completamente vestido de negro que se hace llamar Guts, que tiene una mano artificial de hierro duro y que carga una espada gigantesca que supera su estatura. En el lugar al cual se dirige llueve sangre y hay montañas de cadáveres apilados. Puck, un elfo que se mantiene a su lado desde que Guts le salvó la vida, quedó impresionado por su increíble fuerza, aunque a la vez le causa temor lo violento que es el mundo en el que él vive. Una horda de espíritus malignos que obstaculizan su camino. ¿acaso la marca que tiene en el cuello lo incita a buscar la venganza...?No te pierdas el primer tomo de esta increíble saga.', '2020', 'Enero', 232, 99, 21, 'BERK1.PNG'),
(148, 5, 1, 2, 1, 'BERSERK N.2', 2, 'El malvado Conde usa sus poderes oscuros para transformar a un capitán de guardia derrotado en un horror inhumano para combatir a Guts, el Espadachín Negro. Puck, el coqueto hada del tamaño de Guts, es capturado cuando intenta detener la ejecución de un viejo médico, y se le da como un regalo a la hija del conde, una niña dulce en una jaula dorada, encarcelada por su padre en su propia habitación . Guts, decidido a hacer carne picada del conde, asalta el castillo y esculpe una franja de destrucción empapada de sangre a través de los secuaces del conde. Cara a cara con el Espadachín Negro por fin, el Conde revela su verdadera forma e incluso la espada de gran tamaño de Guts puede no ser lo suficientemente grande como para contender con esta monstruosidad demoníaca.', '2020', 'Enero', 232, 99, 21, 'BERK2.PNG'),
(149, 5, 1, 2, 1, 'BERSERK N.3', 3, 'Un hombre completamente vestido de negro que se hace llamar Guts, que tiene una mano artificial de hierro duro y que carga una espada gigantesca que supera su estatura, continúa su viaje con Puck, el elfo que se unió a él sin su permiso. En una ciudad dominada por el miedo, sin planearlo, Guts se vende al mal y, durante una batalla contra el conde convertido en monstruo, que estaba masacrando a su propio pueblo, finalmente encuentra a los cinco miembros de \"La Mano de Dios\", a quienes tanto había estado buscando.¿Por qué los está buscando? ¡Para descubrir ese secreto, la historia da un giro y vuelve al momento de su nacimiento...!', '2020', 'Enero', 232, 99, 21, 'BERK3.PNG'),
(150, 5, 1, 2, 1, 'BERSERK N.4', 4, 'Luego de ser encontrado llorando bajo el cadáver de su madre, Guts es criado con crueldad por el mercenario Gambino, quien a base de mucho abuso, lo educa para ser un guerrero. Gracias a él, Guts aprende poderosas técnicas de espada y hace un debut espectacular en su primera batalla. Sin embargo, no sabe por qué Gambino lo trata con tanta frialdad. Una noche, el compañero de batalla de Gambino, Donovan, decide atacar a Guts. ¡¿Por qué...?! ¡Es la historia de la juventud llena de guerra y emociones de Guts, el guerrero más fuerte!', '2020', 'Enero', 232, 99, 21, 'BERK4.PNG'),
(151, 5, 1, 2, 1, 'BERSERK N.5', 5, 'Se ha puesto en acción un plan para cerrar el hoyo que hay en la muralla Rosé: que Eren, convertido en titán, mueva una roca enorme para taparlo. Con la vida de la humanidad en los hombros, el titán Eren pierde entonces la noción de si mismo y comienza a enloquecer. Ni siquiera responde a las preguntas desesperadas de Armin...', '2020', 'Enero', 232, 99, 21, 'BERK5.PNG'),
(152, 5, 1, 2, 1, 'BERSERK N.6', 6, 'Finalmente, Guts se ha ganado su lugar en la Banda del Halcón. La pelea contra Zodd casi le cuesta la vida a Griffith, quien expresa su agradecimiento a Guts después de su increíble actuación en el combate. Mientras tanto, la Banda del Halcón cada vez gana más reconocimiento en Midland por sus hazañas en el campo de batalla, pero esto causará gran molestia entre algunos miembros de la nobleza, quienes consideran que los integrantes de esta tropa no son más que vulgares mercenarios, y harán lo que sea necesario con tal de eliminarlos.', '2020', 'Enero', 232, 99, 21, 'BERK6.PNG'),
(153, 5, 1, 2, 1, 'BERSERK N.7', 7, 'Después de caer por el acantilado, Kasca le cuenta a Guts su pasado, cómo conoció a Griffith y por qué es tan importante. Tras arriesgar la vida por ella, ¿finalmente Kasca aceptará a Guts como un miembro más de la Banda del Halcón? Además, Griffith y su grupo de mercenarios se preparan para conseguir lo que ningún ejército de Midland ha logrado: tomar el castillo de Doldrey. ¡Comienza la batalla! ¡Descubre el destino de Guts, el guerrero más fuerte, en Berserk 7!', '2020', 'Enero', 232, 99, 21, 'BERK7.PNG'),
(154, 5, 1, 2, 1, 'BERSERK N.8', 8, 'Comienza la batalla final entre Midland y Chuder por la supremacía, y la Banda del Halcón, el grupo de mercenarios más fuerte, se muestra más poderoso que nunca antes. Los 5 mil caballeros de la Banda del Halcón atacaron la impenetrable fortaleza de Doldrey, y llevaron a los protectores del castillo, los Caballeros del Rinoceronte Púrpura, a un lugar lejos de este. Mientras tanto, según el plan de Griffith, la tropa de Kasca está por infiltrarse en el castillo. Comienza una batalla contra el tiempo.', '2020', 'Enero', 232, 99, 21, 'BERK8.PNG'),
(155, 5, 1, 2, 1, 'BERSERK N.9', 9, 'Tras años de formar parte del grupo y vivir en camaradería, Guts finalmente decide abandonar la Banda del Halcón para encontrarse a sí mismo. Sin embargo, Griffith no lo dejará ir tan fácilmente y sólo le permitirá irse al derrotarlo en un duelo. Ahora el destino de la Banda del Halcón depende de Griffith, quien queda devastado tras la partida de Guts. ¿Podrá sobreponerse ante esta pérdida? ¿Qué encontrará Guts en esta etapa en solitario?', '2020', 'Enero', 232, 99, 21, 'BERK9.PNG'),
(156, 5, 1, 2, 1, 'BERSERK N.13', 13, '¡Apareció otra dimensión y, con ella, todo el pasado perdió sentido! El behelit que volvió a las manos de Griffith vibra con el grito de su corazón y, derramando lágrimas de sangre, lo arrastró a otra dimensión junto con sus compañeros. Los cuatro grotescos dioses, \"La mano de Dios\", han llegado. Ellos predijeron que Griffith se volvería su aliado y decretaron que la Banda del Halcón sería sacrificada. Presionaron a Griffith, le preguntaron si sería capaz de abandonar su sueño y le ordenaron cumplir sus ambiciones y entregar a toda la Banda del Halcón.¡Griffith toma una decisión y da inicio un festín de demonios!', '2020', 'Enero', 232, 99, 21, 'BERK13.PNG'),
(157, 5, 1, 2, 1, 'BERSERK N.14', 14, 'En una dimensión abierta por el behelit, Griffith, quien ya no tenía ninguna esperanza, ofreció al mal la vida de todos los miembros de la Banda del Halcón como sacrificio para hacer su sueño realidad. Casi todos se volvieron una ofrenda para los demonios. Griffith, quien revivió gracias a \"La Mano de Dios\", violó a Kasca; Guts perdió un ojo y un brazo y quedó al borde de la muerte, pero en ese momento el Caballero del Cráneo irrumpió en aquella dimensión y se llevó a Guts y a Kasca. Luego Guts juró vengarse y destrozó a todos los muertos que llegaron buscando su marca del mal. ¡Pero ahora parece que empiezan a ir tras la marca de Kasca!', '2020', 'Enero', 232, 99, 21, 'BERK14.PNG'),
(158, 5, 6, 2, 6, 'OYASUMI PUNPUN N.1', 1, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN1.PNG'),
(159, 5, 6, 2, 6, 'OYASUMI PUNPUN N.2', 2, 'Punpun mira el mundo con los ojos de un pollito, porque tal vez así puede soportar que su amado padre sea un alcohólico violento; su madre, una víctima golpeada; y el amor de su vida, una compañera de clase que se marcha lejos. Por eso Punpun se contenta con sus amigos, invoca a su “querido Dios, querido Dios” y se lanza a aventuras hasta ahora desconocidas, como experimentar algo que los adultos llaman “amor”, por su nueva compañera, Aiko Tanaka. Despierta a la vida con Oyasumi Punpun, el nuevo manga que Panini trae para ti.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN2.PNG'),
(160, 5, 6, 2, 6, 'OYASUMI PUNPUN N.4', 4, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN4.PNG'),
(161, 5, 6, 2, 6, 'OYASUMI PUNPUN N.5', 5, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN5.PNG'),
(162, 5, 6, 2, 6, 'OYASUMI PUNPUN N.8', 8, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN8.PNG'),
(163, 5, 6, 2, 6, 'OYASUMI PUNPUN N.9', 9, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN9.PNG'),
(164, 5, 6, 2, 6, 'OYASUMI PUNPUN N.10', 10, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN10.PNG'),
(165, 5, 6, 2, 6, 'OYASUMI PUNPUN N.11', 11, 'Es un manga japonés escrito e ilustrado por Inio Asano. La historia sigue a Onodera Punpun, un niño normal que debe hacer frente a sus amigos y familia disfuncional, su interés amoroso, su adolescencia en sentido contrario y su mente hiperactiva.', '2022', 'Julio', 224, 129, 20, 'OPUNPUN11.PNG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombreuser` varchar(300) NOT NULL,
  `apellidosuser` varchar(400) NOT NULL,
  `correouser` varchar(350) NOT NULL,
  `password` varchar(300) NOT NULL,
  `estadocuenta` int(11) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `calle` varchar(400) DEFAULT NULL,
  `colonia` varchar(300) DEFAULT NULL,
  `estado` varchar(250) DEFAULT NULL,
  `municipio` varchar(200) DEFAULT NULL,
  `ciudad` varchar(300) DEFAULT NULL,
  `numint` varchar(15) DEFAULT NULL,
  `numext` varchar(15) DEFAULT NULL,
  `referencia` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombreuser`, `apellidosuser`, `correouser`, `password`, `estadocuenta`, `telefono`, `cp`, `calle`, `colonia`, `estado`, `municipio`, `ciudad`, `numint`, `numext`, `referencia`) VALUES
(1, 'Omar Jair', 'Morales Vazquez', 'ksio1026@gmail.com', '0987654321', 1, '5540856123', '56800', 'Primer callejon de la rosa', 'Sector Sacromonte', 'Mexico', 'Amecameca', 'Sin ciudad', 'S/N', 'S/N', 'Puerta de color negro a lado de un puesto de dulces'),
(2, 'Abril Ashlin', 'Morales Vazquez', 'ashlin1026@gmail.com', '1234567890', 1, '5540856124', '56800', 'Morelos', 'Sector sacromento', 'México', 'Amecameca', 'México', '12A', '14', 'NINGUNA'),
(3, 'Jonathan Jair', 'Barrera Juarez', 'jona1026@gmail.com', '1234567890', 0, '5540856125', '56800', 'Madero', 'Sector sacromento', 'México', 'Amecameca', 'México', '19B', '1', 'NINGUNA'),
(4, 'Erandy Denis', 'Reyes Ramirez', 'denis1026@gmail.com', '1234567890', 1, '5540856126', '56800', 'Independiencia', 'Sector sacromento', 'México', 'Amecameca', 'México', '23Z', '5', 'NINGUNA'),
(5, 'Rafael', 'Sanchez Martinez', 'rafa1026@gmail.com', '1234567890', 1, '5540856127', '56800', 'Rio los reyes', 'Sector sacromento', 'México', 'Amecameca', 'México', 'S/N', '16', 'NINGUNA'),
(6, 'Adriana', 'Gonzales Reyes', 'adri1026@gmail.com', '1234567890', 1, '5540856128', '56800', 'La paz', 'Sector sacromento', 'México', 'Amecameca', 'México', '15C', '76', 'NINGUNA'),
(7, 'Ana Lilit', 'de la Rosa Rodez', 'ana1026@gmail.com', '1234567890', 1, '5540856129', '56800', 'Cruz Verde', 'Sector sacromento', 'México', 'Amecameca', 'México', '19D', '86', 'NINGUNA'),
(8, 'Edxon', 'Trujillo Gomez', 'ed1026@gmail.com', '1234567890', 1, '5540856130', '56800', 'Bravo', 'Sector sacromento', 'México', 'Amecameca', 'México', 'S/N', '45', 'NINGUNA'),
(9, 'Diana', 'Gomez Gomez', 'diana1026@gmail.com', '1234567890', 0, '5540856131', '', '', '', '', '', '', '', '', ''),
(10, 'Paola', 'Vega Guzman', 'paola1026@gmail.com', '1234567890', 0, '5540856132', '56800', 'Segundo callejon de la rosa', 'Sector sacromento', 'México', 'Amecameca', 'México', '30S', '55', 'NINGUNA'),
(11, 'Montse', 'Calixto Quezada', 'montse1026@gmail.com', '1234567890', 0, '5540856133', '56800', 'Morelos', 'Sector sacromento', 'México', 'Amecameca', 'México', 'S/N', '77', 'NINGUNA'),
(12, 'Jorge', 'Galindo Valdez', 'jorge1026@gmail.com', '1234567890', 1, '5540856134', '56800', 'Madero', 'Sector sacromento', 'México', 'Amecameca', 'México', '21G', '5', 'NINGUNA'),
(13, 'Ivan', 'Rodriguez Rodriguez', 'ivan1026@gmail.com', '1234567890', 1, '5540856135', '56800', 'Independiencia', 'Sector sacromento', 'México', 'Amecameca', 'México', '43', '33', 'NINGUNA'),
(14, 'Vladimir', 'Perez Perez', 'vladimir1026@gmail.com', '1234567890', 1, '5540856136', '56800', 'Rio los reyes', 'Sector sacromento', 'México', 'Amecameca', 'México', 'S/N', '223', 'NINGUNA'),
(15, 'Fernando', 'Constantino Lutres', 'ferfer1026@gmail.com', '1234567890', 0, '5540856137', '56800', 'La paz', 'Sector sacromento', 'México', 'Amecameca', 'México', 'S/N', '44', 'NINGUNA'),
(16, 'Angeles Perla', 'Vazquez Castro', 'anngi1026@gmail.com', '1234567890', 1, '5540856138', '56800', 'Cruz Verde', 'Sector sacromento', 'México', 'Amecameca', 'México', '43G', '33', 'NINGUNA'),
(17, 'Edgar', 'Morales Vega', 'edhi1026@gmail.com', '1234567890', 1, '5540856139', '', '', '', '', '', '', '', '', ''),
(18, 'Jazmin', 'Morales Vega', 'jaz1026@gmail.com', '1234567890', 1, '5540856140', '56800', 'Cuahutemoc', 'Sector sacromento', 'México', 'Amecameca', 'México', 'S/N', '54', 'NINGUNA'),
(19, 'Alan', 'Rodriguez Ortiz', 'alan1026@gmail.com', '1234567890', 1, '5540856141', '56800', 'Cruz Verde', 'Sector sacromento', 'México', 'Amecameca', 'México', '67B', '75', 'NINGUNA'),
(20, 'Leobardo', 'Ortiz Ortiz', 'leobardo1026@gmail.com', '1234567890', 0, '5540856142', '56800', 'Bravo', 'Sector sacromento', 'México', 'Amecameca', 'México', 'S/N', '87', 'NINGUNA'),
(27, 'Omar', 'Morales', 'ksionull@gmail.com', '123456789', 1, '5540856123', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(29, 'Ksio', 'Morales', 'ksiomora@gmail.com', '123456789', 1, '5567896512', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(31, 'Omar', 'Morales', 'ksionul1@gmail.com', '1234567890', 1, '5540856123', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL),
(32, 'Jair Omar', 'Vazquez', 'jairg2@gmail.com', '0987654321', 1, '5546786511', '56800', 'Soledad', 'Atenco', 'México', 'Ayapango', 'Ninguna', 'S/N', '12', 'Puerta color blanco aun lado de una lona'),
(33, 'Omar Jair', 'Morales Vazquez', 'rafa2@gmail.com', 'rafles0114', 1, '5540856123', '56970', 'av juarez', 'SANTIAGO', 'Mexico', 'Amecameca', 'Mexico', 'ctfyv', 'S/N', 'FRENTE A LAS CARIÑOSAS'),
(34, 'JUAN', 'JUAN', 'JUAN1025@gmail.com', '0987654321', 1, '5567876871', '56800', 'Primer callejon de la rosa', 'Atenco', 'Mexico', 'Amecameca', 'Mexico', '12', '12', 'NINGUNA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `usuarios_idusuario` int(11) NOT NULL,
  `productos_idproducto` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `unidades` int(11) NOT NULL,
  `subtotal` float NOT NULL,
  `fechaventa` date NOT NULL,
  `horaventa` time NOT NULL,
  `fechallegada` date DEFAULT NULL,
  `tarjeta` varchar(200) NOT NULL,
  `estadoventa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventa`, `usuarios_idusuario`, `productos_idproducto`, `id`, `unidades`, `subtotal`, `fechaventa`, `horaventa`, `fechallegada`, `tarjeta`, `estadoventa`) VALUES
(1, 1, 1, 1, 1, 1683, '2022-10-01', '02:15:12', '2022-10-04', '1123234354343123', '1'),
(2, 1, 2, 1, 4, 4396, '2022-10-01', '02:15:12', '2022-10-04', '1234568971001231', '1'),
(3, 1, 3, 1, 5, 6500, '2022-10-01', '02:15:12', '2022-10-04', '1123454565454234', '1'),
(4, 1, 4, 1, 1, 1200, '2022-10-01', '02:15:12', '2022-10-04', '1234566789676453', '1'),
(5, 5, 1, 2, 3, 5049, '2022-10-03', '02:15:16', '2022-10-06', '2342435454543556', '1'),
(6, 5, 2, 2, 4, 4396, '2022-10-03', '02:15:16', '2022-10-06', '4645645645654646', '1'),
(7, 5, 3, 2, 2, 2600, '2022-10-03', '02:15:16', '2022-10-06', '7657644353443532', '1'),
(8, 5, 4, 2, 1, 1200, '2022-10-03', '02:15:16', '2022-10-06', '2645645654745643', '1'),
(9, 9, 5, 3, 2, 3998, '2022-10-07', '02:15:20', '2022-10-10', '2342355656756756', '1'),
(10, 9, 29, 3, 3, 327, '2022-10-07', '02:15:20', '2022-10-10', '9089878876873232', '1'),
(11, 11, 31, 4, 2, 238, '2022-10-10', '02:15:23', '2022-10-13', '1112324323421121', '1'),
(12, 11, 20, 4, 3, 387, '2022-10-10', '02:15:23', '2022-10-13', '1113443454323231', '1'),
(13, 13, 28, 5, 4, 556, '2022-10-11', '02:15:24', '2022-10-14', '1223423423421342', '1'),
(14, 13, 5, 5, 5, 9995, '2022-10-11', '02:15:24', '2022-10-14', '1435234234234231', '1'),
(15, 13, 24, 5, 1, 129, '2022-10-11', '02:15:24', '2022-10-14', '5436456456454345', '1'),
(16, 13, 23, 5, 2, 258, '2022-10-11', '02:15:24', '2022-10-14', '3243434534656432', '1'),
(17, 17, 22, 6, 1, 129, '2022-10-12', '02:15:28', '2022-10-15', '5345456456323422', '1'),
(18, 18, 21, 7, 1, 129, '2022-10-12', '02:15:28', '2022-10-15', '3423424525564567', '1'),
(19, 19, 14, 8, 2, 198, '2022-10-13', '02:15:30', '2022-10-16', '1231312455464543', '1'),
(20, 19, 12, 8, 2, 198, '2022-10-13', '02:15:31', '2022-10-16', '6234453434234233', '1'),
(23, 1, 3, 9, 1, 1300, '2022-12-07', '19:51:10', '2022-12-10', '1234567890123456', '1'),
(24, 1, 5, 9, 1, 1999, '2022-12-07', '19:51:10', '2022-12-10', '1234567890123456', '1'),
(25, 1, 14, 10, 10, 990, '2022-12-07', '19:59:53', '2022-12-10', '1234567890123456', '1'),
(26, 1, 14, 11, 1, 99, '2022-12-07', '20:04:05', '2022-12-10', '1234567890123456', '1'),
(27, 1, 14, 12, 1, 99, '2022-12-07', '20:24:58', '2022-12-10', '1234567890123456', '1'),
(28, 1, 26, 13, 1, 129, '2022-12-07', '20:31:02', '2022-12-10', '0987654321123456', '1'),
(29, 1, 3, 14, 1, 1300, '2023-01-04', '15:43:36', '2023-01-07', '1234567891234567', '0'),
(30, 1, 5, 14, 1, 1999, '2023-01-04', '15:43:36', '2023-01-07', '1234567891234567', '0'),
(31, 1, 30, 14, 1, 99, '2023-01-04', '15:43:36', '2023-01-07', '1234567891234567', '0'),
(32, 1, 24, 15, 1, 129, '2023-01-04', '15:46:07', '2023-01-07', '1234567890123456', '0'),
(33, 1, 22, 16, 1, 129, '2023-01-04', '15:53:10', '2023-01-07', '1234567890123456', '0'),
(34, 32, 2, 17, 1, 1099, '2023-01-04', '19:24:15', '2023-01-07', '1234567890123456', '0'),
(35, 32, 3, 17, 1, 1300, '2023-01-04', '19:24:15', '2023-01-07', '1234567890123456', '0'),
(36, 1, 3, 18, 1, 1300, '2023-01-05', '07:38:43', '2023-01-08', '1234567890123456', '0'),
(37, 33, 13, 19, 2, 198, '2023-01-05', '13:33:46', '2023-01-08', '1234567890123456', '0'),
(38, 34, 137, 20, 1, 99, '2023-01-08', '17:02:33', '2023-01-11', '1234567890123456', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`idautor`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `colecciones`
--
ALTER TABLE `colecciones`
  ADD PRIMARY KEY (`idcoleccion`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idcomentario`),
  ADD KEY `fk_comentarios_usuarios1_idx` (`usuarios_idusuario`),
  ADD KEY `fk_comentarios_productos1_idx` (`productos_idproducto`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`ideditorial`);

--
-- Indices de la tabla `listadeseos`
--
ALTER TABLE `listadeseos`
  ADD PRIMARY KEY (`usuarios_idusuario`,`productos_idproducto`),
  ADD KEY `fk_usuarios_has_productos_productos1_idx` (`productos_idproducto`),
  ADD KEY `fk_usuarios_has_productos_usuarios1_idx` (`usuarios_idusuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `fk_productos_categorias1_idx` (`categorias_idcategorias`),
  ADD KEY `fk_productos_colecciones1_idx` (`colecciones_idcoleccion`),
  ADD KEY `fk_productos_editoriales1_idx` (`editoriales_ideditorial`),
  ADD KEY `fk_productos_autores1_idx` (`autores_idautor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_ventas_usuarios_idx` (`usuarios_idusuario`),
  ADD KEY `fk_ventas_productos1_idx` (`productos_idproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `idautor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `colecciones`
--
ALTER TABLE `colecciones`
  MODIFY `idcoleccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `ideditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_productos1` FOREIGN KEY (`productos_idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentarios_usuarios1` FOREIGN KEY (`usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `listadeseos`
--
ALTER TABLE `listadeseos`
  ADD CONSTRAINT `fk_usuarios_has_productos_productos1` FOREIGN KEY (`productos_idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_has_productos_usuarios1` FOREIGN KEY (`usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_autores1` FOREIGN KEY (`autores_idautor`) REFERENCES `autores` (`idautor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_colecciones1` FOREIGN KEY (`colecciones_idcoleccion`) REFERENCES `colecciones` (`idcoleccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_editoriales1` FOREIGN KEY (`editoriales_ideditorial`) REFERENCES `editoriales` (`ideditorial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_ventas_productos1` FOREIGN KEY (`productos_idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_usuarios` FOREIGN KEY (`usuarios_idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
