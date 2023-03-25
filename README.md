# DigitalnaElektronika

Repozitorijum na kome se postavljaju vježbe iz predmeta Digitalna elektronika.

# Radni tok, GIT komande

### TL;DR
1) `git clone https://github.com/damjanovgit/DigitalnaElektronika` ---- **SAMO JEDNOM**
2) `git checkout -b markomarkovic_grana_vjezba_1234` ----- **NOVA GRANA ZA SVAKU VJEŽBU**
3) `cd DigitalnaElektronika`
4) `mkdir markom1101_11` ----- **OVAJ DIREKTORIJUM SE PRAVI SAMO JEDNOM**
5) `cd markom1101_11`
6) `mkdir vjezbaN`
8) rad na vježbi
9) `git add --all`
10) `git commit -m "Dodajem .vhdl fajlove i testbench za vježbu N"`
11) `git push`
    `git push origin <ime_grane> 
12) `git checkout main
13) `git pull
14) `git checkout markomarkovic_grana_vjezba_1234`
15) `git merge main`
16) U slučaju da postoje konflikti, rještiti ih tako da fajl u konfliktu ima sadržaj i grane na koju se radi spajanje i grane sa koje se radi spajanje. Po izvršenim izmjenama ponoviti korake od tačke 9) do tačke 16). Ovo ponavljati sve dok nastaju konflikti.
17) Izrada "Pull request-a" da se nova grana spoji sa "main" granom
18) Dodati Damjana u review koda
19) U slučaju pada testova ponoviti sve korake počevši od stavke 8), prilagoditi kod tako da testovi prolaze

### Radni tok

Za git postoji mnogo aplikacija koje na vizelni način omogućavaju manipulaciju repozitorijum ali ipak, sa gitom se uglavnom radi iz terminala / konzole.

Da bi se pokrenula konzola (powerShell), na windowsu, potrebno je zadržati shift taster, a zatim na prazan prostor pritisnuti desni klik mišom. Biće ponuđena opcija "Open PowerShell window here".

![image](https://user-images.githubusercontent.com/45741417/227647736-b5087b78-d55f-4581-a69c-3ff9925a04b0.png)

Za rad na repozitorijumu potrebno ga je klonirati.
Kloniranje se radi sa git clone komandom prilikom čega se sadržaj sa git servera kopira lokalno, na računar.
Ova komanda prima link do repozitorijuma koji se želi klonirati (kopirati)
`git clone https://github.com/damjanovgit/DigitalnaElektronika`

Po kloniranju repozitorijuma potrebno je navigirati iz terminala u novonastali direktorijum (folder).
Navigiranje kroz stablo direktorijuma se radi naredbom `cd` - change directory

**KLONIRANJE REPOZITORIJUMA SE RADI SAMO PRVI PUT, NAKON TOGA REPOZITORIJUM OSTAJE NA RAČUNARU DOK SE NE OBRIŠE**

Za početak, potrebno je napraviti sopstvenu granu na kojoj se radi svaka vježba. Grana na gitu omogućava paralelan rad više ljudi na istom projektu. Izrada nove grane stvara novi tok razvoja projekta koji može tokom rada da odstupa od glavne grane. Glavna grana se naziva "main" i na toj se grani nalazi lokalni repozitorijum koji se prvi put klonira. Da bi se napravila nova grana, koristi se komanda:
`git checkout -b markomarkovic_grana_vjezba_1234`

Ovdje je "markomarkovic_grana_vjezba_1234" ime grane koja se pravi. U komandi se nalazi "-b" fleg koji govori da se pravi nova grana.

Promjena sa neke grane na neku drugu, već postojeću radi se sa komandom `git checkout markomarkovic_grana_vjezba_1234` (koristi se ako grana markomarkovic_grana_vjezba_1234)

