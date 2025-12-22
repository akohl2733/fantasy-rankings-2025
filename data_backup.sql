--
-- PostgreSQL database dump
--

\restrict Dy6Pfxm4kew5eWYnShXMj1KAOkVOnceREDmpeRy7KvMmJ5MCsSfSPcDmDAn7LY7

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 15.14 (Debian 15.14-1.pgdg13+1)

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
-- Name: player_info; Type: TABLE; Schema: public; Owner: fantasy_user
--

CREATE TABLE public.player_info (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    "position" character varying(10) NOT NULL,
    team character varying(3) NOT NULL
);


ALTER TABLE public.player_info OWNER TO fantasy_user;

--
-- Name: player_info_id_seq; Type: SEQUENCE; Schema: public; Owner: fantasy_user
--

CREATE SEQUENCE public.player_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_info_id_seq OWNER TO fantasy_user;

--
-- Name: player_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fantasy_user
--

ALTER SEQUENCE public.player_info_id_seq OWNED BY public.player_info.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: fantasy_user
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying NOT NULL,
    team character varying NOT NULL,
    "position" character varying NOT NULL,
    position_rank integer NOT NULL,
    receptions double precision,
    receiving_yards double precision,
    receiving_tds double precision,
    rushing_yards double precision,
    rushing_tds double precision,
    passing_yards double precision,
    passing_tds double precision,
    turnovers integer,
    proj_points double precision,
    tier integer
);


ALTER TABLE public.players OWNER TO fantasy_user;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: fantasy_user
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO fantasy_user;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fantasy_user
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: weekly_stats_qb_flex; Type: TABLE; Schema: public; Owner: fantasy_user
--

CREATE TABLE public.weekly_stats_qb_flex (
    id integer NOT NULL,
    player_id integer NOT NULL,
    week integer NOT NULL,
    year integer NOT NULL,
    pass_yards integer NOT NULL,
    pass_tds integer NOT NULL,
    rush_attempts integer NOT NULL,
    rush_yards integer NOT NULL,
    rush_tds integer NOT NULL,
    targets integer NOT NULL,
    receptions integer NOT NULL,
    receiving_yards integer NOT NULL,
    receiving_tds integer NOT NULL,
    fumbles integer NOT NULL,
    interceptions integer NOT NULL,
    fantasy_points double precision NOT NULL,
    game_played integer NOT NULL,
    rostered_percent double precision NOT NULL
);


ALTER TABLE public.weekly_stats_qb_flex OWNER TO fantasy_user;

--
-- Name: weekly_stats_qb_flex_id_seq; Type: SEQUENCE; Schema: public; Owner: fantasy_user
--

CREATE SEQUENCE public.weekly_stats_qb_flex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.weekly_stats_qb_flex_id_seq OWNER TO fantasy_user;

--
-- Name: weekly_stats_qb_flex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fantasy_user
--

ALTER SEQUENCE public.weekly_stats_qb_flex_id_seq OWNED BY public.weekly_stats_qb_flex.id;


