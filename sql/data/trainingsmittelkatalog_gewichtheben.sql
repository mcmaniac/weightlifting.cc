-- vim: ts=8 noexpandtab

\encoding UTF8

CREATE SCHEMA IF NOT EXISTS data;

--
-- CLEAN UP
--

DROP TABLE IF EXISTS data.TrainingsmittelkatalogGewichthebenBVDG;
DROP TABLE IF EXISTS data.TrainingsmittelkatalogGewichthebenBVDG_Categories;

--
-- LAYOUT DEFINITION
--

-- Main categories
CREATE TABLE data.TrainingsmittelkatalogGewichthebenBVDG_Categories
( id                SERIAL
, nr                TEXT        NOT NULL
, name              TEXT        NOT NULL
, PRIMARY KEY (id)
);

-- All exercises
CREATE TABLE data.TrainingsmittelkatalogGewichthebenBVDG
( id                SERIAL
, nr                INTEGER     NOT NULL
, grp               INTEGER
, name              TEXT        NOT NULL
, train_vmax        TEXT
, train_regroup     TEXT
, train_fix         TEXT
, target_acc        BOOLEAN     DEFAULT FALSE
, target_min        INTEGER
, target_max        INTEGER
, target_reps       INTEGER
, max_wo_mhg        INTEGER

, PRIMARY KEY (id)
, FOREIGN KEY (grp) REFERENCES data.TrainingsmittelkatalogGewichthebenBVDG_Categories (id)
);

--
-- CONTENT
--

COPY data.TrainingsmittelkatalogGewichthebenBVDG_Categories
( id
, nr
, name
) FROM STDIN;
0001	K1	WKÜ
0002	K2	TWKÜ
0003	K3	SKF
0004	K4	MKF Beschl.
0005	K5	MKF Brems.
0006	K6	MKF Umgr.
0007	K7	Übungskombinationen
0008	K8	AMKT-1 (lastorientiert)
0009	K9	AMKT-2
0010	K10	viels. Athlet. Ausb.
\.