Kada se napravi grana, u diretkorijumu DigitalnaElektronika napraviti novi direktorijum (folder) pod vašim imenom, markom1101_11. Ime se pravi prema šablonu ime, prvo slovo prezimena i broj indeksa na kraju.

Nakon toga u tom direktorijumu se pravi novi poddirektorijum koji nosi ime vjezbaN, pri čemu je N broj vježbe koja se izrađuje, npr. vjezba1.
U okviru tog direktorijuma će se nalaziti fajlovi traženi u vježbi.

Kada je vježba urađena, svi fajlovi se treba da se dodaju u tzv. "stagging area", tj. priprema fajlova za prenos na server jer se oni trenutno nalaze samo lokalno na računaru. 

Dodavanje fajlova u stagging zonu se radi komandom:
`git add putanja_do_fajla_koji_se_dodaje`

Ukoliko je potrebno dodati sve fajlove, to se radi izvršavanjem komande:
`git add --all`
ili komande
`git add .`

Iz stagging zone fajlovi se pakuju u "komite". Komit je jedinstven paket koji se može poslati na server.
Da bi se napravio jedan komit koristi se komanda:
`git commit -m "Ovdje se unosi poruka koja sadrži kratak informativni tekst o fajlovima koji se komituju"`

Nakon izrtade komita, on može da se pošalje na server i time unesene izmjene postaju vidljive svim korisnicima repozitorijuma.
Ovo se postiže komandom:
`git push`

Ukoliko na serveru, na grani na koju se "pushuje", se nalaze izmjene koje se ne nalaze na lokalnom repozitorijumu (repozitorijumu na računaru), push neće proći. Potrebno je poravnati lokalni repozitorijum za repozitorijumom na serveru. Ovo se postiže komandom koja povlači sve najnovije izmjene sa git servera i to:
`git pull`

Nakon toga moguće je pushovati kod na git server bez grešaka.

Nakon što je vježba urađena i stvari postavljene na server na granu koja je napravljena za tu vježbu, šptrebno je spojiti to sa glavnom granom. Spajanje sa glavnom granom se radi tako što se prvo uradi promjena grane na "main" granu komandom:
`git checkout main`
Zatim se povuku najnovije izmjene sa te grane komandom:
`git pull`
Po povlačenju najnovijih izmjena vraća se na granu koja se spaja sa develop granom sa:
`git checkout markomarkovic_grana_vjezba_1234`
Zatim se spaja sadržaj "main" grane sa granom "markomarkovic_grana_vjezba_1234" korištenjem komande:
`git merge main`
U ovom koraku može nastati konflikt, al to se neće uvijek dešavati. Fajlovi u kojima nastaje konflikt se moraju ručno pregledati i prilagoditi tako da imaju sadržaj obje grane. Prilikom poziva komande merge, biće ispisana lista fajlova u kojima je nastao konflikt. Po razrješavanju svih konflikata, navedene izmjene se dodaju na granu sa `git add --all` ,zatim `git commit -m "Rješenje konflikta"` i onda `git push`

Tek sada je nova grana spremna da bude spojena sa glavnom granom. Spajanje sa glavnom granom se vrši tako što se napravi "Pull Request".

