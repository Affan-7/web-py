--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:TBBgr193COBgPaI8VDz2Xw==$sXeB6Re9Ybh3ZKD+vY+Jxq9P+WEJ3P2HmlAqPgJwf8c=:CKZ9BBH9S5DfZdACLAE8W5E/AW2UToxZER3SgL7p9ZY=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "webpydb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: webpydb; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE webpydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE webpydb OWNER TO admin;

\connect webpydb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    address text,
    credit_card character varying(20)
);


ALTER TABLE public.customers OWNER TO admin;

--
-- Name: executions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.executions (
    id integer NOT NULL,
    code text NOT NULL,
    result text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.executions OWNER TO admin;

--
-- Name: executions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.executions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.executions_id_seq OWNER TO admin;

--
-- Name: executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.executions_id_seq OWNED BY public.executions.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.customers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: executions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.executions ALTER COLUMN id SET DEFAULT nextval('public.executions_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.customers (id, first_name, last_name, email, address, credit_card) FROM stdin;
1	Mordecai	Fearne	mfearne0@netlog.com	0444 Mallard Point	5048372054477209
2	Louie	Bernat	lbernat1@zdnet.com	4029 Valley Edge Avenue	3573990835793889
3	Celia	Seniour	cseniour2@mapquest.com	2 Hintze Center	201459767938405
4	Elliot	Luten	eluten3@examiner.com	96 Mandrake Crossing	30488613455048
5	Adelbert	Swindon	aswindon4@guardian.co.uk	43 Lake View Lane	3588035179954151
6	Sharline	Karlicek	skarlicek5@google.co.uk	19 Drewry Trail	3546073939335164
7	Ralina	Purple	rpurple6@examiner.com	79 Fuller Pass	5002357928860833
8	Timoteo	Molian	tmolian7@spiegel.de	305 South Terrace	50387614929175012
9	Gwenora	Meaden	gmeaden8@archive.org	79 Ronald Regan Hill	5100130950530652
10	Herc	Gidley	hgidley9@list-manage.com	3394 Sunnyside Pass	3585026350581874
11	Angelo	Levermore	alevermorea@i2i.jp	45331 Straubel Road	5018027497328573765
12	Reinaldos	Trimme	rtrimmeb@myspace.com	764 Mifflin Junction	5427421904399211
13	Tanhya	Van den Velde	tvandenveldec@archive.org	14 Pierstorff Junction	30555258598637
14	Kori	Laville	klavilled@aol.com	0968 Hovde Point	3586564382739366
15	Nicki	Stanluck	nstanlucke@cdc.gov	49173 Ridgeview Drive	3576247691823442
16	Conny	Sharple	csharplef@tumblr.com	29605 La Follette Street	3540613396601834
17	Ruthann	Larrington	rlarringtong@economist.com	0 Graedel Avenue	3561988274069435
18	Barby	Wilmott	bwilmotth@adobe.com	5 Elgar Drive	3530614925704869
19	Aloise	Adao	aadaoi@unblog.fr	91 Holy Cross Junction	3546479521195710
20	Bobbee	Scoles	bscolesj@google.com	5 Loomis Pass	30350628815766
21	Reiko	Rens	rrensk@marketwatch.com	055 Messerschmidt Court	560222371380439273
22	Anna	Manktelow	amanktelowl@cargocollective.com	39810 Lawn Drive	3565475724462507
23	Tremaine	Fyldes	tfyldesm@mediafire.com	4 Ridge Oak Street	3559957650164197
24	Carlo	Daveley	cdaveleyn@amazon.co.uk	6 Green Parkway	5378324073598820
25	Igor	Matussov	imatussovo@princeton.edu	3 Scott Hill	6331109292574101818
26	Cordi	Deabill	cdeabillp@odnoklassniki.ru	82 Menomonie Hill	3577743657147684
27	Hatti	Molesworth	hmolesworthq@skype.com	5 Melody Terrace	560222053556424061
28	Marinna	McGow	mmcgowr@chronoengine.com	18668 American Ash Pass	6392205572066403
29	Rochelle	Tenniswood	rtenniswoods@cocolog-nifty.com	35977 Eastwood Junction	5108756177092621
30	Carry	Brewers	cbrewerst@tumblr.com	02735 American Ash Plaza	3566227179604185
31	Valeria	Peaker	vpeakeru@exblog.jp	80479 Anderson Park	3578558729949076
32	Karoly	Denizet	kdenizetv@1688.com	042 Vermont Alley	30300673425201
33	Uriah	Girkin	ugirkinw@imdb.com	9 Ilene Alley	3556100022893119
34	Edouard	Guilliland	eguillilandx@fda.gov	0 Corben Avenue	3570707244243824
35	Retha	Addams	raddamsy@t.co	61965 Florence Park	5108750147438261
36	Olin	MacFarlane	omacfarlanez@shareasale.com	117 Gale Lane	4508662396135267
37	Virgina	Vallis	vvallis10@mit.edu	5210 Corry Hill	5048372198726990
38	Lilia	Sonner	lsonner11@trellian.com	00 Chinook Court	5100146901952274
39	Wake	Skillitt	wskillitt12@latimes.com	22 Ridgeway Place	3539514608933820
40	Merle	Nappin	mnappin13@slideshare.net	33629 Shoshone Drive	6389627221355504
41	Danita	Diggins	ddiggins14@mac.com	4559 Bashford Plaza	3576378001957958
42	Sallyann	Baumaier	sbaumaier15@godaddy.com	25 Meadow Valley Street	4913718748027559
43	Valentina	Whitebread	vwhitebread16@alibaba.com	305 Barnett Parkway	3546678737792117
44	Berte	Pietraszek	bpietraszek17@storify.com	6 Harper Street	3563105214594186
45	Caren	Whild	cwhild18@theglobeandmail.com	07142 Golden Leaf Drive	3531479937331229
46	Helenka	Graver	hgraver19@nhs.uk	78809 4th Place	4175003934958252
47	Daile	Szwandt	dszwandt1a@sohu.com	9325 Service Center	67625212801185658
48	Krissie	Earwicker	kearwicker1b@bigcartel.com	2786 Eagle Crest Park	5602240041218077
49	Shandy	MacVay	smacvay1c@mlb.com	1115 Center Hill	3548843480849377
50	Heywood	Brocklehurst	hbrocklehurst1d@wsj.com	843 Coleman Place	3556417577926759
51	Alan	Weldon	aweldon1e@sohu.com	21730 Brickson Park Junction	373124764143993
52	Margaretta	Isaksen	misaksen1f@zimbio.com	8 Birchwood Pass	348803421268499
53	Skelly	Johl	sjohl1g@vkontakte.ru	9 Melody Road	3539385506519023
54	Mic	Medway	mmedway1h@nps.gov	9518 Texas Circle	201554411820528
55	Berthe	Lambrechts	blambrechts1i@topsy.com	550 Autumn Leaf Street	3529859739939218
56	Eugine	Atwool	eatwool1j@yandex.ru	4112 Pankratz Road	4911114241449619
57	Annie	Lampaert	alampaert1k@google.com	52744 Boyd Road	337941507239597
58	Briant	Fishley	bfishley1l@e-recht24.de	5 Aberg Pass	3560845911265175
59	Giorgi	Elfes	gelfes1m@tripadvisor.com	2285 Sutherland Junction	3580414418169574
60	Alikee	Scrogges	ascrogges1n@prweb.com	29 Northwestern Avenue	3544564667896999
61	Arnie	Wortt	awortt1o@netscape.com	739 Namekagon Court	3576603026949171
62	Michel	Lankford	mlankford1p@ycombinator.com	103 Tomscot Park	3561360564910027
63	Kalil	Glide	kglide1q@tuttocitta.it	6768 American Point	3559380500016493
64	Lilli	Rymell	lrymell1r@pinterest.com	95812 Lyons Parkway	4405923665038374
65	Dallas	Wain	dwain1s@ask.com	496 Goodland Alley	5283260439295871
66	Ammamaria	Ivens	aivens1t@ucla.edu	79 Dryden Parkway	4844615300950877
67	Peyton	Queen	pqueen1u@artisteer.com	23 Monterey Pass	4508616158576084
68	Shayna	Pealing	spealing1v@wsj.com	17 Buell Place	4844638209375731
69	Lindie	Hanson	lhanson1w@wix.com	36851 Merrick Place	4175000850896946
70	Damien	Kenealy	dkenealy1x@google.nl	8 Jay Way	67099898125950392
71	Denna	Lebang	dlebang1y@wikia.com	50908 Starling Drive	5100178867400394
72	Cathlene	Craighead	ccraighead1z@ebay.com	04 Dawn Plaza	3582646141617381
73	Hewet	Spirritt	hspirritt20@wufoo.com	22703 Stang Plaza	3562174792306976
74	Bruce	Cleator	bcleator21@ycombinator.com	9336 Old Shore Drive	670951693146314324
75	Erna	Popple	epopple22@mail.ru	12 Corry Parkway	490372477435639748
76	Nikoletta	Boulder	nboulder23@facebook.com	45105 Dorton Crossing	676233204512063607
77	Maureen	Jarry	mjarry24@dagondesign.com	530 Waubesa Circle	3553340273723705
78	Norean	Dunstan	ndunstan25@boston.com	6 Ohio Park	4911642168122950507
79	Rad	Laudham	rlaudham26@theatlantic.com	19904 Mcguire Hill	3543978483923590
80	Amabelle	Hay	ahay27@narod.ru	1640 Loftsgordon Hill	3545121164229593
81	Craig	Fildes	cfildes28@hatena.ne.jp	4 Barby Pass	3544445527058261
82	Steffi	Oventon	soventon29@washington.edu	1802 Bellgrove Trail	3552685530866932
83	Fritz	Tiebe	ftiebe2a@cafepress.com	7986 Laurel Plaza	4041371597006
84	Reynold	Pymer	rpymer2b@woothemes.com	5 Sage Trail	5602211131016531309
85	Rosabel	Doreward	rdoreward2c@unc.edu	8743 Arizona Way	3536116819005027
86	Gavra	Melsome	gmelsome2d@ucoz.com	6 Linden Park	5602238656408421
87	Winthrop	Flowers	wflowers2e@themeforest.net	1085 Golf Course Street	6762002807810826
88	Hugh	Plaister	hplaister2f@reddit.com	0128 Talisman Terrace	3571788691014917
89	Lodovico	Martijn	lmartijn2g@unicef.org	3526 Pawling Center	0604708385525140
90	Vera	Shakeshaft	vshakeshaft2h@auda.org.au	1169 Grim Circle	4041374038110005
91	Nels	Winspar	nwinspar2i@blogtalkradio.com	0 Evergreen Road	3545642015307395
92	Christen	Wilce	cwilce2j@symantec.com	85 Rigney Way	4913396994353837
93	Dean	Pietzker	dpietzker2k@dailymail.co.uk	64 Erie Way	5100172513827209
94	Avis	Mennear	amennear2l@chronoengine.com	1 Fuller Circle	3570482613315781
95	Denis	Sparhawk	dsparhawk2m@vk.com	373 Summerview Point	5602237610184668902
96	Philippa	MacDougall	pmacdougall2n@microsoft.com	63724 Main Drive	201788571332433
97	Gerik	Neasham	gneasham2o@merriam-webster.com	6840 Del Sol Pass	6377949525299178
98	Phillip	Jirek	pjirek2p@blogspot.com	916 Oxford Way	5602250278009941
99	Olly	Yewdell	oyewdell2q@ocn.ne.jp	26761 Declaration Parkway	630453951924793359
100	Jilly	Smallthwaite	jsmallthwaite2r@squidoo.com	253 Evergreen Park	6331107762712201581
\.


--
-- Data for Name: executions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.executions (id, code, result, created_at) FROM stdin;
60	# Python Program to calculate the square root\r\n\r\n# Note: change this value for a different result\r\nnum = 8 \r\n\r\n# To take the input from the user\r\n#num = float(input('Enter a number: '))\r\n\r\nnum_sqrt = num ** 0.5\r\nprint('The square root of %0.3f is %0.3f'%(num ,num_sqrt))\r\n	The square root of 8.000 is 2.828\n	2024-08-20 09:12:40.985866
64	# Python program to swap two variables\r\n\r\nx = 5\r\ny = 10\r\n\r\n# To take inputs from the user\r\n#x = input('Enter value of x: ')\r\n#y = input('Enter value of y: ')\r\n\r\n# create a temporary variable and swap the values\r\ntemp = x\r\nx = y\r\ny = temp\r\n\r\nprint('The value of x after swapping: {}'.format(x))\r\nprint('The value of y after swapping: {}'.format(y))\r\n	The value of x after swapping: 10\nThe value of y after swapping: 5\n	2024-08-20 09:13:12.045583
68	# Taking kilometers input from the user\r\nkilometers = float(input("Enter value in kilometers: "))\r\n\r\n# conversion factor\r\nconv_fac = 0.621371\r\n\r\n# calculate miles\r\nmiles = kilometers * conv_fac\r\nprint('%0.2f kilometers is equal to %0.2f miles' %(kilometers,miles))\r\n	Enter value in kilometers: An error occurred: EOF when reading a line\n	2024-08-20 09:14:05.513354
72	# Python program to find the largest number among the three input numbers\r\n\r\n# change the values of num1, num2 and num3\r\n# for a different result\r\nnum1 = 10\r\nnum2 = 14\r\nnum3 = 12\r\n\r\n# uncomment following lines to take three numbers from user\r\n#num1 = float(input("Enter first number: "))\r\n#num2 = float(input("Enter second number: "))\r\n#num3 = float(input("Enter third number: "))\r\n\r\nif (num1 >= num2) and (num1 >= num3):\r\n   largest = num1\r\nelif (num2 >= num1) and (num2 >= num3):\r\n   largest = num2\r\nelse:\r\n   largest = num3\r\n\r\nprint("The largest number is", largest)\r\n	The largest number is 14\n	2024-08-20 09:14:44.050916
76	# Multiplication table (from 1 to 10) in Python\r\n\r\nnum = 12\r\n\r\n# To take input from the user\r\n# num = int(input("Display multiplication table of? "))\r\n\r\n# Iterate 10 times from i = 1 to 10\r\nfor i in range(1, 11):\r\n   print(num, 'x', i, '=', num*i)\r\n	12 x 1 = 12\n12 x 2 = 24\n12 x 3 = 36\n12 x 4 = 48\n12 x 5 = 60\n12 x 6 = 72\n12 x 7 = 84\n12 x 8 = 96\n12 x 9 = 108\n12 x 10 = 120\n	2024-08-20 09:15:12.345139
61	# This program adds two numbers\r\n\r\nnum1 = 1.5\r\nnum2 = 6.3\r\n\r\n# Add two numbers\r\nsum = num1 + num2\r\n\r\n# Display the sum\r\nprint('The sum of {0} and {1} is {2}'.format(num1, num2, sum))\r\n	The sum of 1.5 and 6.3 is 7.8\n	2024-08-20 09:12:48.72239
65	# Program to generate a random number between 0 and 9\r\n\r\n# importing the random module\r\nimport random\r\n\r\nprint(random.randint(0,9))\r\n	0\n	2024-08-20 09:13:19.725465
69	# Python Program to convert temperature in celsius to fahrenheit\r\n\r\n# change this value for a different result\r\ncelsius = 37.5\r\n\r\n# calculate fahrenheit\r\nfahrenheit = (celsius * 1.8) + 32\r\nprint('%0.1f degree Celsius is equal to %0.1f degree Fahrenheit' %(celsius,fahrenheit))\r\n	37.5 degree Celsius is equal to 99.5 degree Fahrenheit\n	2024-08-20 09:14:13.000275
73	# Program to check if a number is prime or not\r\n\r\nnum = 29\r\n\r\n# To take input from the user\r\n#num = int(input("Enter a number: "))\r\n\r\n# define a flag variable\r\nflag = False\r\n\r\nif num == 0 or num == 1:\r\n    print(num, "is not a prime number")\r\nelif num > 1:\r\n    # check for factors\r\n    for i in range(2, num):\r\n        if (num % i) == 0:\r\n            # if factor is found, set flag to True\r\n            flag = True\r\n            # break out of loop\r\n            break\r\n\r\n    # check if flag is True\r\n    if flag:\r\n        print(num, "is not a prime number")\r\n    else:\r\n        print(num, "is a prime number")	29 is a prime number\n	2024-08-20 09:14:53.450386
77	# Program to display the Fibonacci sequence up to n-th term\r\n\r\nnterms = int(input("How many terms? "))\r\n\r\n# first two terms\r\nn1, n2 = 0, 1\r\ncount = 0\r\n\r\n# check if the number of terms is valid\r\nif nterms <= 0:\r\n   print("Please enter a positive integer")\r\n# if there is only one term, return n1\r\nelif nterms == 1:\r\n   print("Fibonacci sequence upto",nterms,":")\r\n   print(n1)\r\n# generate fibonacci sequence\r\nelse:\r\n   print("Fibonacci sequence:")\r\n   while count < nterms:\r\n       print(n1)\r\n       nth = n1 + n2\r\n       # update values\r\n       n1 = n2\r\n       n2 = nth\r\n       count += 1	How many terms? An error occurred: EOF when reading a line\n	2024-08-20 09:15:38.406987
62	# Python Program to find the area of triangle\r\n\r\na = 5\r\nb = 6\r\nc = 7\r\n\r\n# Uncomment below to take inputs from the user\r\n# a = float(input('Enter first side: '))\r\n# b = float(input('Enter second side: '))\r\n# c = float(input('Enter third side: '))\r\n\r\n# calculate the semi-perimeter\r\ns = (a + b + c) / 2\r\n\r\n# calculate the area\r\narea = (s*(s-a)*(s-b)*(s-c)) ** 0.5\r\nprint('The area of the triangle is %0.2f' %area)	The area of the triangle is 14.70\n	2024-08-20 09:12:57.010233
66	# Program to generate a random number between 0 and 9\r\n\r\n# importing the random module\r\nimport random\r\n\r\nprint(random.randint(0,9))\r\n	2\n	2024-08-20 09:13:23.132712
70	# Python program to check if the input number is odd or even.\r\n# A number is even if division by 2 gives a remainder of 0.\r\n# If the remainder is 1, it is an odd number.\r\n\r\nnum = int(input("Enter a number: "))\r\nif (num % 2) == 0:\r\n   print("{0} is Even".format(num))\r\nelse:\r\n   print("{0} is Odd".format(num))	Enter a number: An error occurred: EOF when reading a line\n	2024-08-20 09:14:18.851309
74	# Python program to display all the prime numbers within an interval\r\n\r\nlower = 900\r\nupper = 1000\r\n\r\nprint("Prime numbers between", lower, "and", upper, "are:")\r\n\r\nfor num in range(lower, upper + 1):\r\n   # all prime numbers are greater than 1\r\n   if num > 1:\r\n       for i in range(2, num):\r\n           if (num % i) == 0:\r\n               break\r\n       else:\r\n           print(num)	Prime numbers between 900 and 1000 are:\n907\n911\n919\n929\n937\n941\n947\n953\n967\n971\n977\n983\n991\n997\n	2024-08-20 09:14:58.887745
78	# Python program to check if the number is an Armstrong number or not\r\n\r\n# take input from the user\r\nnum = int(input("Enter a number: "))\r\n\r\n# initialize sum\r\nsum = 0\r\n\r\n# find the sum of the cube of each digit\r\ntemp = num\r\nwhile temp > 0:\r\n   digit = temp % 10\r\n   sum += digit ** 3\r\n   temp //= 10\r\n\r\n# display the result\r\nif num == sum:\r\n   print(num,"is an Armstrong number")\r\nelse:\r\n   print(num,"is not an Armstrong number")\r\n	Enter a number: An error occurred: EOF when reading a line\n	2024-08-20 09:15:50.857069
63	# Solve the quadratic equation ax**2 + bx + c = 0\r\n\r\n# import complex math module\r\nimport cmath\r\n\r\na = 1\r\nb = 5\r\nc = 6\r\n\r\n# calculate the discriminant\r\nd = (b**2) - (4*a*c)\r\n\r\n# find two solutions\r\nsol1 = (-b-cmath.sqrt(d))/(2*a)\r\nsol2 = (-b+cmath.sqrt(d))/(2*a)\r\n\r\nprint('The solution are {0} and {1}'.format(sol1,sol2))\r\n	The solution are (-3+0j) and (-2+0j)\n	2024-08-20 09:13:05.39904
67	# Program to generate a random number between 0 and 9\r\n\r\n# importing the random module\r\nimport random\r\n\r\nprint(random.randint(0,9))\r\n	5\n	2024-08-20 09:13:23.719595
71	# Python program to check if year is a leap year or not\r\n\r\nyear = 2000\r\n\r\n# To get year (integer input) from the user\r\n# year = int(input("Enter a year: "))\r\n\r\n# divided by 100 means century year (ending with 00)\r\n# century year divided by 400 is leap year\r\nif (year % 400 == 0) and (year % 100 == 0):\r\n    print("{0} is a leap year".format(year))\r\n\r\n# not divided by 100 means not a century year\r\n# year divided by 4 is a leap year\r\nelif (year % 4 ==0) and (year % 100 != 0):\r\n    print("{0} is a leap year".format(year))\r\n\r\n# if not divided by both 400 (century year) and 4 (not century year)\r\n# year is not leap year\r\nelse:\r\n    print("{0} is not a leap year".format(year))	2000 is a leap year\n	2024-08-20 09:14:25.272545
58	print('Hello, World!')	Hello, World!\n	2024-08-20 09:12:00.827042
59	print('Hello, World!')	Hello, World!\n	2024-08-20 09:12:01.555302
75	# Python program to find the factorial of a number provided by the user.\r\n\r\n# change the value for a different result\r\nnum = 7\r\n\r\n# To take input from the user\r\n#num = int(input("Enter a number: "))\r\n\r\nfactorial = 1\r\n\r\n# check if the number is negative, positive or zero\r\nif num < 0:\r\n   print("Sorry, factorial does not exist for negative numbers")\r\nelif num == 0:\r\n   print("The factorial of 0 is 1")\r\nelse:\r\n   for i in range(1,num + 1):\r\n       factorial = factorial*i\r\n   print("The factorial of",num,"is",factorial)\r\n	The factorial of 7 is 5040\n	2024-08-20 09:15:03.774351
79	# Sum of natural numbers up to num\r\n\r\nnum = 16\r\n\r\nif num < 0:\r\n   print("Enter a positive number")\r\nelse:\r\n   sum = 0\r\n   # use while loop to iterate until zero\r\n   while(num > 0):\r\n       sum += num\r\n       num -= 1\r\n   print("The sum is", sum)\r\n	The sum is 136\n	2024-08-20 09:16:08.959957
\.


--
-- Name: executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.executions_id_seq', 79, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: executions executions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT executions_pkey PRIMARY KEY (id);


--
-- Name: customers users_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: customers users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

