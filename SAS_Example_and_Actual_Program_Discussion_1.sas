LIBNAME NCSU '/home/u424592';

PROC IMPORT DATAFILE = '/home/u424592/cheese.csv'
	DBMS = CSV
	OUT = NCSU.calories;
	GETNAMES = YES;
RUN;

DATA subcalories;
	SET NCSU.calories;
	DROP date;
	IF MISSING(lactic) THEN DELETE;
	total = h2s + lactic;
RUN;

PROC SORT DATA = subcalories OUT = NCSU.sortcalories;
	BY lactic;
RUN;

PROC PRINT DATA = NCSU.sortcalories;
RUN;