![image](https://user-images.githubusercontent.com/45741417/227655498-f97fa96a-63c8-4953-8353-e89226ea141c.png)

Klikom na dugme "Create new pull request" dobija se novi prozor u kome se bira koja grana se spaja sa kojom. 

![image](https://user-images.githubusercontent.com/45741417/227655588-d822d640-c25a-4e83-9e19-d5729b7eef41.png)

Zatim je potrebno kliknuti na "Create pull request" i dodati Damjana za pregled (review) koda koji se nalazi na novoj grani (možete dodati i nekog od kolega ako želite da kolega pregleda vaš kod).

![image](https://user-images.githubusercontent.com/45741417/227655755-971c762f-42e4-46b1-8151-52be7da0eb7d.png)

Kolege koje su dodane u review su u **OBAVEZI** da kod pregledaju i odobre ga ili da ga odbiju.
Kada su svi odobrili pull request (PR), pokreću se testovi i ako testovi uspješno prođu vježba je završena.
Ukoliko testovi padnu, potrebno je vratiti se na granu i izmjeniti kod tako da testovi prolaze, napraviti novi "Pull request" ponoviti prethodnu proceduru.

## Kako riješiti konflikt

Konflikti se mogu pojaviti kada se izmjene na jednoj grani ne podudaraju sa izmjenama na drugoj grani u koju se pokušavaju spojiti. U tom slučaju, Git će prijaviti konflikt i neće automatski spojiti grane.

Kako bi se konflikt riješio, potrebno je:
1) Pregledati konflikt: Prvi korak je pregledati datoteke u kojima se pojavio konflikt. Git će označiti mjesta gdje se nalaze razlike između izmjena.
2) Riješiti konflikt: Nakon pregleda konflikta, potrebno je izvršiti izmjene u datotekama i riješiti konflikt. To obično znači da treba izbrisati jednu verziju i zadržati drugu, ili spojiti dvije verzije na način koji odgovara tvom cilju.
3) Dodati datoteke za commit: Nakon rješavanja konflikta, potrebno je dodati datoteke za commit naredbom git add <naziv-datoteke>
4) Commit izmjena: Nakon dodavanja datoteka za commit, potrebno je izvršiti commit izmjena naredbom git commit -m "<opis-izmjena>"
5) Push izmjena: Nakon izvršenog commit-a, potrebno je push-ati izmjene na Git repozitorijum naredbom git push origin <ime-tvoje-grane>.
6) Ponoviti proces pull request-a: Nakon pushanja izmjena na tvoju granu, potrebno je ponoviti proces pull request-a na servisu, kojim se traži da se izmjene spoje sa glavnom granom.
    
U slučaju složenijih konflikata, može biti potrebno komunicirati sa kolegama i zajedno pronaći rješenje.
    
## Korisne komande

`git status` - Provjerava trenutni status, crvenim slovima ispisuje fajlove koji se mogu dodati u stagging zonu da bi se formirao komit.

`git branch` - Ispisuje trenutnu granu na kojoj se lokalni repozitorijum nalazi


# GHDL

# CMAKE
    
CMake je alat za upravljanje konfiguracijom i izgradnjom softvera koji se koristi za generisanje konfiguracijskih datoteka, koje opisuju proces kompilacije softverskog projekta. To znači da CMake omogućuje automatsku izgradnju i konfiguraciju projekata na različitim operativnim sistemima i platformama.

CMake se sastoji od dva dijela - CMake skripte koje opisuju kompilaciju projekta i CMake generatora koji generiše datoteke za kompilaciju na osnovu CMake skripti. CMake se često koristi u projektima koji koriste više programskih jezika i biblioteka, što ga čini vrlo fleksibilnim.

CMake koristi jednostavan i intuitivan skriptovski jezik koji se lako uči i koristi. U CMake skriptama definiše se izvorni kod projekta, ciljni operativni sistemi i platforme, potrebne vanjske biblioteke i drugi parametri koji su važni za kompilaciju projekta. CMake generator zatim generiše datoteke za izgradnju, poput Makefile-a, Visual Studio projekata, Xcode projekata i drugih datoteka.

Prednosti CMake-a uključuju:

1) Jednostavnost korištenja i prilagodljivost
2) Mogućnost generisanja datoteka za kompilaciju na različitim operativnim sistemima i platformama
3) Automatsko otkrivanje vanjskih biblioteka i njihova integracija u projekat
4) Paralelna kompilacija projekta, što skraćuje vrijeme kompilacije
 
 ## TL;DR
 CMake je alat za upravljanje konfiguracijom i kompilacijom softvera koji olakšava proces kompilacije projekata na različitim platformama i operativnim sistemima.
   