--
-- Name: player_info id; Type: DEFAULT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.player_info ALTER COLUMN id SET DEFAULT nextval('public.player_info_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: weekly_stats_qb_flex id; Type: DEFAULT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.weekly_stats_qb_flex ALTER COLUMN id SET DEFAULT nextval('public.weekly_stats_qb_flex_id_seq'::regclass);


--
-- Data for Name: player_info; Type: TABLE DATA; Schema: public; Owner: fantasy_user
--

COPY public.player_info (id, name, "position", team) FROM stdin;
1	Josh Allen	QB	BUF
2	Patrick Mahomes II	QB	KC
3	Jonathan Taylor	RB	IND
4	Puka Nacua	WR	LAR
5	Baker Mayfield	QB	TB
6	Christian McCaffrey	RB	SF
7	Dak Prescott	QB	DAL
8	Jalen Hurts	QB	PHI
9	Matthew Stafford	QB	LAR
10	Drake Maye	QB	NE
11	Daniel Jones	QB	IND
12	Javonte Williams	RB	DAL
13	Amon-Ra St. Brown	WR	DET
14	Lamar Jackson	QB	BAL
15	Justin Herbert	QB	LAC
16	Jared Goff	QB	DET
17	James Cook III	RB	BUF
18	Emeka Egbuka	WR	TB
19	Bo Nix	QB	DEN
20	Justin Fields	QB	NYJ
21	Jahmyr Gibbs	RB	DET
22	Sam Darnold	QB	SEA
23	C.J. Stroud	QB	HOU
24	Caleb Williams	QB	CHI
25	Jaxon Smith-Njigba	WR	SEA
26	Kyler Murray	QB	ARI
27	Trevor Lawrence	QB	JAC
28	De'Von Achane	RB	MIA
29	Bijan Robinson	RB	ATL
30	Tua Tagovailoa	QB	MIA
31	Garrett Wilson	WR	NYJ
32	George Pickens	WR	DAL
33	Kyren Williams	RB	LAR
34	Spencer Rattler	QB	NO
35	Jordan Love	QB	GB
36	Deebo Samuel Sr.	WR	WAS
37	Quentin Johnston	WR	LAC
38	Saquon Barkley	RB	PHI
39	Geno Smith	QB	LV
40	Travis Etienne Jr.	RB	JAC
41	Ja'Marr Chase	WR	CIN
42	Rome Odunze	WR	CHI
43	J.K. Dobbins	RB	DEN
44	Ashton Jeanty	RB	LV
45	Josh Jacobs	RB	GB
46	Courtland Sutton	WR	DEN
47	Bryce Young	QB	CAR
48	Omarion Hampton	RB	LAC
49	David Montgomery	RB	DET
50	Justin Jefferson	WR	MIN
51	Jake Ferguson	TE	DAL
52	Tre Tucker	WR	LV
53	Davante Adams	WR	LAR
54	Michael Pittman Jr.	WR	IND
55	Aaron Rodgers	QB	PIT
56	Bucky Irving	RB	TB
57	Keenan Allen	WR	LAC
58	Kenneth Walker III	RB	SEA
59	Cam Skattebo	RB	NYG
60	Jaylen Waddle	WR	MIA
61	Nico Collins	WR	HOU
62	Zay Flowers	WR	BAL
63	Mac Jones	QB	SF
64	Jacory Croskey-Merritt	RB	WAS
65	Quinshon Judkins	RB	CLE
66	Derrick Henry	RB	BAL
67	Spencer Shrader	K	IND
68	Chase McLaughlin	K	TB
69	Jayden Daniels	QB	WAS
70	Dalton Kincaid	TE	BUF
71	Breece Hall	RB	NYJ
72	Jordan Mason	RB	MIN
73	Jake Browning	QB	CIN
74	Joey Slye	K	TEN
75	Brandon Aubrey	K	DAL
76	Ka'imi Fairbairn	K	HOU
77	Michael Penix Jr.	QB	ATL
78	Tyler Warren	TE	IND
79	Carson Wentz	QB	MIN
80	Jacksonville Jaguars	DST	JAC
81	Jason Myers	K	SEA
82	Marvin Harrison Jr.	WR	ARI
83	Rashid Shaheed	WR	NO
84	Tony Pollard	RB	TEN
85	Tyquan Thornton	WR	KC
86	DK Metcalf	WR	PIT
87	Hunter Henry	TE	NE
88	Indianapolis Colts	DST	IND
89	Stefon Diggs	WR	NE
90	Matt Prater	K	BUF
91	Matt Gay	K	WAS
92	Russell Wilson	QB	NYG
93	Rico Dowdle	RB	CAR
94	Chuba Hubbard	RB	CAR
95	Alvin Kamara	RB	NO
96	Romeo Doubs	WR	GB
97	Malik Nabers	WR	NYG
98	Trey McBride	TE	ARI
99	Harrison Butker	K	KC
100	Cam Little	K	JAC
101	Travis Kelce	TE	KC
102	Tetairoa McMillan	WR	CAR
103	Minnesota Vikings	DST	MIN
104	Khalil Shakir	WR	BUF
105	Kenneth Gainwell	RB	PIT
106	Seattle Seahawks	DST	SEA
107	Eddy Pineiro	K	SF
108	Chris Olave	WR	NO
109	DeVonta Smith	WR	PHI
110	Rachaad White	RB	TB
111	Detroit Lions	DST	DET
112	Tyler Loop	K	BAL
113	Nick Chubb	RB	HOU
114	Dallas Goedert	TE	PHI
115	AJ Barner	TE	SEA
116	Marquise Brown	WR	KC
117	Wan'Dale Robinson	WR	NYG
118	Jake Tonges	TE	SF
119	Nick Folk	K	NYJ
120	Jake Bates	K	DET
121	Joshua Karty	K	LAR
122	Rhamondre Stevenson	RB	NE
123	D'Andre Swift	RB	CHI
124	Sam LaPorta	TE	DET
125	Keon Coleman	WR	BUF
126	Houston Texans	DST	HOU
127	Tyreek Hill	WR	MIA
128	Drake London	WR	ATL
129	Tucker Kraft	TE	GB
130	Troy Franklin	WR	DEN
131	Ricky Pearsall	WR	SF
132	Blake Grupe	K	NO
133	Will Reichard	K	MIN
134	Kareem Hunt	RB	KC
135	Jakobi Meyers	WR	LV
136	New England Patriots	DST	NE
137	Chad Ryland	K	ARI
138	Chase Brown	RB	CIN
139	Juwan Johnson	TE	NO
140	Cameron Dicker	K	LAC
141	Brian Thomas Jr.	WR	JAC
142	Denver Broncos	DST	DEN
143	Tory Horton	WR	SEA
144	Cam Ward	QB	TEN
145	Daniel Carlson	K	LV
146	Jaylen Warren	RB	PIT
147	Brock Purdy	QB	SF
148	Woody Marks	RB	HOU
149	Andy Borregales	K	NE
150	Ladd McConkey	WR	LAC
151	Marcus Mariota	QB	WAS
152	Jaxson Dart	QB	NYG
153	Justice Hill	RB	BAL
154	Washington Commanders	DST	WAS
155	Philadelphia Eagles	DST	PHI
156	Kyle Pitts Sr.	TE	ATL
157	Brandon McManus	K	GB
158	Cairo Santos	K	CHI
159	Elic Ayomanor	WR	TEN
160	Zach Ertz	TE	WAS
161	RJ Harvey	RB	DEN
162	Mark Andrews	TE	BAL
163	David Njoku	TE	CLE
164	Theo Johnson	TE	NYG
165	Chris Boswell	K	PIT
166	Ryan Fitzgerald	K	CAR
167	Arizona Cardinals	DST	ARI
168	Jake Elliott	K	PHI
169	A.J. Brown	WR	PHI
170	Calvin Ridley	WR	TEN
171	TreVeyon Henderson	RB	NE
172	Zach Charbonnet	RB	SEA
173	Tee Higgins	WR	CIN
174	Harold Fannin Jr.	TE	CLE
175	Wil Lutz	K	DEN
176	Brock Bowers	TE	LV
177	Jameson Williams	WR	DET
178	Sterling Shepard	WR	TB
179	Kayshon Boutte	WR	NE
180	Los Angeles Rams	DST	LAR
181	Kansas City Chiefs	DST	KC
182	Pittsburgh Steelers	DST	PIT
183	New Orleans Saints	DST	NO
184	Cooper Kupp	WR	SEA
185	Darren Waller	TE	MIA
186	Luke McCaffrey	WR	WAS
187	Kendrick Bourne	WR	SF
188	Joe Flacco	QB	CIN
189	Marvin Mims Jr.	WR	DEN
190	Isiah Pacheco	RB	KC
191	DeAndre Hopkins	WR	BAL
192	Riley Patterson	K	MIA
193	Calvin Austin III	WR	PIT
194	T.J. Hockenson	TE	MIN
195	DJ Moore	WR	CHI
196	JuJu Smith-Schuster	WR	KC
197	Brenton Strange	TE	JAC
198	CeeDee Lamb	WR	DAL
199	Parker Washington	WR	JAC
200	KaVontae Turpin	WR	DAL
201	Xavier Hutchinson	WR	HOU
202	Mason Taylor	TE	NYJ
203	James Conner	RB	ARI
204	Dalton Schultz	TE	HOU
205	Atlanta Falcons	DST	ATL
206	Tyler Allgeier	RB	ATL
207	Trey Benson	RB	ARI
208	Cedric Tillman	WR	CLE
209	J.J. McCarthy	QB	MIN
210	Andre Szmyt	K	CLE
211	Parker Romo	K	ATL
212	Evan McPherson	K	CIN
213	Chicago Bears	DST	CHI
214	Bhayshul Tuten	RB	JAC
215	Josh Downs	WR	IND
216	Jalen Nailor	WR	MIN
217	Hunter Renfrow	WR	CAR
218	Jerry Jeudy	WR	CLE
219	Mike Evans	WR	TB
220	Carolina Panthers	DST	CAR
221	Los Angeles Chargers	DST	LAC
222	Dyami Brown	WR	JAC
223	Kendre Miller	RB	NO
224	Travis Hunter	WR	JAC
225	Tyrod Taylor	QB	NYJ
226	San Francisco 49ers	DST	SF
227	Jordan Addison	WR	MIN
228	Chig Okonkwo	TE	TEN
229	Jauan Jennings	WR	SF
230	Tutu Atwell	WR	LAR
231	Tampa Bay Buccaneers	DST	TB
232	Cleveland Browns	DST	CLE
233	Buffalo Bills	DST	BUF
234	Miami Dolphins	DST	MIA
235	Graham Gano	K	NYG
236	Dylan Sampson	RB	CLE
237	Joshua Palmer	WR	BUF
238	Malik Washington	WR	MIA
239	Xavier Worthy	WR	KC
240	Miles Sanders	RB	DAL
241	Jayden Higgins	WR	HOU
242	Antonio Gibson	RB	NE
243	Rashod Bateman	WR	BAL
244	Ryan Flournoy	WR	DAL
245	Blake Corum	RB	LAR
246	Alec Pierce	WR	IND
247	Evan Engram	TE	DEN
248	Cole Kmet	TE	CHI
249	Olamide Zaccheaus	WR	CHI
250	Matthew Golden	WR	GB
251	Dillon Gabriel	QB	CLE
252	Tommy Tremble	TE	CAR
253	Darius Slayton	WR	NYG
254	Jonnu Smith	TE	PIT
255	Luther Burden III	WR	CHI
256	Kyle Juszczyk	RB	SF
257	Green Bay Packers	DST	GB
258	Hunter Long	TE	JAC
259	Terry McLaurin	WR	WAS
260	Davis Allen	TE	LAR
261	Mack Hollins	WR	NE
262	Mitchell Evans	TE	CAR
263	Devontez Walker	WR	BAL
264	Jeremy McNichols	RB	WAS
265	Josh Oliver	TE	MIN
266	Tennessee Titans	DST	TEN
267	Isaac TeSlaa	WR	DET
268	Zavier Scott	RB	MIN
269	Brock Wright	TE	DET
270	Noah Fant	TE	CIN
271	Jerome Ford	RB	CLE
272	Jeremy Ruckert	TE	NYJ
273	Jalen Tolbert	WR	DAL
274	Elijah Moore	WR	BUF
275	Isaiah Bond	WR	CLE
276	Aaron Jones Sr.	RB	MIN
277	Cade Otton	TE	TB
278	Dontayvion Wicks	WR	GB
279	Brandin Cooks	WR	NO
280	Tyrone Tracy Jr.	RB	NYG
281	Christian Kirk	WR	HOU
282	Michael Carter	RB	ARI
283	Joe Burrow	QB	CIN
284	Andrei Iosivas	WR	CIN
285	Brycen Tremayne	WR	CAR
286	Adam Trautman	TE	DEN
287	Gunnar Helm	TE	TEN
288	Adonai Mitchell	WR	IND
289	Michael Wilson	WR	ARI
290	Emari Demercado	RB	ARI
291	Ja'Tavion Sanders	TE	CAR
292	Tyler Lockett	WR	TEN
293	Kalif Raymond	WR	DET
294	Braelon Allen	RB	NYJ
295	Cincinnati Bengals	DST	CIN
296	New York Giants	DST	NYG
297	Jordan Whittington	WR	LAR
298	Austin Hooper	TE	NE
299	Jaylin Lane	WR	WAS
300	Jackson Hawes	TE	BUF
301	Ollie Gordon II	RB	MIA
302	Las Vegas Raiders	DST	LV
303	DeMario Douglas	WR	NE
304	Xavier Legette	WR	CAR
305	Emanuel Wilson	RB	GB
306	Jahan Dotson	WR	PHI
307	Elijah Arroyo	TE	SEA
308	Brian Robinson Jr.	RB	SF
309	Jayden Reed	WR	GB
310	Daniel Bellinger	TE	NYG
311	Dont'e Thornton Jr.	WR	LV
312	Greg Dortch	WR	ARI
313	Luke Farrell	TE	SF
314	Brashard Smith	RB	KC
315	Oronde Gadsden II	TE	LAC
316	Darnell Mooney	WR	ATL
317	Jaylin Noel	WR	HOU
318	Tylan Wallace	WR	BAL
319	Isaiah Davis	RB	NYJ
320	Tyler Conklin	TE	LAC
321	Curtis Samuel	WR	BUF
322	Devaughn Vele	WR	NO
323	Austin Ekeler	RB	WAS
324	Drew Sample	TE	CIN
325	Chris Rodriguez Jr.	RB	WAS
326	George Kittle	TE	SF
327	Allen Lazard	WR	NYJ
328	Ashton Dulin	WR	IND
329	Jack Stoll	TE	NO
330	Najee Harris	RB	LAC
331	Mike Gesicki	TE	CIN
332	Kyle Monangai	RB	CHI
333	Raheem Mostert	RB	LV
334	Pat Freiermuth	TE	PIT
335	Tez Johnson	WR	TB
336	Elijah Higgins	TE	ARI
337	Tyler Badie	RB	DEN
338	Julian Hill	TE	MIA
339	Ray-Ray McCloud III	WR	ATL
340	Tyler Higbee	TE	LAR
341	Mitch Tinsley	WR	CIN
342	George Holani	RB	SEA
343	Josh Reynolds	WR	NYJ
344	Jude McAtamney	K	NYG
345	Younghoe Koo	K	NYG
346	Dallas Cowboys	DST	DAL
347	New York Jets	DST	NYJ
348	Zonovan Knight	RB	ARI
349	John FitzPatrick	TE	GB
350	Ben Skowronek	WR	PIT
351	Jack Bech	WR	LV
352	Ryan Miller	WR	TB
353	Dawson Knox	TE	BUF
354	Tyler Johnson	WR	NYJ
355	Chris Moore	WR	WAS
356	Devin Singletary	RB	NYG
357	Chris Godwin Jr.	WR	TB
358	Demarcus Robinson	WR	SF
359	Adam Thielen	WR	MIN
360	Michael Mayer	TE	LV
361	Tanner Conner	TE	MIA
362	Casey Washington	WR	ATL
363	Cam Akers	RB	MIN
364	Chimere Dike	WR	TEN
365	Savion Williams	WR	GB
366	Ameer Abdullah	RB	IND
367	Andrew Beck	TE	NYJ
368	Ty Johnson	RB	BUF
369	DJ Giddens	RB	IND
370	Jamari Thrash	WR	CLE
371	Raheim Sanders	RB	CLE
372	Andy Dalton	QB	CAR
373	Luke Musgrave	TE	GB
374	Zay Jones	WR	ARI
375	Albert Okwuegbunam Jr.	TE	LV
376	Tre Harris	WR	LAC
377	Samaje Perine	RB	CIN
378	Grant Calcaterra	TE	PHI
379	Zamir White	RB	LV
380	Cooper Rush	QB	BAL
381	Colston Loveland	TE	CHI
382	A.J. Dillon	RB	PHI
383	Dareke Young	WR	SEA
384	Trevor Etienne	RB	CAR
385	Chris Brooks	RB	GB
386	Malik Heath	WR	GB
387	LeQuint Allen Jr.	RB	JAC
388	Darnell Washington	TE	PIT
389	Noah Gray	TE	KC
390	Noah Brown	WR	WAS
391	Jake Moody	K	CHI
392	Charlie Kolar	TE	BAL
393	Nick Westbrook-Ikhine	WR	MIA
394	Justin Watson	WR	HOU
395	Van Jefferson	WR	TEN
396	James Mitchell	TE	CAR
397	Cade Stover	TE	HOU
398	Xavier Smith	WR	LAR
399	Jimmy Horn Jr.	WR	CAR
400	Mo Alie-Cox	TE	IND
401	John Metchie III	WR	PHI
402	Nikko Remigio	WR	KC
403	Trent Sherfield Sr.	WR	DEN
404	Luke Schoonmaker	TE	DAL
405	Ian Thomas	TE	LV
406	Will Shipley	RB	PHI
407	Will Dissly	TE	LAC
408	Tyrell Shavers	WR	BUF
409	Ray Davis	RB	BUF
410	Arian Smith	WR	NYJ
411	Tip Reiman	TE	ARI
412	Brenden Bates	TE	HOU
413	Tay Martin	WR	WAS
414	Julius Chestnut	RB	TEN
415	Baltimore Ravens	DST	BAL
416	Dylan Laube	RB	LV
417	Alec Ingold	RB	MIA
418	Trey Lance	QB	LAC
419	Marquez Valdes-Scantling	WR	SF
420	Kyle Williams	WR	NE
421	Pat Bryant	WR	DEN
422	Dee Eskridge	WR	MIA
423	Nathan Carter	RB	ATL
424	Terrance Ferguson	TE	LAR
425	Dameon Pierce	RB	HOU
426	Lucas Krull	TE	DEN
427	Tim Patrick	WR	JAC
428	Johnny Mundt	TE	JAC
429	Kimani Vidal	RB	LAC
430	Jake Bobo	WR	SEA
431	David Moore	WR	CAR
432	Adam Prentice	RB	DEN
433	Hunter Luepke	RB	DAL
434	Kaleb Johnson	RB	PIT
435	Jacardia Wright	RB	SEA
436	Hassan Haskins	RB	LAC
437	Keaton Mitchell	RB	BAL
438	Tyson Bagent	QB	CHI
439	Eric Saubert	TE	SEA
440	Tahj Brooks	RB	CIN
441	Isaiah Likely	TE	BAL
442	Anthony Richardson Sr.	QB	IND
443	Skyy Moore	WR	SF
444	Dare Ogunbowale	RB	HOU
445	Kylen Granson	TE	PHI
446	Sean Tucker	RB	TB
447	Zach Wilson	QB	MIA
448	Nate Adkins	TE	DEN
449	British Brooks	RB	HOU
450	John Bates	TE	WAS
451	Tyjae Spears	RB	TEN
452	Alex Bachman	WR	LV
453	Tai Felton	WR	MIN
454	David Sills V	WR	ATL
455	Bryce Oliver	WR	TEN
456	Connor Heyward	TE	PIT
457	Davis Mills	QB	HOU
458	Tank Bigsby	RB	PHI
459	Chris Manhertz	TE	NYG
460	Beaux Collins	WR	NYG
461	Ben Sinnott	TE	WAS
462	Roman Wilson	WR	PIT
463	Kirk Cousins	QB	ATL
464	Tyler Goodson	RB	IND
465	Malachi Corley	WR	CLE
466	Colby Parkinson	TE	LAR
467	Jacob Saylors	RB	DET
468	Cam Grandy	TE	CIN
469	Max Brosmer	QB	MIN
470	Harrison Bryant	TE	HOU
471	Mitchell Trubisky	QB	BUF
472	Devin Neal	RB	NO
473	Zaire Mitchell-Paden	TE	BAL
474	Brevyn Spann-Ford	TE	DAL
475	Jaydon Blue	RB	DAL
476	Taysom Hill	TE	NO
477	Joe Milton III	QB	DAL
478	Rasheen Ali	RB	BAL
479	Drew Lock	QB	SEA
480	Mason Rudolph	QB	PIT
481	Craig Reynolds	RB	DET
482	Jacoby Brissett	QB	ARI
483	Trey Sermon	RB	PIT
484	Cody White	WR	SEA
485	Kenny Yeboah	TE	DET
486	Scotty Miller	WR	PIT
487	Teagan Quitoriano	TE	ATL
488	Stone Smartt	TE	NYJ
489	Colson Yankoff	TE	WAS
490	Durham Smythe	TE	CHI
491	Jelani Woods	TE	NYJ
492	Robert Tonyan	TE	KC
493	Jahdae Walker	WR	CHI
494	Jackson Meeks	WR	DET
495	Tanner Hudson	TE	CIN
496	Devin Duvernay	WR	CHI
497	Feleipe Franks	QB	ATL
498	Jalen Royals	WR	KC
499	Stephen Carlson	TE	CHI
500	Sione Vaki	RB	DET
501	Shane Zylstra	TE	DET
502	Jalin Hyatt	WR	NYG
503	Jalen Cropper	WR	DAL
504	Kameron Johnson	WR	TB
505	Konata Mumpfield	WR	LAR
506	Devin Culp	TE	TB
507	Payne Durham	TE	TB
508	Tim Jones	WR	JAC
509	Josh Williams	RB	TB
510	Brady Russell	TE	SEA
511	Gage Larvadain	WR	CLE
512	Carter Runyon	TE	LV
513	Foster Moreau	TE	NO
514	Jacob Cowing	WR	SF
515	C.J. Ham	RB	MIN
516	Ty Chandler	RB	MIN
517	Avery Williams	RB	NYJ
518	Jalen Brooks	WR	DAL
519	Nick Vannett	TE	FA
520	Will Mallory	TE	IND
521	DeeJay Dallas	RB	CAR
522	Tahj Washington	WR	MIA
523	DeAndre Carter	WR	CLE
524	Khalil Herbert	RB	NYJ
525	Xavier Weaver	WR	ARI
526	Blake Whiteheart	TE	CLE
527	Charlie Jones	WR	CIN
528	Jamal Agnew	WR	ATL
529	Jordan James	RB	SF
530	David Martin-Robinson	TE	TEN
531	Jeff Wilson Jr.	RB	MIA
532	Cameron Latu	TE	PHI
533	James Winchester	TE	KC
534	KhaDarel Hodge	WR	ATL
535	Anthony Gould	WR	IND
536	Jason Brownlee	WR	KC
537	Quintin Morris	TE	JAC
538	Roschon Johnson	RB	CHI
539	Logan Woodside	QB	PIT
540	Bo Melton	WR	GB
541	LaJohntay Wester	WR	BAL
542	Ulysses Bentley IV	RB	IND
543	Velus Jones Jr.	WR	FA
544	Ko Kieft	TE	TB
545	Reggie Gilliam	RB	BUF
546	KeAndre Lambert-Smith	WR	LAC
547	Darius Cooper	WR	PHI
548	Robbie Ouzts	TE	SEA
549	Josiah Deguara	TE	ARI
550	Brayden Willis	TE	SF
551	Jordan Mims	RB	TEN
552	Jack Westover	TE	NE
553	Travis Vokolek	TE	ARI
554	Jeremiah Webb	WR	NE
555	Jimmy Garoppolo	QB	LAR
556	Dominic Lovett	WR	DET
557	Isaac Guerendo	RB	SF
558	Treyton Welch	TE	NO
559	Jakob Johnson	RB	HOU
560	Justin Shorter	WR	LV
561	Kaden Davis	WR	CLE
562	Brett Rypien	QB	FA
563	Tyler Shough	QB	NO
564	Gunner Olszewski	WR	NYG
565	Mason Tipton	WR	NO
566	Patrick Murtagh	TE	DEN
567	Malik Turner	WR	SF
568	Drew Ogletree	TE	IND
569	Xazavian Valladay	RB	FA
570	Ross Dwelley	TE	DET
571	Charlie Woerner	TE	ATL
572	Moliki Matavao	TE	NO
573	Dalevon Campbell	WR	CAR
574	Sincere McCormick	RB	SF
575	Tucker Fisk	TE	LAC
576	Simi Fehoko	WR	ARI
577	Kevin Austin Jr.	WR	NO
578	Russell Gage Jr.	WR	SF
579	Kene Nwangwu	RB	NYJ
580	Ben Yurosek	TE	MIN
581	Kyle Allen	QB	DET
582	Joshua Dobbs	QB	NE
583	Gardner Minshew II	QB	KC
584	Derius Davis	WR	LAC
585	Jalen Milroe	QB	SEA
586	Xavier Gipson	WR	PHI
587	Myles Price	WR	MIN
588	Isaiah Williams	WR	NYJ
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: fantasy_user
--

COPY public.players (id, name, team, "position", position_rank, receptions, receiving_yards, receiving_tds, rushing_yards, rushing_tds, passing_yards, passing_tds, turnovers, proj_points, tier) FROM stdin;
1	Jamarr Chase	Cincinnati Bengals	WR	1	105.5	1300.5	10.5	0	0	0	0	4	241.8	1
2	Bijan Robinson	Atlanta Falcons	RB	1	52.5	425.5	2.5	1175.5	10.5	0	0	6	258.35	1
3	Jahmyr Gibbs	Detroit Lions	RB	2	47.5	475.5	2.5	1050.5	10.5	0	0	6	248.35	1
4	Justin Jefferson	Minnesota Vikings	WR	2	92.5	1200.5	9.5	0	0	0	0	4	219.3	1
5	Saquon Barkley	Philadelphia Eagles	RB	3	27.5	275.5	1.5	1450.5	11.5	0	0	6	258.35	1
6	Ceedee Lamb	Dallas Cowboys	WR	3	97.5	1175.5	7.5	0	0	0	0	4	207.3	1
7	Malik Nabers	New York Giants	WR	4	92.5	1125.5	7.5	0	0	0	0	4	199.8	2
8	Puka Nacua	Los Angeles Rams	WR	5	92.5	1200.5	5.5	0	0.5	0	0	4	198.3	2
9	Christian McCaffrey	San Francisco 49ers	RB	4	55.5	499.5	3.5	950.5	7.5	0	0	6	232.75	2
10	Derrick Henry	Baltimore Ravens	RB	5	20	175	0.5	1350.5	13.5	0	0	6	240.55	2
11	Amon-Ra St. Brown	Detroit Lions	WR	6	97.5	1075.5	8.5	0	0	0	0	4	203.3	2
12	Nico Collins	Houston Texans	WR	7	77.5	1125.5	6.5	0	0	0	0	4	186.3	2
13	Brian Thomas Jr.	Jacksonville Jaguars	WR	8	77.5	1150.5	6.5	30.5	0	0	0	4	191.85	2
14	Drake London	Atlanta Falcons	WR	9	82.5	1075.5	7.5	0	0	0	0	4	189.8	2
15	De'Von Achane	Miami Dolphins	RB	6	65	475	4.5	925.5	7.5	0	0	6	238.55	2
16	Josh Jacobs	Green Bay Packers	RB	7	32.5	275.5	0.5	1050.5	9.5	0	0	6	202.85	2
17	Jonathan Taylor	Indianapolis Colts	RB	8	20.5	175.5	0.5	1225.5	9.5	0	0	6	204.35	2
18	Ashton Jeanty	Las Vegas Raiders	RB	9	35.5	225.5	1.5	1050.5	7.5	0	0	6	193.35	2
19	Bucky Irving	Tampa Bay Buccaneers	RB	10	42.5	349.5	1.5	1000.5	7.5	0	0	6	204.25	3
20	AJ Brown	Philadelphia Eagles	WR	10	72.5	1100.5	7.5	0	0	0	0	4	187.3	2
21	Kyren Williams	Los Angeles Rams	RB	11	27.5	150.5	1	1000.5	10.5	0	0	6	191.85	3
22	Brock Bowers	Las Vegas Raiders	TE	1	95.5	1000.5	5	0	0	0	0	4	173.8	1
23	Chase Brown	Cincinnati Bengals	RB	12	45.5	325.5	2	875.5	5.5	0	0	6	181.85	3
24	Ladd McConkey	Los Angeles Chargers	WR	11	77.5	1025.5	6.5	0	0	0	0	4	176.3	3
25	Omarion Hampton	Los Angeles Chargers	RB	13	30.5	175.5	1	850.5	6.5	0	0	6	156.85	3
26	Jaxon Smith-Njigba	Seattle Seahawks	WR	12	80.5	975.5	5.5	0	0	0	0	4	166.8	3
27	Trey McBride	Arizona Cardinals	TE	2	85.5	925.5	4.5	0	0	0	0	4	158.3	1
28	Josh Allen	Buffalo Bills	QB	1	0	0	0	475.5	10.5	3750.5	27.5	20	350.57	1
29	Tee Higgins	Cincinnati Bengals	WR	13	72.5	975.5	7.5	0	0	0	0	4	174.8	3
30	Mike Evans	Tampa Bay Buccaneers	WR	14	67.5	950.5	7.5	0	0	0	0	4	169.8	3
31	James Cook	Buffalo Bills	RB	14	25.5	200.5	1.5	950.5	8.5	0	0	6	181.85	4
32	Lamar Jackson	Baltimore Ravens	QB	2	0	0	0	750.5	3.5	3450.5	28.5	20	328.07	1
33	Jayden Daniels	Washington Commanders	QB	3	0	0	0	725.5	5.5	3400.5	23.5	20	315.57	1
34	Alvin Kamara	New Orleans Saints	RB	15	55.5	425.5	2.5	750.5	4.5	0	0	6	181.35	4
35	Kenneth Walker III	Seattle Seahawks	RB	16	37.5	325.5	0.5	875.5	6.5	0	0	6	174.85	4
36	George Kittle	San Francisco 49ers	TE	3	65.5	900.5	6.5	0	0	0	0	4	157.8	1
37	Jalen Hurts	Philadelphia Eagles	QB	4	0	0	0	600.5	12.5	3175.5	19.5	20	320.07	1
38	Marvin Harrison Jr.	Arizona Cardinals	WR	17	65.5	950.5	6.5	0	0	0	0	4	162.8	3
39	Davante Adams	Los Angeles Rams	WR	15	72.5	950.5	7.5	0	0	0	0	4	172.3	3
40	Tyreek Hill	Miami Dolphins	WR	16	80.5	975.5	7.5	30.5	0	0	0	4	181.85	3
41	Breece Hall	New York Jets	RB	17	40.5	350.5	1.5	875.5	5.5	0	0	6	178.85	4
42	James Conner	Arizona Cardinals	RB	18	30.5	250.5	1.5	900.5	7.5	0	0	6	178.35	4
43	Garrett Wilson	New York Jets	WR	19	77.5	925.5	4.5	0	0	0	0	4	154.3	4
44	Chuba Hubbard	Carolina Panthers	RB	19	25.5	150.5	0.5	950.5	6.5	0	0	6	158.85	4
45	DK Metcalf	Pittsburgh Steelers	WR	21	67.6	950.5	6.5	0	0	0	0	4	163.85	4
46	TreVeyon Henderson	New England Patriots	RB	20	27.5	250.5	1.5	700.5	4.5	0	0	6	138.85	5
47	RJ Harvey	Denver Broncos	RB	21	30.5	225.5	1	700.5	4.5	0	0	6	134.85	5
48	Tetairoa McMillan	Carolina Panthers	WR	20	60.5	800.5	4.5	0	0	0	0	4	133.3	4
49	Terry McLaurin	Washington Commanders	WR	18	72.5	1000.5	6.5	0	0	0	0	4	171.3	4
50	Xavier Worthy	Kansas City Chiefs	WR	25	65.5	875.5	6.5	65.5	1.5	0	0	4	170.85	4
51	Rome Odunze	Chicago Bears	WR	27	57.5	825.5	5.5	0	0	0	0	4	140.3	5
52	Devonta Smith	Philadelphia Eagles	WR	22	67.5	850.5	5.5	0	0	0	0	4	147.8	5
53	D'Andre Swift	Chicago Bears	RB	22	40.5	325.5	1	800.5	5.5	0	0	6	165.85	5
54	Jaylen Waddle	Miami Dolphins	WR	23	65.5	925.5	5	0	0	0	0	4	151.3	5
55	George Pickens	Dallas Cowboys	WR	28	57.5	875.5	5.5	0	0	0	0	4	145.3	5
56	DJ Moore	Chicago Bears	WR	24	75.5	975.5	6.5	30.5	0	0	0	4	173.35	5
57	Sam Laporta	Detroit Lions	TE	4	62.5	675.5	6.5	0	0	0	0	4	133.8	2
58	Courtland Sutton	Denver Broncos	WR	29	62.5	875.5	6.5	0	0	0	0	4	153.8	5
59	Travis Hunter	Jacksonville Jaguars	WR	34	59.5	750.5	4.5	0	0	0	0	4	127.8	5
60	Tony Pollard	Tennessee Titans	RB	23	32.5	200.5	0.5	875.5	5.5	0	0	6	153.85	5
61	David Montgomery	Detroit Lions	RB	24	25.5	225.5	0.5	725.5	8.5	0	0	6	155.85	5
62	Calvin Ridley	Tennessee Titans	WR	30	60.5	925.5	5.5	24.5	0	0	0	4	154.25	5
63	Jameson Williams	Detroit Lions	WR	31	52.5	875.5	5.5	35.5	0.5	0	0	4	149.35	5
64	Zay Flowers	Baltimore Ravens	WR	32	65.5	900.5	4.5	40.5	0	0	0	4	149.85	5
65	Aaron Jones Sr.	Minnesota Vikings	RB	25	42.5	299.5	0.5	725.5	3.5	0	0	6	141.75	5
66	Joe Burrow	Cincinnati Bengals	QB	5	0	0	0	149.5	2.5	4150.5	33.5	20	309.97	2
67	Ricky Pearsall	San Francisco 49ers	WR	33	55.5	875.5	4.5	0	0	0	0	4	138.3	6
68	Chris Olave	New Orleans Saints	WR	26	65.5	850.5	3.5	0	0	0	0	4	134.8	6
69	Travis Kelce	Kansas City Chiefs	TE	5	82.5	700.5	4.5	0	0	0	0	4	134.3	2
70	Jordan Addison	Minnesota Vikings	WR	35	55.5	625.5	7.5	0	0	0	0	4	131.3	6
71	Patrick Mahomes II	Kansas City Chiefs	QB	6	0	0	0	274.5	1.5	4000.5	27.5	20	286.47	2
72	Emeka Egbuka	Tampa Bay Buccaneers	WR	45	60.5	825.5	4.5	0	0	0	0	4	135.8	6
73	Kaleb Johnson	Pittsburgh Steelers	RB	26	15.5	100.5	0	750.5	5.5	0	0	6	119.85	6
74	Jauan Jennings	San Francisco 49ers	WR	36	60.5	875.5	4.5	0	0	0	0	4	140.8	6
75	Matthew Golden	Green Bay Packers	WR	39	65	700.5	4.5	0	0	0	0	4	125.55	6
76	Kyler Murray	Arizona Cardinals	QB	7	0	0	0	475.5	4.5	3375.5	20.5	20	271.57	2
77	TJ Hockenson	Minnesota Vikings	TE	6	65.5	700.5	3.5	0	0	0	0	4	119.8	2
78	David Njoku	Cleveland Browns	TE	7	60.5	650.5	5.5	0	0	0	0	4	124.3	3
79	Jerry Jeudy	Cleveland Browns	WR	37	70.5	900.5	3.5	0	0	0	0	4	142.3	6
80	Bo Nix	Denver Broncos	QB	8	0	0	0	425.5	4	3475.5	24.5	20	283.57	2
81	Rashee Rice	Kansas City Chiefs	WR	38	62.5	875.5	5.5	0	0	0	0	4	147.8	6
82	Isiah Pacheco	Kansas City Chiefs	RB	27	20.5	135.5	0.5	725.5	4.5	0	0	6	120.35	6
83	Quinshon Judkins	Cleveland Browns	RB	28	19.5	150.5	0.5	675.5	4.5	0	0	6	116.35	6
84	Caleb Williams	Chicago Bears	QB	9	0	0	0	425.5	2	3600.5	22.5	20	268.57	3
85	Baker Mayfield	Tampa Bay Buccaneers	QB	10	0	0	0	225.5	1.5	3800.5	28.5	20	277.57	3
86	Jayden Reed	Green Bay Packers	WR	40	49.5	675.5	4.5	75.5	0.5	0	0	4	125.85	6
87	Tyrone Tracy Jr.	New York Giants	RB	29	27.5	200.5	0.5	725.5	4	0	0	6	127.35	6
88	Stefon Diggs	New England Patriots	WR	41	63.5	750.5	4.5	0	0	0	0	4	129.8	6
89	Mark Andrews	Baltimore Ravens	TE	8	52.5	600.5	6	0	0	0	0	4	118.3	3
90	Jaylen Warren	Pittsburgh Steelers	RB	30	39.5	275.5	0.5	575.5	4.5	0	0	6	128.85	7
91	Deebo Samuel	Washington Commanders	WR	42	55.5	675.5	3.5	100.5	0.5	0	0	4	125.35	7
92	Jakobi Meyers	Las Vegas Raiders	WR	43	70.5	800.5	4.5	0	0	0	0	4	138.3	7
93	Justin Herbert	Los Angeles Chargers	QB	11	0	0	0	250.5	2.5	3650.5	22.5	20	256.07	3
94	JK Dobbins	Denver Broncos	RB	31	22.5	150.5	0.5	599.5	4.5	0	0	6	110.25	7
95	Travis Etienne	Jacksonville Jaguars	RB	32	32.5	225.5	0.5	500.5	3.5	0	0	6	106.85	7
96	Joe Mixon	Houston Texans	RB	33	0	0	0	0	0	0	0	0	0	7
97	Najee Harris	Los Angeles Chargers	RB	34	18.5	125.5	0.5	550.5	4.5	0	0	6	100.85	8
98	Chris Godwin	Tampa Bay Buccaneers	WR	44	62.5	725.5	6.5	0	0	0	0	4	138.8	7
99	Evan Engram	Denver Broncos	TE	9	60.5	575.5	3.5	0	0	0	0	4	104.8	3
100	Justin Fields	New York Jets	QB	12	0	0	0	650.5	6	2500.5	14.5	20	239.07	3
101	Dak Prescott	Dallas Cowboys	QB	13	0	0	0	125.5	1.5	3825.5	26.5	20	260.57	3
102	Tucker Kraft	Green Bay Packers	TE	10	47.5	625.5	3.5	0	0	0	0	4	103.3	4
103	Jordan Mason	Minnesota Vikings	RB	35	12.5	75.5	0.5	600.5	4	0	0	6	94.85	8
104	Drake Maye	New England Patriots	QB	14	0	0	0	475.5	4	3275.5	19.5	20	260.57	3
105	Brock Purdy	San Francisco 49ers	QB	15	0	0	0	175.5	2.5	3800.5	24	20	260.57	4
106	Brian Robinson Jr.	Washington Commanders	RB	36	19.5	125.5	0.5	710.5	6.5	0	0	6	129.35	8
107	Jordan Love	Green Bay Packers	QB	16	0	0	0	125.5	1.5	3550.5	25.5	20	245.57	4
108	Rachaad White	Tampa Bay Buccaneers	RB	37	30.5	225.5	1.5	425.5	2	0	0	6	95.35	8
109	Michael Pittman	Indianapolis Colts	WR	46	57.5	750.5	3.5	0	0	0	0	4	120.8	7
110	Josh Downs	Indianapolis Colts	WR	47	52.5	675.5	3.5	0	0	0	0	4	110.8	7
111	Khalil Shakir	Buffalo Bills	WR	48	57.5	775.5	4	0	0	0	0	4	126.3	7
112	Jake Ferguson	Dallas Cowboys	TE	11	57.5	550.5	3.5	0	0	0	0	4	100.8	4
113	CJ Stroud	Houston Texans	QB	17	0	0	0	175.5	1	3750.5	21.5	20	239.57	4
114	Cam Skattebo	New York Giants	RB	38	17.5	150.5	0.5	475.5	4.5	0	0	6	95.35	9
115	Darnell Mooney	Atlanta Falcons	WR	49	50.5	700.5	3.5	0	0	0	0	4	112.3	7
116	Tyler Warren	Indianapolis Colts	TE	12	50.5	525.5	4.5	0	0	0	0	4	100.8	4
117	Trevor Lawrence	Jacksonville Jaguars	QB	18	0	0	0	175.5	3.5	3650.5	22.5	20	254.57	4
118	Keon Coleman	Buffalo Bills	WR	50	42.5	750	4.5	0	0	0	0	4	119.25	8
119	Tank Bigsby	Jacksonville Jaguars	RB	39	5	50.5	0	550.5	4	0	0	6	80.6	9
120	Cooper Kupp	Seattle Seahawks	WR	51	62.5	675.5	5.5	0	0	0	0	4	127.8	8
121	Jared Goff	Detroit Lions	QB	19	0	0	0	49.5	0.5	3850.5	28.5	20	255.97	4
122	Colston Loveland	Chicago Bears	TE	13	45.5	575.5	4	0	0	0	0	4	100.3	5
123	Dalton Kincaid	Buffalo Bills	TE	14	50.5	575.5	3.5	0	0	0	0	4	99.8	5
124	Tyjae Spears	Tennessee Titans	RB	40	27.5	200.5	0.5	425.5	3	0	0	6	91.35	9
125	Jaylen Wright	Miami Dolphins	RB	41	10.5	75.5	0	500.5	2.5	0	0	6	71.85	9
\.


--
-- Data for Name: weekly_stats_qb_flex; Type: TABLE DATA; Schema: public; Owner: fantasy_user
--

COPY public.weekly_stats_qb_flex (id, player_id, week, year, pass_yards, pass_tds, rush_attempts, rush_yards, rush_tds, targets, receptions, receiving_yards, receiving_tds, fumbles, interceptions, fantasy_points, game_played, rostered_percent) FROM stdin;
1	1	1	2025	394	2	14	30	2	0	0	0	0	0	0	38.8	1	99.7
2	11	1	2025	272	1	7	26	2	0	0	0	0	0	0	29.5	1	58.5
3	20	1	2025	218	1	12	48	2	0	0	0	0	0	0	29.5	1	87.9
4	14	1	2025	209	2	6	70	1	0	0	0	0	0	0	29.4	1	99.8
5	15	1	2025	318	3	7	32	0	0	0	0	0	0	0	27.9	1	93.3
6	2	1	2025	258	1	6	57	1	0	0	0	0	0	0	26	1	98.9
7	55	1	2025	244	4	1	-1	0	0	0	0	0	0	0	25.7	1	19.2
8	8	1	2025	152	0	14	62	2	0	0	0	0	0	0	24.3	1	99.7
9	24	1	2025	210	1	6	58	1	0	0	0	0	0	0	24.2	1	79
10	77	1	2025	298	1	6	21	1	0	0	0	0	0	0	24	1	21.6
11	209	1	2025	143	2	2	25	1	0	0	0	0	0	1	23.2	1	31.4
12	5	1	2025	167	3	5	39	0	0	0	0	0	0	0	22.6	1	96.6
13	69	1	2025	233	1	11	68	0	0	0	0	0	0	0	20.1	1	98.9
14	147	1	2025	277	2	5	17	0	0	0	0	0	0	2	18.8	1	78.7
15	39	1	2025	362	1	2	10	0	0	0	0	0	0	1	18.5	1	29
16	26	1	2025	163	2	7	38	0	0	0	0	0	0	0	18.3	1	90.5
17	10	1	2025	287	1	4	11	0	0	0	0	0	0	1	16.3	1	87
18	35	1	2025	188	2	3	4	0	0	0	0	0	0	0	15.9	1	77.3
19	188	1	2025	290	1	2	6	0	0	0	0	0	0	2	14.2	1	2.7
20	9	1	2025	245	1	4	-2	0	0	0	0	0	0	0	13.6	1	58.3
21	16	1	2025	225	1	1	-1	0	0	0	0	0	0	1	11.9	1	87.5
22	34	1	2025	214	0	4	29	0	0	0	0	0	0	0	11.5	1	6.3
23	27	1	2025	178	1	4	12	0	0	0	0	0	0	1	11.3	1	32.9
24	92	1	2025	168	0	8	44	0	0	0	0	0	0	0	11.1	1	4.4
25	47	1	2025	154	1	5	40	0	0	0	0	0	1	2	10.2	1	23.6
26	23	1	2025	188	0	5	32	0	0	0	0	0	0	1	9.7	1	65.6
27	19	1	2025	176	1	8	18	0	0	0	0	0	1	2	8.8	1	89.2
28	283	1	2025	113	1	2	3	0	0	0	0	0	0	0	8.8	1	77.3
29	7	1	2025	188	0	1	3	0	0	0	0	0	0	0	7.8	1	86.9
30	30	1	2025	114	1	1	7	0	0	0	0	0	1	2	7.3	1	27.5
31	22	1	2025	150	0	2	14	0	0	0	0	0	1	0	5.4	1	23
32	144	1	2025	112	0	0	0	0	0	0	0	0	1	0	2.5	1	14.9
33	447	1	2025	32	0	1	3	0	0	0	0	0	0	0	1.6	1	0.6
34	585	1	2025	0	0	1	1	0	0	0	0	0	0	0	0.1	1	1.4
35	457	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
36	563	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.5
37	63	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	3.8
38	497	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
39	418	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
40	251	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	5.6
41	152	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	46.3
42	477	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
43	469	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
44	442	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	6.1
45	438	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
46	225	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
47	372	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
48	463	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.2
49	555	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.9
50	581	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
51	480	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
52	539	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
53	479	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	3.6
54	73	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	8.9
55	583	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
56	380	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.5
57	151	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	4
58	471	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
59	582	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
60	79	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	6.2
61	482	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
62	66	1	2025	0	0	18	169	2	1	1	13	0	1	0	28.7	1	99.8
63	29	1	2025	0	0	12	24	0	7	6	100	1	0	0	21.4	1	99.8
64	12	1	2025	0	0	15	54	2	3	2	10	0	0	0	19.4	1	94.9
65	6	1	2025	0	0	22	69	0	10	9	73	0	0	0	18.7	1	99.8
66	17	1	2025	0	0	13	44	1	5	5	58	0	0	0	18.7	1	99.4
67	40	1	2025	0	0	16	143	0	3	3	13	0	0	0	17.1	1	92.2
68	38	1	2025	0	0	18	60	1	5	4	24	0	0	0	16.4	1	99.8
69	94	1	2025	0	0	16	57	0	5	3	32	1	0	0	16.4	1	95.9
70	71	1	2025	0	0	19	107	0	4	2	38	0	0	0	15.5	1	97.6
71	28	1	2025	0	0	7	55	0	4	3	20	1	0	0	15	1	99.7
72	276	1	2025	0	0	8	23	0	3	3	44	1	0	0	14.2	1	82.5
73	64	1	2025	0	0	10	82	1	1	0	0	0	0	0	14.2	1	74.3
74	43	1	2025	0	0	16	63	1	2	2	5	0	0	0	13.8	1	88.2
75	45	1	2025	0	0	19	66	1	1	1	4	0	0	0	13.5	1	99.7
76	33	1	2025	0	0	18	66	1	2	1	3	0	0	0	13.4	1	99.3
77	236	1	2025	0	0	12	29	0	8	8	64	0	0	0	13.3	1	21.4
78	146	1	2025	0	0	11	37	0	2	2	22	1	0	0	12.9	1	88
79	95	1	2025	0	0	11	45	1	2	2	12	0	0	0	12.7	1	98.4
80	56	1	2025	0	0	14	37	0	4	4	8	1	0	0	12.5	1	99.1
81	203	1	2025	0	0	12	39	0	4	4	5	1	0	0	12.4	1	55.7
82	138	1	2025	0	0	21	43	1	3	2	8	0	0	0	12.1	1	97.7
83	3	1	2025	0	0	18	71	0	3	3	27	0	0	0	11.3	1	99.6
84	44	1	2025	0	0	19	38	1	2	2	2	0	0	0	11	1	99.5
85	172	1	2025	0	0	12	47	1	0	0	0	0	0	0	10.7	1	76.5
86	21	1	2025	0	0	9	19	0	10	10	31	0	0	0	10	1	99.8
87	171	1	2025	0	0	5	27	0	6	6	24	0	0	0	8.1	1	90.2
88	123	1	2025	0	0	17	53	0	5	3	12	0	0	0	8	1	92.5
89	207	1	2025	0	0	8	69	0	1	1	6	0	0	0	8	1	63.2
90	72	1	2025	0	0	15	68	0	1	1	7	0	0	0	8	1	87
91	84	1	2025	0	0	18	60	0	1	1	29	0	1	0	7.4	1	91.7
92	161	1	2025	0	0	6	70	0	1	1	-1	0	0	0	7.4	1	81.3
93	323	1	2025	0	0	6	26	0	3	3	31	0	0	0	7.2	1	38.1
94	48	1	2025	0	0	15	48	0	2	2	13	0	0	0	7.1	1	98.7
95	294	1	2025	0	0	6	9	1	0	0	0	0	0	0	6.9	1	21.1
96	49	1	2025	0	0	11	25	0	4	4	18	0	0	0	6.3	1	95.3
97	371	1	2025	0	0	3	3	1	0	0	0	0	0	0	6.3	1	0.6
98	113	1	2025	0	0	13	60	0	1	0	0	0	0	0	6	1	69.6
99	280	1	2025	0	0	10	24	0	5	2	11	0	0	0	4.5	1	55.5
100	256	1	2025	0	0	0	0	0	2	2	32	0	0	0	4.2	1	0.9
101	308	1	2025	0	0	9	33	0	2	1	4	0	0	0	4.2	1	53.6
102	369	1	2025	0	0	12	41	0	0	0	0	0	0	0	4.1	1	3.6
103	58	1	2025	0	0	10	20	0	3	3	4	0	0	0	3.9	1	97.3
104	105	1	2025	0	0	7	19	0	4	3	4	0	0	0	3.8	1	47.2
105	190	1	2025	0	0	5	25	0	3	2	3	0	0	0	3.8	1	86.5
106	122	1	2025	0	0	7	15	0	3	2	12	0	0	0	3.7	1	72.6
107	134	1	2025	0	0	5	16	0	3	2	10	0	0	0	3.6	1	32.1
108	240	1	2025	0	0	4	53	0	1	1	-3	0	1	0	3.5	1	5.4
109	406	1	2025	0	0	3	26	0	0	0	0	0	0	0	2.6	1	5.6
110	93	1	2025	0	0	3	12	0	3	2	4	0	0	0	2.6	1	48.6
111	337	1	2025	0	0	0	0	0	6	2	16	0	0	0	2.6	1	0.7
112	264	1	2025	0	0	4	25	0	0	0	0	0	0	0	2.5	1	2.5
113	368	1	2025	0	0	2	24	0	2	0	0	0	0	0	2.4	1	1.1
114	206	1	2025	0	0	10	24	0	0	0	0	0	0	0	2.4	1	33.4
115	223	1	2025	0	0	5	24	0	0	0	0	0	0	0	2.4	1	19.9
116	245	1	2025	0	0	1	2	0	1	1	14	0	0	0	2.1	1	18.9
117	110	1	2025	0	0	2	14	0	1	1	2	0	0	0	2.1	1	69.1
118	59	1	2025	0	0	2	-3	0	2	2	12	0	0	0	1.9	1	95
119	319	1	2025	0	0	2	18	0	0	0	0	0	0	0	1.8	1	7.3
120	377	1	2025	0	0	0	0	0	2	2	6	0	0	0	1.6	1	1.2
121	387	1	2025	0	0	1	7	0	1	1	4	0	0	0	1.6	1	0.6
122	444	1	2025	0	0	2	9	0	2	2	17	0	1	0	1.6	1	0.6
123	332	1	2025	0	0	0	0	0	1	1	11	0	0	0	1.6	1	6.2
124	330	1	2025	0	0	1	5	0	1	1	5	0	0	0	1.5	1	12.5
125	458	1	2025	0	0	5	12	0	0	0	0	0	0	0	1.2	1	37.4
126	214	1	2025	0	0	3	11	0	0	0	0	0	0	0	1.1	1	44.8
127	271	1	2025	0	0	6	8	0	1	1	-3	0	0	0	1	1	28.5
128	382	1	2025	0	0	3	10	0	0	0	0	0	0	0	1	1	1.4
129	356	1	2025	0	0	3	9	0	0	0	0	0	0	0	0.9	1	3.4
130	472	1	2025	0	0	2	9	0	0	0	0	0	0	0	0.9	1	2
131	432	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	0
132	301	1	2025	0	0	2	4	0	1	1	-1	0	0	0	0.8	1	26.3
133	379	1	2025	0	0	3	8	0	0	0	0	0	0	0	0.8	1	1
134	385	1	2025	0	0	1	1	0	1	1	2	0	0	0	0.8	1	0.8
135	409	1	2025	0	0	1	2	0	1	1	-1	0	0	0	0.6	1	14.2
136	417	1	2025	0	0	0	0	0	2	1	1	0	0	0	0.6	1	0.6
137	478	1	2025	0	0	1	5	0	0	0	0	0	0	0	0.5	1	0.6
138	425	1	2025	0	0	3	5	0	1	0	0	0	0	0	0.5	1	3.1
139	305	1	2025	0	0	1	4	0	0	0	0	0	0	0	0.4	1	1.7
140	384	1	2025	0	0	1	4	0	0	0	0	0	0	0	0.4	1	4.5
141	148	1	2025	0	0	3	3	0	0	0	0	0	0	0	0.3	1	78.2
142	242	1	2025	0	0	1	3	0	1	0	0	0	0	0	0.3	1	1.4
143	414	1	2025	0	0	2	2	0	0	0	0	0	0	0	0.2	1	1.2
144	446	1	2025	0	0	1	2	0	0	0	0	0	0	0	0.2	1	9.2
145	524	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
146	282	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	46.3
147	545	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
148	481	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
149	363	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.8
150	521	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
151	516	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.9
152	483	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
153	325	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	14.5
154	433	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
155	429	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
156	552	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
157	557	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	5
158	500	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
159	440	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.6
160	416	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
161	65	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	90.8
162	551	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
163	268	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	5.1
164	510	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
165	467	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
166	290	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	59.3
167	548	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
168	509	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
169	435	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
170	423	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
171	449	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
172	489	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
173	529	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
174	314	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	12.7
175	579	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
176	574	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
177	517	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
178	464	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
179	342	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
180	542	1	2025	0	0	1	0	0	0	0	0	0	0	0	0	1	0
181	348	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.1
182	437	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	4.6
183	451	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	37.5
184	538	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	2.9
185	436	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
186	475	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	17.9
187	543	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
188	559	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
189	367	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
190	531	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1
191	515	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
192	366	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
193	333	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	2.4
194	434	1	2025	0	0	1	-2	0	0	0	0	0	0	0	-0.2	1	32.5
195	153	1	2025	0	0	2	-14	0	2	1	3	0	0	0	-0.6	1	21
196	62	1	2025	0	0	2	8	0	9	7	143	1	0	0	24.6	1	96.9
197	37	1	2025	0	0	0	0	0	7	5	79	2	0	0	22.4	1	66.9
198	18	1	2025	0	0	1	9	0	6	4	67	2	0	0	21.6	1	96.4
199	125	1	2025	0	0	0	0	0	11	8	112	1	0	0	21.2	1	74.3
200	36	1	2025	0	0	1	19	1	10	7	77	0	0	0	19.1	1	91.9
201	31	1	2025	0	0	0	0	0	9	7	95	1	0	0	19	1	98.7
202	4	1	2025	0	0	1	1	0	11	10	130	0	0	0	18.1	1	99.8
203	54	1	2025	0	0	0	0	0	8	6	80	1	0	0	17	1	84
204	57	1	2025	0	0	0	0	0	10	7	68	1	0	0	16.3	1	88.4
205	82	1	2025	0	0	0	0	0	6	5	71	1	0	0	15.6	1	97.2
206	46	1	2025	0	0	0	0	0	9	6	61	1	0	0	15.1	1	95
207	193	1	2025	0	0	0	0	0	6	4	70	1	0	0	15	1	9.5
208	116	1	2025	0	0	0	0	0	16	10	99	0	0	0	14.9	1	43
209	25	1	2025	0	0	0	0	0	13	9	124	0	1	0	14.9	1	99.4
210	198	1	2025	0	0	0	0	0	13	7	110	0	0	0	14.5	1	99.8
211	208	1	2025	0	0	0	0	0	8	5	52	1	0	0	13.7	1	21.2
212	135	1	2025	0	0	0	0	0	10	8	97	0	0	0	13.7	1	90.7
213	179	1	2025	0	0	0	0	0	8	6	103	0	0	0	13.3	1	7.4
214	50	1	2025	0	0	1	4	0	7	4	44	1	0	0	12.8	1	99.8
215	131	1	2025	0	0	0	0	0	7	4	108	0	0	0	12.8	1	86.6
216	42	1	2025	0	0	0	0	0	9	6	37	1	0	0	12.7	1	95
217	52	1	2025	0	0	0	0	0	3	2	54	1	0	0	12.4	1	54.6
218	309	1	2025	0	0	0	0	0	5	3	45	1	0	0	12	1	42.8
219	191	1	2025	0	0	0	0	0	2	2	35	1	0	0	10.5	1	9.7
220	150	1	2025	0	0	0	0	0	9	6	74	0	0	0	10.4	1	97
221	86	1	2025	0	0	0	0	0	7	4	83	0	0	0	10.3	1	97.3
222	97	1	2025	0	0	0	0	0	12	5	71	0	0	0	9.6	1	47.6
223	128	1	2025	0	0	0	0	0	15	8	55	0	0	0	9.5	1	99.2
224	104	1	2025	0	0	0	0	0	9	6	64	0	0	0	9.4	1	80.9
225	102	1	2025	0	0	0	0	0	9	5	68	0	0	0	9.3	1	94.6
226	218	1	2025	0	0	0	0	0	8	5	66	0	0	0	9.1	1	86.2
227	108	1	2025	0	0	0	0	0	13	7	54	0	0	0	8.9	1	90.3
228	89	1	2025	0	0	0	0	0	7	6	57	0	0	0	8.7	1	85.3
229	350	1	2025	0	0	0	0	0	1	1	22	1	0	0	8.7	1	0.1
230	237	1	2025	0	0	0	0	0	9	5	61	0	0	0	8.6	1	13.4
231	141	1	2025	0	0	1	9	1	7	1	11	0	0	0	8.5	1	98.1
232	117	1	2025	0	0	0	0	0	8	6	55	0	0	0	8.5	1	51.9
233	196	1	2025	0	0	0	0	0	5	5	55	0	0	0	8	1	7.3
234	267	1	2025	0	0	0	0	0	1	1	13	1	0	0	7.8	1	5.6
235	96	1	2025	0	0	0	0	0	4	2	68	0	0	0	7.8	1	38.2
236	219	1	2025	0	0	0	0	0	8	5	51	0	0	0	7.6	1	95.7
237	306	1	2025	0	0	0	0	0	3	3	59	0	0	0	7.4	1	1.2
238	222	1	2025	0	0	2	6	0	4	3	52	0	0	0	7.3	1	4.7
239	303	1	2025	0	0	1	4	0	7	2	-2	1	0	0	7.2	1	13
240	195	1	2025	0	0	3	8	0	5	3	68	0	1	0	7.1	1	89.4
241	53	1	2025	0	0	0	0	0	8	4	51	0	0	0	7.1	1	98.5
242	339	1	2025	0	0	0	0	0	5	3	51	0	0	0	6.6	1	1.5
243	13	1	2025	0	0	0	0	0	6	4	45	0	0	0	6.5	1	99.7
244	130	1	2025	0	0	0	0	0	6	4	44	0	0	0	6.4	1	40.1
245	83	1	2025	0	0	0	0	0	9	6	33	0	0	0	6.3	1	67.8
246	224	1	2025	0	0	0	0	0	8	6	33	0	0	0	6.3	1	87.6
247	249	1	2025	0	0	0	0	0	7	4	42	0	0	0	6.2	1	0.9
248	127	1	2025	0	0	0	0	0	6	4	40	0	0	0	6	1	59
249	311	1	2025	0	0	0	0	0	4	2	45	0	0	0	5.5	1	7.2
250	178	1	2025	0	0	0	0	0	6	3	39	0	0	0	5.4	1	2.6
251	85	1	2025	0	0	0	0	0	4	2	41	0	0	0	5.1	1	12.1
252	60	1	2025	0	0	0	0	0	5	4	30	0	0	0	5	1	94.1
253	362	1	2025	0	0	0	0	0	6	3	33	0	0	0	4.8	1	0
254	173	1	2025	0	0	0	0	0	4	3	33	0	0	0	4.8	1	96.8
255	170	1	2025	0	0	0	0	0	8	4	27	0	0	0	4.7	1	74.7
256	177	1	2025	0	0	1	3	0	5	4	23	0	0	0	4.6	1	91.9
257	201	1	2025	0	0	1	5	0	2	2	30	0	0	0	4.5	1	0.6
258	32	1	2025	0	0	0	0	0	4	3	30	0	0	0	4.5	1	96.8
259	241	1	2025	0	0	0	0	0	3	2	32	0	0	0	4.2	1	22.4
260	398	1	2025	0	0	0	0	0	1	1	36	0	0	0	4.1	1	1
261	246	1	2025	0	0	0	0	0	3	1	36	0	0	0	4.1	1	6.3
262	354	1	2025	0	0	0	0	0	2	2	31	0	0	0	4.1	1	1.1
263	279	1	2025	0	0	0	0	0	4	3	26	0	0	0	4.1	1	2.4
264	61	1	2025	0	0	0	0	0	5	3	25	0	0	0	4	1	99.6
265	278	1	2025	0	0	0	0	0	2	2	30	0	0	0	4	1	3.5
266	238	1	2025	0	0	1	9	0	5	2	20	0	0	0	3.9	1	29.7
267	355	1	2025	0	0	0	0	0	1	1	34	0	0	0	3.9	1	0
268	200	1	2025	0	0	2	9	0	2	2	18	0	0	0	3.7	1	10.8
269	390	1	2025	0	0	0	0	0	3	2	27	0	0	0	3.7	1	1
270	259	1	2025	0	0	0	0	0	4	2	27	0	0	0	3.7	1	94.7
271	394	1	2025	0	0	0	0	0	2	2	27	0	0	0	3.7	1	1.8
272	41	1	2025	0	0	0	0	0	5	2	26	0	0	0	3.6	1	99.7
273	216	1	2025	0	0	0	0	0	3	1	28	0	0	0	3.3	1	2.1
274	288	1	2025	0	0	0	0	0	2	2	21	0	0	0	3.1	1	2.5
275	109	1	2025	0	0	0	0	0	3	3	16	0	0	0	3.1	1	92.9
276	351	1	2025	0	0	0	0	0	1	1	23	0	0	0	2.8	1	3.6
277	343	1	2025	0	0	0	0	0	3	2	18	0	0	0	2.8	1	1.6
278	250	1	2025	0	0	0	0	0	2	2	16	0	0	0	2.6	1	74.4
279	293	1	2025	0	0	0	0	0	3	2	16	0	0	0	2.6	1	0.6
280	229	1	2025	0	0	0	0	0	5	2	16	0	0	0	2.6	1	76.1
281	184	1	2025	0	0	0	0	0	3	2	15	0	0	0	2.5	1	77.9
282	304	1	2025	0	0	0	0	0	7	3	10	0	0	0	2.5	1	16
283	159	1	2025	0	0	0	0	0	7	2	13	0	0	0	2.3	1	42.5
284	215	1	2025	0	0	0	0	0	3	2	12	0	0	0	2.2	1	54.5
285	217	1	2025	0	0	0	0	0	6	2	11	0	0	0	2.1	1	1.7
286	359	1	2025	0	0	0	0	0	1	0	0	0	0	0	2	1	13.4
287	243	1	2025	0	0	0	0	0	4	2	10	0	0	0	2	1	26.2
288	322	1	2025	0	0	0	0	0	2	1	13	0	0	0	1.8	1	0.6
289	420	1	2025	0	0	0	0	0	1	1	12	0	0	0	1.7	1	3.8
290	299	1	2025	0	0	0	0	0	2	1	11	0	0	0	1.6	1	0.9
291	376	1	2025	0	0	0	0	0	1	1	11	0	0	0	1.6	1	6.9
292	274	1	2025	0	0	1	8	0	1	1	3	0	0	0	1.6	1	0.6
293	328	1	2025	0	0	1	15	0	0	0	0	0	0	0	1.5	1	0
294	422	1	2025	0	0	0	0	0	2	1	9	0	0	0	1.4	1	0.1
295	169	1	2025	0	0	0	0	0	1	1	8	0	0	0	1.3	1	99.2
296	455	1	2025	0	0	0	0	0	1	1	8	0	0	0	1.3	1	0
297	317	1	2025	0	0	0	0	0	2	1	7	0	0	0	1.2	1	2
298	393	1	2025	0	0	0	0	0	2	1	7	0	0	0	1.2	1	1.5
299	370	1	2025	0	0	0	0	0	1	1	6	0	0	0	1.1	1	0.7
300	289	1	2025	0	0	0	0	0	4	1	5	0	0	0	1	1	4.1
301	275	1	2025	0	0	0	0	0	1	1	5	0	0	0	1	1	11.3
302	364	1	2025	0	0	1	9	0	1	0	0	0	0	0	0.9	1	1.3
303	374	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	0.6
304	230	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	1.5
305	403	1	2025	0	0	0	0	0	1	1	3	0	0	0	0.8	1	0
306	261	1	2025	0	0	0	0	0	2	1	3	0	0	0	0.8	1	0.9
307	189	1	2025	0	0	0	0	0	4	3	12	0	1	0	0.7	1	36.6
308	365	1	2025	0	0	0	0	0	1	1	1	0	0	0	0.6	1	0.7
309	297	1	2025	0	0	1	5	0	0	0	0	0	0	0	0.5	1	1.1
310	273	1	2025	0	0	0	0	0	2	1	0	0	0	0	0.5	1	7.1
311	584	1	2025	0	0	1	3	0	0	0	0	0	0	0	0.3	1	0.6
312	312	1	2025	0	0	0	0	0	1	1	-2	0	0	0	0.3	1	0.8
313	255	1	2025	0	0	0	0	0	1	1	-3	0	0	0	0.2	1	14.7
314	577	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
315	239	1	2025	0	0	1	0	0	1	0	0	0	0	0	0	1	96
316	410	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
317	576	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
318	199	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.9
319	227	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	84.8
320	460	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
321	401	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.8
322	484	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
323	318	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
324	395	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
325	316	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	48.5
326	452	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0
327	496	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
328	564	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
329	565	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.3
330	504	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
331	535	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
332	465	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
333	143	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	7.9
334	263	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
335	556	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
336	186	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	5.8
337	588	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
338	522	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
339	244	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
340	462	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.4
341	494	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
342	573	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
343	587	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
344	493	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.1
345	511	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
346	554	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
347	547	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.5
348	399	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
349	498	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.6
350	335	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0.6
351	453	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
352	421	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	2.3
353	541	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.7
354	505	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1
355	546	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0.6
356	543	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
357	341	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
358	383	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
359	508	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
360	517	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
361	560	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.9
362	413	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
363	540	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.5
364	525	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
365	443	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.9
366	285	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
367	518	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
368	408	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
369	352	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	1
370	402	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
371	386	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
372	536	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0
373	561	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
374	503	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
375	284	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.6
376	502	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
377	514	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
378	527	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
379	430	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.8
380	187	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	3.9
381	419	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
382	327	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.8
383	281	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	37
384	431	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.8
385	528	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
386	427	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
387	578	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
388	253	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	44.9
389	486	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
390	454	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
391	567	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
392	534	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	1.2
393	292	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	3.1
394	523	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
395	321	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
396	357	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	81.9
397	358	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	4.7
398	586	1	2025	0	0	0	0	0	0	0	0	0	1	0	-2	1	1.1
399	1	1	2025	394	2	14	30	2	0	0	0	0	0	0	38.8	1	99.7
400	11	1	2025	272	1	7	26	2	0	0	0	0	0	0	29.5	1	58.5
401	20	1	2025	218	1	12	48	2	0	0	0	0	0	0	29.5	1	87.9
402	14	1	2025	209	2	6	70	1	0	0	0	0	0	0	29.4	1	99.8
403	15	1	2025	318	3	7	32	0	0	0	0	0	0	0	27.9	1	93.3
404	2	1	2025	258	1	6	57	1	0	0	0	0	0	0	26	1	98.9
405	55	1	2025	244	4	1	-1	0	0	0	0	0	0	0	25.7	1	19.2
406	8	1	2025	152	0	14	62	2	0	0	0	0	0	0	24.3	1	99.7
407	24	1	2025	210	1	6	58	1	0	0	0	0	0	0	24.2	1	79
408	77	1	2025	298	1	6	21	1	0	0	0	0	0	0	24	1	21.6
409	209	1	2025	143	2	2	25	1	0	0	0	0	0	1	23.2	1	31.4
410	5	1	2025	167	3	5	39	0	0	0	0	0	0	0	22.6	1	96.6
411	69	1	2025	233	1	11	68	0	0	0	0	0	0	0	20.1	1	98.9
412	147	1	2025	277	2	5	17	0	0	0	0	0	0	2	18.8	1	78.7
413	39	1	2025	362	1	2	10	0	0	0	0	0	0	1	18.5	1	29
414	26	1	2025	163	2	7	38	0	0	0	0	0	0	0	18.3	1	90.5
415	10	1	2025	287	1	4	11	0	0	0	0	0	0	1	16.3	1	87
416	35	1	2025	188	2	3	4	0	0	0	0	0	0	0	15.9	1	77.3
417	188	1	2025	290	1	2	6	0	0	0	0	0	0	2	14.2	1	2.7
418	9	1	2025	245	1	4	-2	0	0	0	0	0	0	0	13.6	1	58.3
419	16	1	2025	225	1	1	-1	0	0	0	0	0	0	1	11.9	1	87.5
420	34	1	2025	214	0	4	29	0	0	0	0	0	0	0	11.5	1	6.3
421	27	1	2025	178	1	4	12	0	0	0	0	0	0	1	11.3	1	32.9
422	92	1	2025	168	0	8	44	0	0	0	0	0	0	0	11.1	1	4.4
423	47	1	2025	154	1	5	40	0	0	0	0	0	1	2	10.2	1	23.6
424	23	1	2025	188	0	5	32	0	0	0	0	0	0	1	9.7	1	65.6
425	19	1	2025	176	1	8	18	0	0	0	0	0	1	2	8.8	1	89.2
426	283	1	2025	113	1	2	3	0	0	0	0	0	0	0	8.8	1	77.3
427	7	1	2025	188	0	1	3	0	0	0	0	0	0	0	7.8	1	86.9
428	30	1	2025	114	1	1	7	0	0	0	0	0	1	2	7.3	1	27.5
429	22	1	2025	150	0	2	14	0	0	0	0	0	1	0	5.4	1	23
430	144	1	2025	112	0	0	0	0	0	0	0	0	1	0	2.5	1	14.9
431	447	1	2025	32	0	1	3	0	0	0	0	0	0	0	1.6	1	0.6
432	585	1	2025	0	0	1	1	0	0	0	0	0	0	0	0.1	1	1.4
433	457	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
434	563	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.5
435	63	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	3.8
436	497	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
437	418	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
438	251	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	5.6
439	152	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	46.3
440	477	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
441	469	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
442	442	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	6.1
443	438	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
444	225	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
445	372	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
446	463	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.2
447	555	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.9
448	581	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
449	480	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
450	539	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
451	479	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	3.6
452	73	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	8.9
453	583	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
454	380	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.5
455	151	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	4
456	471	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
457	582	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
458	79	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	6.2
459	482	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
460	66	1	2025	0	0	18	169	2	1	1	13	0	1	0	28.7	1	99.8
461	29	1	2025	0	0	12	24	0	7	6	100	1	0	0	21.4	1	99.8
462	12	1	2025	0	0	15	54	2	3	2	10	0	0	0	19.4	1	94.9
463	6	1	2025	0	0	22	69	0	10	9	73	0	0	0	18.7	1	99.8
464	17	1	2025	0	0	13	44	1	5	5	58	0	0	0	18.7	1	99.4
465	40	1	2025	0	0	16	143	0	3	3	13	0	0	0	17.1	1	92.2
466	38	1	2025	0	0	18	60	1	5	4	24	0	0	0	16.4	1	99.8
467	94	1	2025	0	0	16	57	0	5	3	32	1	0	0	16.4	1	95.9
468	71	1	2025	0	0	19	107	0	4	2	38	0	0	0	15.5	1	97.6
469	28	1	2025	0	0	7	55	0	4	3	20	1	0	0	15	1	99.7
470	276	1	2025	0	0	8	23	0	3	3	44	1	0	0	14.2	1	82.5
471	64	1	2025	0	0	10	82	1	1	0	0	0	0	0	14.2	1	74.3
472	43	1	2025	0	0	16	63	1	2	2	5	0	0	0	13.8	1	88.2
473	45	1	2025	0	0	19	66	1	1	1	4	0	0	0	13.5	1	99.7
474	33	1	2025	0	0	18	66	1	2	1	3	0	0	0	13.4	1	99.3
475	236	1	2025	0	0	12	29	0	8	8	64	0	0	0	13.3	1	21.4
476	146	1	2025	0	0	11	37	0	2	2	22	1	0	0	12.9	1	88
477	95	1	2025	0	0	11	45	1	2	2	12	0	0	0	12.7	1	98.4
478	56	1	2025	0	0	14	37	0	4	4	8	1	0	0	12.5	1	99.1
479	203	1	2025	0	0	12	39	0	4	4	5	1	0	0	12.4	1	55.7
480	138	1	2025	0	0	21	43	1	3	2	8	0	0	0	12.1	1	97.7
481	3	1	2025	0	0	18	71	0	3	3	27	0	0	0	11.3	1	99.6
482	44	1	2025	0	0	19	38	1	2	2	2	0	0	0	11	1	99.5
483	172	1	2025	0	0	12	47	1	0	0	0	0	0	0	10.7	1	76.5
484	21	1	2025	0	0	9	19	0	10	10	31	0	0	0	10	1	99.8
485	171	1	2025	0	0	5	27	0	6	6	24	0	0	0	8.1	1	90.2
486	123	1	2025	0	0	17	53	0	5	3	12	0	0	0	8	1	92.5
487	207	1	2025	0	0	8	69	0	1	1	6	0	0	0	8	1	63.2
488	72	1	2025	0	0	15	68	0	1	1	7	0	0	0	8	1	87
489	84	1	2025	0	0	18	60	0	1	1	29	0	1	0	7.4	1	91.7
490	161	1	2025	0	0	6	70	0	1	1	-1	0	0	0	7.4	1	81.3
491	323	1	2025	0	0	6	26	0	3	3	31	0	0	0	7.2	1	38.1
492	48	1	2025	0	0	15	48	0	2	2	13	0	0	0	7.1	1	98.7
493	294	1	2025	0	0	6	9	1	0	0	0	0	0	0	6.9	1	21.1
494	49	1	2025	0	0	11	25	0	4	4	18	0	0	0	6.3	1	95.3
495	371	1	2025	0	0	3	3	1	0	0	0	0	0	0	6.3	1	0.6
496	113	1	2025	0	0	13	60	0	1	0	0	0	0	0	6	1	69.6
497	280	1	2025	0	0	10	24	0	5	2	11	0	0	0	4.5	1	55.5
498	256	1	2025	0	0	0	0	0	2	2	32	0	0	0	4.2	1	0.9
499	308	1	2025	0	0	9	33	0	2	1	4	0	0	0	4.2	1	53.6
500	369	1	2025	0	0	12	41	0	0	0	0	0	0	0	4.1	1	3.6
501	58	1	2025	0	0	10	20	0	3	3	4	0	0	0	3.9	1	97.3
502	105	1	2025	0	0	7	19	0	4	3	4	0	0	0	3.8	1	47.2
503	190	1	2025	0	0	5	25	0	3	2	3	0	0	0	3.8	1	86.5
504	122	1	2025	0	0	7	15	0	3	2	12	0	0	0	3.7	1	72.6
505	134	1	2025	0	0	5	16	0	3	2	10	0	0	0	3.6	1	32.1
506	240	1	2025	0	0	4	53	0	1	1	-3	0	1	0	3.5	1	5.4
507	406	1	2025	0	0	3	26	0	0	0	0	0	0	0	2.6	1	5.6
508	93	1	2025	0	0	3	12	0	3	2	4	0	0	0	2.6	1	48.6
509	337	1	2025	0	0	0	0	0	6	2	16	0	0	0	2.6	1	0.7
510	264	1	2025	0	0	4	25	0	0	0	0	0	0	0	2.5	1	2.5
511	368	1	2025	0	0	2	24	0	2	0	0	0	0	0	2.4	1	1.1
512	206	1	2025	0	0	10	24	0	0	0	0	0	0	0	2.4	1	33.4
513	223	1	2025	0	0	5	24	0	0	0	0	0	0	0	2.4	1	19.9
514	245	1	2025	0	0	1	2	0	1	1	14	0	0	0	2.1	1	18.9
515	110	1	2025	0	0	2	14	0	1	1	2	0	0	0	2.1	1	69.1
516	59	1	2025	0	0	2	-3	0	2	2	12	0	0	0	1.9	1	95
517	319	1	2025	0	0	2	18	0	0	0	0	0	0	0	1.8	1	7.3
518	377	1	2025	0	0	0	0	0	2	2	6	0	0	0	1.6	1	1.2
519	387	1	2025	0	0	1	7	0	1	1	4	0	0	0	1.6	1	0.6
520	444	1	2025	0	0	2	9	0	2	2	17	0	1	0	1.6	1	0.6
521	332	1	2025	0	0	0	0	0	1	1	11	0	0	0	1.6	1	6.2
522	330	1	2025	0	0	1	5	0	1	1	5	0	0	0	1.5	1	12.5
523	458	1	2025	0	0	5	12	0	0	0	0	0	0	0	1.2	1	37.4
524	214	1	2025	0	0	3	11	0	0	0	0	0	0	0	1.1	1	44.8
525	271	1	2025	0	0	6	8	0	1	1	-3	0	0	0	1	1	28.5
526	382	1	2025	0	0	3	10	0	0	0	0	0	0	0	1	1	1.4
527	356	1	2025	0	0	3	9	0	0	0	0	0	0	0	0.9	1	3.4
528	472	1	2025	0	0	2	9	0	0	0	0	0	0	0	0.9	1	2
529	432	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	0
530	301	1	2025	0	0	2	4	0	1	1	-1	0	0	0	0.8	1	26.3
531	379	1	2025	0	0	3	8	0	0	0	0	0	0	0	0.8	1	1
532	385	1	2025	0	0	1	1	0	1	1	2	0	0	0	0.8	1	0.8
533	409	1	2025	0	0	1	2	0	1	1	-1	0	0	0	0.6	1	14.2
534	417	1	2025	0	0	0	0	0	2	1	1	0	0	0	0.6	1	0.6
535	478	1	2025	0	0	1	5	0	0	0	0	0	0	0	0.5	1	0.6
536	425	1	2025	0	0	3	5	0	1	0	0	0	0	0	0.5	1	3.1
537	305	1	2025	0	0	1	4	0	0	0	0	0	0	0	0.4	1	1.7
538	384	1	2025	0	0	1	4	0	0	0	0	0	0	0	0.4	1	4.5
539	148	1	2025	0	0	3	3	0	0	0	0	0	0	0	0.3	1	78.2
540	242	1	2025	0	0	1	3	0	1	0	0	0	0	0	0.3	1	1.4
541	414	1	2025	0	0	2	2	0	0	0	0	0	0	0	0.2	1	1.2
542	446	1	2025	0	0	1	2	0	0	0	0	0	0	0	0.2	1	9.2
543	524	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
544	282	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	46.3
545	545	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
546	481	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
547	363	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.8
548	521	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
549	516	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.9
550	483	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
551	325	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	14.5
552	433	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
553	429	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
554	552	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
555	557	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	5
556	500	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
557	440	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.6
558	416	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
559	65	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	90.8
560	551	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
561	268	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	5.1
562	510	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
563	467	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
564	290	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	59.3
565	548	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
566	509	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
567	435	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
568	423	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
569	449	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
570	489	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
571	529	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
572	314	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	12.7
573	579	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
574	574	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
575	517	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
576	464	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
577	342	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
578	542	1	2025	0	0	1	0	0	0	0	0	0	0	0	0	1	0
579	348	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.1
580	437	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	4.6
581	451	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	37.5
582	538	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	2.9
583	436	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
584	475	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	17.9
585	543	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
586	559	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
587	367	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
588	531	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1
589	515	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
590	366	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
591	333	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	2.4
592	434	1	2025	0	0	1	-2	0	0	0	0	0	0	0	-0.2	1	32.5
593	153	1	2025	0	0	2	-14	0	2	1	3	0	0	0	-0.6	1	21
594	62	1	2025	0	0	2	8	0	9	7	143	1	0	0	24.6	1	96.9
595	37	1	2025	0	0	0	0	0	7	5	79	2	0	0	22.4	1	66.9
596	18	1	2025	0	0	1	9	0	6	4	67	2	0	0	21.6	1	96.4
597	125	1	2025	0	0	0	0	0	11	8	112	1	0	0	21.2	1	74.3
598	36	1	2025	0	0	1	19	1	10	7	77	0	0	0	19.1	1	91.9
599	31	1	2025	0	0	0	0	0	9	7	95	1	0	0	19	1	98.7
600	4	1	2025	0	0	1	1	0	11	10	130	0	0	0	18.1	1	99.8
601	54	1	2025	0	0	0	0	0	8	6	80	1	0	0	17	1	84
602	57	1	2025	0	0	0	0	0	10	7	68	1	0	0	16.3	1	88.4
603	82	1	2025	0	0	0	0	0	6	5	71	1	0	0	15.6	1	97.2
604	46	1	2025	0	0	0	0	0	9	6	61	1	0	0	15.1	1	95
605	193	1	2025	0	0	0	0	0	6	4	70	1	0	0	15	1	9.5
606	116	1	2025	0	0	0	0	0	16	10	99	0	0	0	14.9	1	43
607	25	1	2025	0	0	0	0	0	13	9	124	0	1	0	14.9	1	99.4
608	198	1	2025	0	0	0	0	0	13	7	110	0	0	0	14.5	1	99.8
609	208	1	2025	0	0	0	0	0	8	5	52	1	0	0	13.7	1	21.2
610	135	1	2025	0	0	0	0	0	10	8	97	0	0	0	13.7	1	90.7
611	179	1	2025	0	0	0	0	0	8	6	103	0	0	0	13.3	1	7.4
612	50	1	2025	0	0	1	4	0	7	4	44	1	0	0	12.8	1	99.8
613	131	1	2025	0	0	0	0	0	7	4	108	0	0	0	12.8	1	86.6
614	42	1	2025	0	0	0	0	0	9	6	37	1	0	0	12.7	1	95
615	52	1	2025	0	0	0	0	0	3	2	54	1	0	0	12.4	1	54.6
616	309	1	2025	0	0	0	0	0	5	3	45	1	0	0	12	1	42.8
617	191	1	2025	0	0	0	0	0	2	2	35	1	0	0	10.5	1	9.7
618	150	1	2025	0	0	0	0	0	9	6	74	0	0	0	10.4	1	97
619	86	1	2025	0	0	0	0	0	7	4	83	0	0	0	10.3	1	97.3
620	97	1	2025	0	0	0	0	0	12	5	71	0	0	0	9.6	1	47.6
621	128	1	2025	0	0	0	0	0	15	8	55	0	0	0	9.5	1	99.2
622	104	1	2025	0	0	0	0	0	9	6	64	0	0	0	9.4	1	80.9
623	102	1	2025	0	0	0	0	0	9	5	68	0	0	0	9.3	1	94.6
624	218	1	2025	0	0	0	0	0	8	5	66	0	0	0	9.1	1	86.2
625	108	1	2025	0	0	0	0	0	13	7	54	0	0	0	8.9	1	90.3
626	89	1	2025	0	0	0	0	0	7	6	57	0	0	0	8.7	1	85.3
627	350	1	2025	0	0	0	0	0	1	1	22	1	0	0	8.7	1	0.1
628	237	1	2025	0	0	0	0	0	9	5	61	0	0	0	8.6	1	13.4
629	141	1	2025	0	0	1	9	1	7	1	11	0	0	0	8.5	1	98.1
630	117	1	2025	0	0	0	0	0	8	6	55	0	0	0	8.5	1	51.9
631	196	1	2025	0	0	0	0	0	5	5	55	0	0	0	8	1	7.3
632	267	1	2025	0	0	0	0	0	1	1	13	1	0	0	7.8	1	5.6
633	96	1	2025	0	0	0	0	0	4	2	68	0	0	0	7.8	1	38.2
634	219	1	2025	0	0	0	0	0	8	5	51	0	0	0	7.6	1	95.7
635	306	1	2025	0	0	0	0	0	3	3	59	0	0	0	7.4	1	1.2
636	222	1	2025	0	0	2	6	0	4	3	52	0	0	0	7.3	1	4.7
637	303	1	2025	0	0	1	4	0	7	2	-2	1	0	0	7.2	1	13
638	195	1	2025	0	0	3	8	0	5	3	68	0	1	0	7.1	1	89.4
639	53	1	2025	0	0	0	0	0	8	4	51	0	0	0	7.1	1	98.5
640	339	1	2025	0	0	0	0	0	5	3	51	0	0	0	6.6	1	1.5
641	13	1	2025	0	0	0	0	0	6	4	45	0	0	0	6.5	1	99.7
642	130	1	2025	0	0	0	0	0	6	4	44	0	0	0	6.4	1	40.1
643	83	1	2025	0	0	0	0	0	9	6	33	0	0	0	6.3	1	67.8
644	224	1	2025	0	0	0	0	0	8	6	33	0	0	0	6.3	1	87.6
645	249	1	2025	0	0	0	0	0	7	4	42	0	0	0	6.2	1	0.9
646	127	1	2025	0	0	0	0	0	6	4	40	0	0	0	6	1	59
647	311	1	2025	0	0	0	0	0	4	2	45	0	0	0	5.5	1	7.2
648	178	1	2025	0	0	0	0	0	6	3	39	0	0	0	5.4	1	2.6
649	85	1	2025	0	0	0	0	0	4	2	41	0	0	0	5.1	1	12.1
650	60	1	2025	0	0	0	0	0	5	4	30	0	0	0	5	1	94.1
651	362	1	2025	0	0	0	0	0	6	3	33	0	0	0	4.8	1	0
652	173	1	2025	0	0	0	0	0	4	3	33	0	0	0	4.8	1	96.8
653	170	1	2025	0	0	0	0	0	8	4	27	0	0	0	4.7	1	74.7
654	177	1	2025	0	0	1	3	0	5	4	23	0	0	0	4.6	1	91.9
655	201	1	2025	0	0	1	5	0	2	2	30	0	0	0	4.5	1	0.6
656	32	1	2025	0	0	0	0	0	4	3	30	0	0	0	4.5	1	96.8
657	241	1	2025	0	0	0	0	0	3	2	32	0	0	0	4.2	1	22.4
658	398	1	2025	0	0	0	0	0	1	1	36	0	0	0	4.1	1	1
659	246	1	2025	0	0	0	0	0	3	1	36	0	0	0	4.1	1	6.3
660	354	1	2025	0	0	0	0	0	2	2	31	0	0	0	4.1	1	1.1
661	279	1	2025	0	0	0	0	0	4	3	26	0	0	0	4.1	1	2.4
662	61	1	2025	0	0	0	0	0	5	3	25	0	0	0	4	1	99.6
663	278	1	2025	0	0	0	0	0	2	2	30	0	0	0	4	1	3.5
664	238	1	2025	0	0	1	9	0	5	2	20	0	0	0	3.9	1	29.7
665	355	1	2025	0	0	0	0	0	1	1	34	0	0	0	3.9	1	0
666	200	1	2025	0	0	2	9	0	2	2	18	0	0	0	3.7	1	10.8
667	390	1	2025	0	0	0	0	0	3	2	27	0	0	0	3.7	1	1
668	259	1	2025	0	0	0	0	0	4	2	27	0	0	0	3.7	1	94.7
669	394	1	2025	0	0	0	0	0	2	2	27	0	0	0	3.7	1	1.8
670	41	1	2025	0	0	0	0	0	5	2	26	0	0	0	3.6	1	99.7
671	216	1	2025	0	0	0	0	0	3	1	28	0	0	0	3.3	1	2.1
672	288	1	2025	0	0	0	0	0	2	2	21	0	0	0	3.1	1	2.5
673	109	1	2025	0	0	0	0	0	3	3	16	0	0	0	3.1	1	92.9
674	351	1	2025	0	0	0	0	0	1	1	23	0	0	0	2.8	1	3.6
675	343	1	2025	0	0	0	0	0	3	2	18	0	0	0	2.8	1	1.6
676	250	1	2025	0	0	0	0	0	2	2	16	0	0	0	2.6	1	74.4
677	293	1	2025	0	0	0	0	0	3	2	16	0	0	0	2.6	1	0.6
678	229	1	2025	0	0	0	0	0	5	2	16	0	0	0	2.6	1	76.1
679	184	1	2025	0	0	0	0	0	3	2	15	0	0	0	2.5	1	77.9
680	304	1	2025	0	0	0	0	0	7	3	10	0	0	0	2.5	1	16
681	159	1	2025	0	0	0	0	0	7	2	13	0	0	0	2.3	1	42.5
682	215	1	2025	0	0	0	0	0	3	2	12	0	0	0	2.2	1	54.5
683	217	1	2025	0	0	0	0	0	6	2	11	0	0	0	2.1	1	1.7
684	359	1	2025	0	0	0	0	0	1	0	0	0	0	0	2	1	13.4
685	243	1	2025	0	0	0	0	0	4	2	10	0	0	0	2	1	26.2
686	322	1	2025	0	0	0	0	0	2	1	13	0	0	0	1.8	1	0.6
687	420	1	2025	0	0	0	0	0	1	1	12	0	0	0	1.7	1	3.8
688	299	1	2025	0	0	0	0	0	2	1	11	0	0	0	1.6	1	0.9
689	376	1	2025	0	0	0	0	0	1	1	11	0	0	0	1.6	1	6.9
690	274	1	2025	0	0	1	8	0	1	1	3	0	0	0	1.6	1	0.6
691	328	1	2025	0	0	1	15	0	0	0	0	0	0	0	1.5	1	0
692	422	1	2025	0	0	0	0	0	2	1	9	0	0	0	1.4	1	0.1
693	169	1	2025	0	0	0	0	0	1	1	8	0	0	0	1.3	1	99.2
694	455	1	2025	0	0	0	0	0	1	1	8	0	0	0	1.3	1	0
695	317	1	2025	0	0	0	0	0	2	1	7	0	0	0	1.2	1	2
696	393	1	2025	0	0	0	0	0	2	1	7	0	0	0	1.2	1	1.5
697	370	1	2025	0	0	0	0	0	1	1	6	0	0	0	1.1	1	0.7
698	289	1	2025	0	0	0	0	0	4	1	5	0	0	0	1	1	4.1
699	275	1	2025	0	0	0	0	0	1	1	5	0	0	0	1	1	11.3
700	364	1	2025	0	0	1	9	0	1	0	0	0	0	0	0.9	1	1.3
701	374	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	0.6
702	230	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	1.5
703	403	1	2025	0	0	0	0	0	1	1	3	0	0	0	0.8	1	0
704	261	1	2025	0	0	0	0	0	2	1	3	0	0	0	0.8	1	0.9
705	189	1	2025	0	0	0	0	0	4	3	12	0	1	0	0.7	1	36.6
706	365	1	2025	0	0	0	0	0	1	1	1	0	0	0	0.6	1	0.7
707	297	1	2025	0	0	1	5	0	0	0	0	0	0	0	0.5	1	1.1
708	273	1	2025	0	0	0	0	0	2	1	0	0	0	0	0.5	1	7.1
709	584	1	2025	0	0	1	3	0	0	0	0	0	0	0	0.3	1	0.6
710	312	1	2025	0	0	0	0	0	1	1	-2	0	0	0	0.3	1	0.8
711	255	1	2025	0	0	0	0	0	1	1	-3	0	0	0	0.2	1	14.7
712	577	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
713	239	1	2025	0	0	1	0	0	1	0	0	0	0	0	0	1	96
714	410	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
715	576	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
716	199	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.9
717	227	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	84.8
718	460	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
719	401	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.8
720	484	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
721	318	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
722	395	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
723	316	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	48.5
724	452	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0
725	496	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
726	564	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
727	565	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.3
728	504	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
729	535	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
730	465	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
731	143	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	7.9
732	263	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.6
733	556	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
734	186	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	5.8
735	588	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
736	522	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
737	244	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
738	462	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.4
739	494	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
740	573	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
741	587	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
742	493	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.1
743	511	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
744	554	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
745	547	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.5
746	399	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.7
747	498	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.6
748	335	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0.6
749	453	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
750	421	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	2.3
751	541	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.7
752	505	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1
753	546	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0.6
754	543	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
755	341	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
756	383	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
757	508	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
758	517	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
759	560	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.9
760	413	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
761	540	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.5
762	525	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
763	443	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.9
764	285	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
765	518	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
766	408	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
767	352	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	1
768	402	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
769	386	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
770	536	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0
771	561	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
772	503	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
773	284	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.6
774	502	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
775	514	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
776	527	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
777	430	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.8
778	187	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	3.9
779	419	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
780	327	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0.8
781	281	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	37
782	431	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.8
783	528	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
784	427	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
785	578	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
786	253	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	44.9
787	486	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
788	454	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
789	567	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
790	534	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	1.2
791	292	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	3.1
792	523	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
793	321	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.1
794	357	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	81.9
795	358	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	4.7
796	586	1	2025	0	0	0	0	0	0	0	0	0	1	0	-2	1	1.1
797	70	1	2025	0	0	0	0	0	4	4	48	1	0	0	12.8	1	85.6
798	176	1	2025	0	0	0	0	0	8	5	103	0	0	0	12.8	1	99
799	101	1	2025	0	0	0	0	0	4	2	47	1	0	0	11.7	1	96.8
800	139	1	2025	0	0	0	0	0	11	8	76	0	0	0	11.6	1	46.9
801	78	1	2025	0	0	1	3	0	9	7	76	0	0	0	11.4	1	96.2
802	124	1	2025	0	0	0	0	0	9	6	79	0	0	0	10.9	1	98.6
803	270	1	2025	0	0	0	0	0	5	4	26	1	0	0	10.6	1	3.3
804	326	1	2025	0	0	0	0	0	4	4	25	1	0	0	10.5	1	96.9
805	160	1	2025	0	0	0	0	0	5	3	26	1	0	0	10.1	1	72.5
806	174	1	2025	0	0	1	3	0	9	7	63	0	0	0	10.1	1	34.5
807	254	1	2025	0	0	0	0	0	6	5	15	1	0	0	10	1	38.1
808	156	1	2025	0	0	0	0	0	8	7	59	0	0	0	9.4	1	67.4
809	98	1	2025	0	0	0	0	0	9	6	61	0	0	0	9.1	1	99.7
810	118	1	2025	0	0	0	0	0	3	3	15	1	0	0	9	1	5.7
811	129	1	2025	0	0	1	3	0	4	2	16	1	0	0	8.9	1	88.9
812	87	1	2025	0	0	0	0	0	8	4	66	0	0	0	8.6	1	70
813	114	1	2025	0	0	0	0	0	7	7	44	0	0	0	7.9	1	76.6
814	197	1	2025	0	0	0	0	0	4	4	59	0	0	0	7.9	1	41.9
815	260	1	2025	0	0	0	0	0	2	1	13	1	0	0	7.8	1	0.6
816	258	1	2025	0	0	0	0	0	1	1	6	1	0	0	7.1	1	0
817	320	1	2025	0	0	1	2	0	2	2	50	0	0	0	6.2	1	1.1
818	360	1	2025	0	0	0	0	0	4	4	38	0	0	0	5.8	1	1.7
819	163	1	2025	0	0	0	0	0	6	3	37	0	0	0	5.2	1	81.6
820	51	1	2025	0	0	0	0	0	6	5	23	0	0	0	4.8	1	86.4
821	204	1	2025	0	0	0	0	0	5	3	28	0	0	0	4.3	1	23.4
822	334	1	2025	0	0	0	0	0	3	3	28	0	0	0	4.3	1	8.2
823	397	1	2025	0	0	0	0	0	4	4	22	0	0	0	4.2	1	0.6
824	291	1	2025	0	0	0	0	0	3	2	27	0	0	0	3.7	1	2.8
825	248	1	2025	0	0	0	0	0	4	1	31	0	0	0	3.6	1	3.9
826	247	1	2025	0	0	0	0	0	4	3	21	0	0	0	3.6	1	64.2
827	228	1	2025	0	0	0	0	0	4	3	19	0	0	0	3.4	1	22.2
828	300	1	2025	0	0	0	0	0	1	1	29	0	0	0	3.4	1	0.6
829	353	1	2025	0	0	0	0	0	2	2	20	0	0	0	3	1	1.2
830	361	1	2025	0	0	0	0	0	4	2	20	0	0	0	3	1	1
831	194	1	2025	0	0	0	0	0	4	3	15	0	0	0	3	1	93.1
832	272	1	2025	0	0	0	0	0	2	2	16	0	0	0	2.6	1	0.7
833	202	1	2025	0	0	0	0	0	1	1	20	0	0	0	2.5	1	13.9
834	400	1	2025	0	0	0	0	0	1	1	20	0	0	0	2.5	1	0.6
835	407	1	2025	0	0	0	0	0	1	1	18	0	0	0	2.3	1	0.7
836	381	1	2025	0	0	0	0	0	2	2	12	0	0	0	2.2	1	29.9
837	287	1	2025	0	0	0	0	0	2	1	16	0	0	0	2.1	1	0.6
838	338	1	2025	0	0	0	0	0	0	0	0	0	0	0	2	1	0.6
839	331	1	2025	0	0	0	0	0	3	1	14	0	0	0	1.9	1	3.9
840	310	1	2025	0	0	0	0	0	1	1	14	0	0	0	1.9	1	0.6
841	411	1	2025	0	0	0	0	0	1	1	10	0	0	0	1.5	1	0
842	298	1	2025	0	0	0	0	0	1	1	10	0	0	0	1.5	1	0.6
843	307	1	2025	0	0	0	0	0	1	1	7	0	0	0	1.2	1	3.2
844	426	1	2025	0	0	0	0	0	2	1	6	0	0	0	1.1	1	1.8
845	162	1	2025	0	0	0	0	0	1	1	5	0	0	0	1	1	87
846	286	1	2025	0	0	0	0	0	1	1	5	0	0	0	1	1	0.7
847	265	1	2025	0	0	0	0	0	1	1	5	0	0	0	1	1	0.7
848	164	1	2025	0	0	0	0	0	3	1	5	0	0	0	1	1	8.8
849	373	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	1.1
850	313	1	2025	0	0	0	0	0	1	1	4	0	0	0	0.9	1	0.6
851	336	1	2025	0	0	0	0	0	2	1	3	0	0	0	0.8	1	0.6
852	389	1	2025	0	0	0	0	0	1	1	3	0	0	0	0.8	1	1.5
853	115	1	2025	0	0	1	2	0	2	1	0	0	0	0	0.7	1	1.9
854	349	1	2025	0	0	0	0	0	1	1	2	0	0	0	0.7	1	0
855	252	1	2025	0	0	0	0	0	1	1	2	0	0	0	0.7	1	4.1
856	445	1	2025	0	0	0	0	0	1	1	1	0	0	0	0.6	1	1.2
857	485	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
858	537	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.4
859	450	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
860	499	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
861	388	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.9
862	367	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
863	392	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
864	497	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
865	470	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
866	549	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
867	571	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
868	461	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1
869	468	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
870	489	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
871	558	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
872	506	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.2
873	412	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
874	552	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
875	474	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0
876	510	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
877	566	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
878	526	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
879	553	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
880	315	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	2.4
881	448	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
882	548	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
883	580	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
884	512	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
885	262	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
886	530	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
887	550	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
888	501	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
889	560	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.9
890	491	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	3.9
891	520	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
892	441	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	20.1
893	378	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
894	396	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
895	572	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1
896	424	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.7
897	277	1	2025	0	0	0	0	0	3	0	0	0	0	0	0	1	11.3
898	269	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.6
899	329	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
900	487	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
901	575	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
902	473	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1
903	507	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
904	404	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0.6
905	532	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.2
906	568	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
907	456	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
908	488	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1
909	544	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
910	324	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	1
911	428	1	2025	0	0	0	0	0	1	0	0	0	0	0	0	1	0
912	476	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	8.1
913	439	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.8
914	492	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
915	375	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
916	513	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	1.2
917	570	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
918	405	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0.1
919	490	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	1.1
920	495	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	2.3
921	459	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	0
922	185	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	60.9
923	340	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	1	3.2
924	533	1	2025	0	0	0	0	0	0	0	0	0	0	0	0	0	0
925	466	1	2025	0	0	0	0	0	2	2	-6	0	1	0	-1.6	1	0.6
\.


--
-- Name: player_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fantasy_user
--

SELECT pg_catalog.setval('public.player_info_id_seq', 588, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fantasy_user
--

SELECT pg_catalog.setval('public.players_id_seq', 1, false);


--
-- Name: weekly_stats_qb_flex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fantasy_user
--

SELECT pg_catalog.setval('public.weekly_stats_qb_flex_id_seq', 925, true);


--
-- Name: player_info player_info_pkey; Type: CONSTRAINT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.player_info
    ADD CONSTRAINT player_info_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: player_info uq_player_name_team; Type: CONSTRAINT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.player_info
    ADD CONSTRAINT uq_player_name_team UNIQUE (name, team);


--
-- Name: weekly_stats_qb_flex weekly_stats_qb_flex_pkey; Type: CONSTRAINT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.weekly_stats_qb_flex
    ADD CONSTRAINT weekly_stats_qb_flex_pkey PRIMARY KEY (id);


--
-- Name: ix_player_info_id; Type: INDEX; Schema: public; Owner: fantasy_user
--

CREATE INDEX ix_player_info_id ON public.player_info USING btree (id);


--
-- Name: ix_players_id; Type: INDEX; Schema: public; Owner: fantasy_user
--

CREATE INDEX ix_players_id ON public.players USING btree (id);


--
-- Name: ix_weekly_stats_qb_flex_id; Type: INDEX; Schema: public; Owner: fantasy_user
--

CREATE INDEX ix_weekly_stats_qb_flex_id ON public.weekly_stats_qb_flex USING btree (id);


--
-- Name: weekly_stats_qb_flex weekly_stats_qb_flex_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fantasy_user
--

ALTER TABLE ONLY public.weekly_stats_qb_flex
    ADD CONSTRAINT weekly_stats_qb_flex_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player_info(id);


--
-- PostgreSQL database dump complete
--

\unrestrict Dy6Pfxm4kew5eWYnShXMj1KAOkVOnceREDmpeRy7KvMmJ5MCsSfSPcDmDAn7LY7

