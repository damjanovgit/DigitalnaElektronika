# DigitalnaElektronika

U slučaju da ne možete pristupiti repozitoijumu zbog toga što vam lozinka nije prihvaćena prilikom pokušaja git push komande potrebno je da generišete svoj token i koristite ga umjesto lozinke.

Tutorijal kako to da uradite možete pogledati [ovdje](https://catalyst.zoho.com/help/tutorials/githubbot/generate-access-token.html)

Repozitorijum za vježbe iz digitalne elektronike je mjesto na kojem se čuvaju VHDL fajlovi i testbenchevi sa vježbi koje se odvijaju u okviru predmeta Digitalna elektronika. Ovaj repozitorijum omogućava studentima pristup kodu i testovima, kao i rad na istom.

Studenti mogu preuzeti fajlove iz repozitorijuma i raditi na njima lokalno, nakon čega mogu postaviti izmijenjene fajlove nazad na repozitorijum. Takođe, repozitorijum omogućava saradnju između studenata, tako da mogu raditi zajedno na istim fajlovima i međusobno dijeliti izmjene.

U repozitorijumu je potrebno da se nalazi direktorijum za svaku vježbu, u kojem se nalaze svi potrebni VHDL fajlovi i testbenchevi za tu vježbu. Studenti mogu preuzeti direktorijum za određenu vježbu, raditi na njoj lokalno, a zatim postaviti izmjene na repozitorijum. To omogućava efikasno i organizovano upravljanje kodom i testovima za vježbe iz Digitalne elektronike.

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
    `git push origin <ime_grane>`
12) `git checkout main`
13) `git pull`
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

Promjena sa neke grane na neku drugu, već postojeću radi se sa komandom `git checkout markomarkovic_grana_vjezba_1234` (koristi se ako grana markomarkovic_grana_vjezba_1234 već postoji)

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

GHDL (G Hardware Description Language) je alat za sintezu i simulaciju VHDL (VHSIC Hardware Description Language) koda. VHDL je programski jezik koji se koristi za opis hardvera u digitalnim sistemima i koristi se za projektovanje integrisanih kola (ICs), FPGA-ova, mikrokontrolera i drugih digitalnih komponenti.

GHDL omogućuje sintezu VHDL koda u logički ekvivalentan hardver, što omogućuje stvarno testiranje dizajna prije implementacije na IC-u ili FPGA-u. GHDL se može koristiti kao samostalni alat ili integrisati s drugim alatima, npr. sintetizatorima.

GHDL također omogućuje simulaciju VHDL koda, što omogućuje testiranje funkcionalnosti dizajna. To je posebno korisno u ranoj fazi razvoja kada je teško testirati dizajn na fizičkom hardveru.

Prednosti GHDL-a uključuju:

1) Mogućnost sinteze VHDL koda u hardver
2) Integracija s drugim alatima poput sintetizatora
3) Mogućnost simulacije VHDL koda
4) Automatsko generisanje testbenčeva za simulaciju
5) Podrška za veliki broj VHDL funkcija i tipova podataka

GHDL je alat za sintezu i simulaciju VHDL koda koji omogućuje testiranje dizajna prije implementacije na fizičkom hardveru i olakšava razvoj digitalnih sustava.

## Komande da bi se pokrenuo testbench pisan u GHDL-u
    
Da bi se pokrenuo VHDL kod i testbench u GHDL-u, potrebno je izvršiti sljedeće korake:
    
1) Instalirati GHDL

2) Napisati VHDL kod: Obratite pažnju na to da kod mora biti ispravna VHDL sintaksa. VHDL kod bi trebao biti sačuvan sa ekstenzijom ".vhdl".

3) Napisati testbench: Testbench je poseban kod koji se koristi za testiranje VHDL koda. Testbench obično uključuje generisanje ulaznih signala, simulaciju i provjeru izlaznih signala. Testbench bi trebao biti sačuvan sa ekstenzijom "_tb.vhdl".

4) Kompajlirati VHDL kod i testbench: Kompilacija VHDL koda i testbencha uključuje stvaranje objektnih datoteka iz koda. Ovaj korak se obično izvršava s naredbom "ghdl -a <ime_datoteke>.vhdl". Na primjer, ako se VHDL kod nalazi u datoteci "test_kod.vhdl", naredba za kompilaciju bi bila "ghdl -a test_kod.vhdl". Ovaj korak bi trebao generisati objektne datoteke sa ekstenzijom ".o".

5) Kreiranje izvrše datoteke: Nakon kompilacije VHDL koda i testbencha, sljedeći korak je stvaranje izvršne datoteke. Ovaj korak se obično izvršava s naredbom "ghdl -e <ime_entiteta>". Entitet je glavni dio VHDL koda i naredba će stvoriti izvršnu datoteku s imenom entiteta.

6) Pokretanje simulacije: Kada je izvršna datoteka izrađena, moguće je pokrenuti simulaciju VHDL koda i testbencha. Ovo se obično izvršava s naredbom "ghdl -r <ime_entiteta> --vcd=<ime_datoteke>.vcd". Ova naredba će pokrenuti simulaciju, generisati VCD (Value Change Dump) datoteku koja sadrži vrijednosti signala tokom simulacije, a koja se može koristiti za vizualizaciju i analizu signala.

7) Analiza rezultata: Nakon završetka simulacije, moguće je analizirati VCD datoteku da bi se provjerila ispravnost dizajna i da li je li testbench ispravno generisao ulazne signale.

