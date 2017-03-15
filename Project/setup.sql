create table Øvelse(
	navn 					varchar(20) 	not null,
	beskrivelse				varchar(50) 	not null,
	type					varchar(20) 	not null,
	muskelgruppe			varchar(20) 	not null,	
	primary key (Navn)
	);
	
create table Treningsøkt(
	dato 					int 			not null, 
	startstidspunkt 		int 			not null, 
	varighet 				int 			not null, 
	notat 					varchar(50) 	not null, 
	form 					int 			not null, 
	prestasjon 				int 			not null, 
	HarAktivitet 			varchar(20) 	not null, 
	Værtype 				varchar(20), 
	temperatur 				int, 
	ventilasjonskvalitet 	varchar(20), 
	tilskuere 				varchar(20), 
	
	primary key (dato, startstidspunkt)
	);
		
create table PlanlagtØvelse(
	dato 					int 			not null,
	startstidspunkt 		int 			not null,
	øvnavn 					varchar(20) 	not null,
	sett 					int,
	rep 					int,
	belastning 				int,
	varighet 				int,
	lengde 					int,
	
	primary key (dato, startstidspunkt, øvnavn),
	foreign key (dato, startstidspunkt) references Treningsøkt(dato, startstidspunkt)
		on update cascade,
	foreign key (øvnavn) references Øvelse(navn)
		on update cascade
		on delete no action
	);
	
create table ResultatØvelse(
	dato 					int 			not null,
	startstidspunkt 		int 			not null,
	øvnavn 					varchar(20) 	not null,
	sett 					int,
	rep 					int,
	belastning 				int,
	varighet 				int,
	lengde 					int,
	
	primary key (dato, startstidspunkt, øvnavn),
	foreign key (dato, startstidspunkt) references Treningsøkt(dato, startstidspunkt)
		on update cascade,
	foreign key (øvnavn) references Øvelse(navn)
		on update cascade
		on delete no action
	);
	
create table LiknendeØvelser(
	øvnavn1 				varchar(20) 	not null,
	øvnavn2 				varchar(20) 	not null,
	
	primary key (øvnavn1, øvnavn2),
	foreign key (øvnavn1) references Øvelse(navn)
		on update cascade,
	foreign key (øvnavn2) references Øvelse(navn)
		on update cascade
	);
	
create table Treningsmal(
	navn 					varchar(20) 	not null,
	dato 					int 			not null,
	startstidspunkt 		int 			not null, 
	
	primary key (navn),
	foreign key (dato, startstidspunkt) references Treningsøkt(dato, startstidspunkt)
		on update cascade
	);