COPY data.TrainingsmittelkatalogGewichthebenBVDG
( nr
, grp
, name
, train_vmax
, train_regroup
, train_fix
, target_acc
, target_min
, target_max
, target_reps
, max_wo_mhg
) FROM STDIN;
0001	0001	Reißen (WKÜ)*	SKF	BF	     (MKF)	TRUE	99	101	\N	86
0002	0001	Reißen mit Bänder (WKÜ)	SKF	BF	     (MKF)	FALSE	\N	102	\N	88
0003	0001	Stoßen (WKÜ)*	SKF	BF	     (MKF)	TRUE	98	100	\N	84
0004	0001	Umsetzen*	SKF	BF	     (MKF)	TRUE	\N	102	\N	86
0005	0001	Ausstoßen*	SKF	BF	     (MKF)	TRUE	104	\N	\N	88
0006	0002	Reißen erhöhte Position	\N	SKF-BF-KF	     (MKF)	FALSE	102	\N	\N	88
0007	0002	Standreißen (halbe Hocke)	(SKF)	SKF-BF-KF	     (MKF)	FALSE	90	\N	\N	75
0008	0002	Umgruppieren breit	\N	SKF-BF-KF	     (MKF)	FALSE	80	\N	\N	65
0009	0002	Umsetzen erhöhte Position	\N	SKF-BF-KF	     (MKF)	FALSE	102	\N	\N	88
0010	0002	Standumsetzen*	(SKF)	SKF-BF-KF	     (MKF)	TRUE	85	\N	\N	75
0011	0002	Umgruppieren eng	\N	SKF-BF-KF	     (MKF)	FALSE	80	\N	\N	65
0012	0002	Standstoßen*	(SKF)	SKF-BF-KF	     (MKF)	TRUE	104	\N	\N	88
0013	0003	Zug breit*	SKF	\N	     \N	TRUE	108	\N	\N	94
0014	0003	Zug eng*	SKF	\N	     \N	TRUE	105	\N	\N	94
0015	0004	Lastheben breit*	MKF	\N	     \N	TRUE	130	\N	\N	115
0016	0004	Lastheben eng*	MKF	\N	     \N	TRUE	125	\N	\N	110
0017	0004	Anstoßkniebeuge	MKF	\N	     \N	FALSE	140	\N	\N	125
0018	0005	Reißkniebeuge*	\N	\N	     MKF	TRUE	110	\N	\N	100
0019	0005	Kniebeuge vorn*	\N	\N	     MKF	TRUE	105	\N	3	94
0020	0005	Kniebeuge hinten*	\N	\N	     MKF	TRUE	120	\N	3	102
0021	0005	Halbkniebeuge	\N	\N	     MKF	FALSE	150	\N	\N	130
0022	0006	Powerzug breit*	\N	MKF	     \N	TRUE	90	\N	\N	82
0023	0006	Kraftreißen	(SKF)	MKF	     \N	FALSE	80	\N	\N	70
0024	0006	Powerzug eng*	\N	MKF	     \N	TRUE	80	\N	\N	72
0025	0006	Kraftdrücken*	\N	MKF	     \N	TRUE	60	\N	\N	52
0026	0006	Schwungdrücken	\N	MKF	     \N	FALSE	85	\N	\N	75
0027	0007	Umsetzen + Kniebeuge v.	\N	SKF-BF(-MKF)	     \N	FALSE	100	\N	\N	88
0028	0007	Standumsetzen + Standst.	\N	SKF-BF	     \N	FALSE	85	\N	\N	72
0029	0007	Kniebeuge v. + Ausstoßen	\N	SKF-BF	     \N	FALSE	100	\N	\N	90
0030	0008	Nackendrücken	\N	SKF-BF	     \N	FALSE	70	\N	\N	\N
0031	0008	Bankdrücken	\N	MKF für Oberkörper	     \N	FALSE	\N	\N	\N	\N
0032	0008	Beugestütz	\N	MKF für Oberkörper	     \N	FALSE	50	\N	\N	\N
0033	0008	Klimmzug	\N	MKF für Oberkörper	     \N	FALSE	\N	\N	\N	\N
0034	0008	Beindrücken Herkules	\N	MKF für Beine	     \N	FALSE	\N	\N	\N	\N
0035	0008	Beindrücken im Liegen	\N	MKF für Beine	     \N	FALSE	\N	\N	\N	\N
0036	0008	Zug im Liegen	\N	MKF für Rumpf	     \N	FALSE	\N	\N	\N	\N
0037	0008	Bauchmuskel	\N	MKF für Rumpf	     \N	FALSE	\N	\N	\N	\N
0038	0008	Rückenmuskel	\N	MKF für Rumpf	     \N	FALSE	\N	\N	\N	\N
0039	0009	Beinbeuger-Maschine	\N	\N	     \N	FALSE	\N	\N	\N	\N
0040	0009	Gesäß-Maschine	\N	\N	     \N	FALSE	\N	\N	\N	\N
0041	0009	Rücken-Maschine	\N	\N	     \N	FALSE	\N	\N	\N	\N
0042	0009	Latissimus-Maschine	\N	\N	     \N	FALSE	\N	\N	\N	\N
0043	0009	Delta-Maschine	\N	\N	     \N	FALSE	\N	\N	\N	\N
0044	0009	Beinstrecker-Maschine	\N	\N	     \N	FALSE	\N	\N	\N	\N
0045	0009	Weitere AMKT-Übungen	\N	\N	     \N	FALSE	\N	\N	\N	\N
0050	0010	Ballspiele	\N	\N	     \N	FALSE	\N	\N	\N	\N
0051	0010	Gymnastik/Turnen	\N	\N	     \N	FALSE	\N	\N	\N	\N
0052	0010	Langstreckenlauf	\N	\N	     \N	FALSE	\N	\N	\N	\N
0053	0010	Touristik (Ski, Rad)	\N	\N	     \N	FALSE	\N	\N	\N	\N
0054	0010	Sprint (30-100m)	\N	\N	     \N	FALSE	\N	\N	\N	\N
0055	0010	Schlussweitsprung	\N	\N	     \N	FALSE	\N	\N	\N	\N
0056	0010	Schlussdreisprung	\N	\N	     \N	FALSE	\N	\N	\N	\N
0057	0010	Rundgewichtsschocken	\N	\N	     \N	FALSE	\N	\N	\N	\N
0058	0010	Hinderniskreis	\N	\N	     \N	FALSE	\N	\N	\N	\N
\.