Flag --timeout u GHDL-u se koristi za postavljanje vremenskog ograničenja za simulaciju. Ovaj flag nam omogućava da navođenje koliko vremena simulacija može da traje prije nego što se automatski prekine. Njegova sintaksa izgleda ovako:
    
`ghdl --timeout=<vrijeme> <ime_test_benča>`
    
Vrijeme se navodi u sekundama, na primjer 10ns za 10 nano sekundi, 10s za 10 sekundi ili 2m za 2 minute. Ako simulacija ne uspije da se završi unutar postavljenog vremena, GHDL će automatski prekinuti simulaciju.

Flag --assertion-level se koristi za podešavanje nivoa provjere asercija tokom simulacije. Asercije su tvrdnje koje je dizajner postavio u kodu kako bi provjerio da li se sistem ponaša ispravno. Ovaj flag omogućava da se navede koliko agresivne provjere želimo da se izvrše, pri čemu su veći nivoi provjere agresivniji i mogu otkriti više grešaka. Njegova sintaksa izgleda ovako:
 
`ghdl --assertion-level=<nivo> <ime_test_benča>`

## Vizuelizacija rezultata simulacije
    
Gtkwave je besplatan alat za vizualizaciju i analizu signala iz vremenskih simulacija. Omogućava korisnicima da detaljno istraže signale generisane u vremenskoj simulaciji i da pronađu uzroke problema u dizajnu.

Da bi se koristio Gtkwave za vizualizaciju signala iz vremenskih simulacija, prvo je potrebno generisati VCD (Value Change Dump) fajl tokom simulacije. VCD fajl sadrži sve promjene signala tokom simulacije, zajedno sa vremenom kada se promjene događaju.

Kada je generisan VCD fajl, otvara se Gtkwave i bira "Open" opcija iz "File" menija. U dijalogu koji se pojavljuje, bira se željeni VCD fajl.

Nakon otvaranja fajla, u prozoru će se prikazati svi signali koji su generisani tokom simulacije. Moguće je birati koje signale prikazati i kojim bojama. Moguće je i  zumirati i pomijerati se kroz vremenski interval kako bi se detaljno proučile promjene signala.

Gtkwave takođe omogućava da se dodaju različite vrste analiza signala, kao što su FFT (Fast Fourier Transform) i korelacija signala. Ove analize mogu pomoći da se  pronađe uzroke problema u dizajnu.

Ukratko, Gtkwave je moćan alat za vizualizaciju i analizu signala iz vremenskih simulacija. Koristi se za proučavanje signala iz VHDL simulacija i pomaže u pronalaženju uzroka problema u dizajnu.
    
# CMAKE
    
CMake je alat za upravljanje konfiguracijom i kompilacijom softvera koji se koristi za generisanje konfiguracijskih datoteka, koje opisuju proces kompilacije softverskog projekta. To znači da CMake omogućuje automatsku izgradnju i konfiguraciju projekata na različitim operativnim sistemima i platformama.

CMake se sastoji od dva dijela - CMake skripte koje opisuju kompilaciju projekta i CMake generatora koji generiše datoteke za kompilaciju na osnovu CMake skripti. CMake se često koristi u projektima koji koriste više programskih jezika i biblioteka, što ga čini vrlo fleksibilnim.

CMake koristi jednostavan i intuitivan skriptovski jezik koji se lako uči i koristi. U CMake skriptama definiše se izvorni kod projekta, ciljni operativni sistemi i platforme, potrebne vanjske biblioteke i drugi parametri koji su važni za kompilaciju projekta. CMake generator zatim generiše datoteke za izgradnju, poput Makefile-a, Visual Studio projekata, Xcode projekata i drugih datoteka.

Prednosti CMake-a uključuju:

1) Jednostavnost korištenja i prilagodljivost
2) Mogućnost generisanja datoteka za kompilaciju na različitim operativnim sistemima i platformama
3) Automatsko otkrivanje vanjskih biblioteka i njihova integracija u projekat
4) Paralelna kompilacija projekta, što skraćuje vrijeme kompilacije

Evo primjera CMake skripte koja bi trebala da kompajlira VHDL fajlove pokrene testove pomoću GHDL-a:
    
```

cmake_minimum_required(VERSION 3.12)


project(half_adder)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/half_adder.vhdl
    ${CMAKE_CURRENT_SOURCE_DIR}/half_adder_tb.vhdl
)

add_library(${PROJECT_NAME} SHARED ${SOURCES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ghdl-gcc ARGS -a ${SOURCES}
    COMMAND ghdl-gcc -e half_adder_tb
)

add_test(
    NAME ${PROJECT_NAME}_test
    COMMAND ./half_adder_tb
)

set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)

```
    
Pretpostavimo da se nalazimo u root direktorijumu projekta, gdje se nalazi i CMakeLists.txt fajl.
Koraci za pokretanje testova su sljedeći:
1) Kreiranje direktorijuma za build:
    
    `mkdir build`
    
    `cd build`
2) Pokretanje CMake komande za generisanje Makefile-a:
    `cmake ..`
3) Kompilacija koda pomoću Makefile-a:
    `cmake --build .`
4) Pokretanje testova:
    `ctest -C Release`
    
**Primjer iz damjanp direktorijuma će raditi samo na Linuks operativnom sistemu sa CMake-om i ovo je potrebno podesiti radi automatskog izvršenja testova na repozitorijumu.**
Da biste instalirali ghdl na Linux operativnom sistemu dovoljno je u terminalu unijeti: sudo apt-get install ghdl-gcc
