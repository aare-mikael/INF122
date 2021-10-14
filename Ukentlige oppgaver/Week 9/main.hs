-- Oppgave A: 

-- Vi ønsker en funksjon:

-- gRep::(t->Bool)->t->[t]->[t]

-- slik at gRep pr y xs erstatter med y, ethvert element x fra listen xs som tilfredstiller predikatet pr. F.eks.:

-- gRep (<’d’) ’z’ ‘‘abcd’’ = ‘‘zzzd’’
-- gRep (==’a’) ’x’ ‘‘abcbcac’’ = ‘‘xbcbcxc’’.

-- Gi en definisjon av gRep ved å bruke map, og en annen uten map.

-- TODO A



-- Oppgave B:

-- putBoard = putBoard' 1

-- putBoard' r [] = return ()
-- putBoard' r (n:ns) = do 
--  putRow r n
--  putBoard' (r+1) ns

-- TODO B



-- Oppgave C:

-- Utvid funksjonen play :: Board -> Int -> IO (), fra “Game of nim” i boken, s.132, slik at:
-- Hver kommando fra brukeren består av to tall — ikke kun enkle siffer — skrevet i en linje, 
-- som betegner radnummer etterfulgt av antall stjerner som skal fjernes.

-- TODO C



-- Oppgave D:

-- Utvid programmet fra Oppgave B slik at dersom det første tallet er 0, så utføres operasjon “Tilbake”;
-- dvs. spillet trekkes et trekk tilbake. Dette kan gjentas helt til man kommer tilbake til spillets start.

-- TODO D



-- Oppgave E:

-- Utvid programmet fra Oppgave C med en mulighet til å skrive tilstanden til en fil, 
-- og deretter hente den fra en fil for å fortsette spillet (f.eks., etter at man hadde avsluttet programmet og starter det på nytt).

-- TODO E



--  Oppgave F:

-- Bonusoppgave for spesialinteresserte:
-- Gjør nødvendige endringer for å utvide programmet slik at brukeren spiller mot maskinen 
-- og kan skrive tilstanden til en fil, hente den derfra, gjøre om ett (eller flere trekk) eller avslutte spillet. 
-- Ved oppstart oppgir brukeren antall rader det skal spilles på.

-- I første omgang, start med noen triviell strategi og bare sørg for grensesnittet og riktig fremvisning av maskinens trekk. 
-- Deretter kan du fordype deg i mulige, og optimale, strategier for nim og implementere en slik. (Du kan f.eks. bruke Wikpedia-artikkelen https://en.wikipedia.org/wiki/Nim .)

-- TODO F


