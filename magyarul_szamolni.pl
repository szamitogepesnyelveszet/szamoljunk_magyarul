/* Szóképző szabályok */

/*
  * Nemterminálisból terminális szimbólum
  * 1..99
  */
szam(X) --> d1(X).
szam(X) --> d2(X).
szam(X) --> d(X).
szam(X) --> t1(X).
szam(X) --> t(X).
szam(X) --> t2(Y),d1(Z), { X is Y + Z }.
szam(X) --> t2(Y),d2(Z), { X is Y + Z }.
szam(X) --> t2(Y),d(Z), { X is Y + Z }.
szam(X) --> t(Y),d1(Z), { X is Y + Z }.
szam(X) --> t(Y),d2(Z), { X is Y + Z }.
szam(X) --> t(Y),d(Z), { X is Y + Z }.


/* Nemterminálisból nemterminális szimbólum */
egytol_szaz(X) --> szam(X).
szaztol_ezer(X) --> egytol_szaz(X).
szaztol_ezer(X) --> szaz(X).

/*
 * Nemterminálisból terminális
 * 100...1000
 */
szaz(X) --> sz(X).
szaz(X) --> sz(Y),egytol_szaz(Z), { X is Y + Z }. 
szaz(X) --> d3(Y),sz(Z), { X is Y * Z }.
szaz(X) --> d3(Y),sz(Z),egytol_szaz(Q), { X is Y * Z + Q }.
szaz(X) --> d(Y),sz(Z), { X is Y * Z }.
szaz(X) --> d(Y), sz(Z), egytol_szaz(Q), { X is Y * Z + Q }.
szaz(X) --> e(X).

/* Kiinduló állapota */
szamok(X) --> szaztol_ezer(X).

/* Aritmetikai szabályok */

osszeadas(X) --> szamok(Y), [meg], szamok(Z), {X is Y + Z}.
kivonas(X) --> szamok(Y), [ből], szamok(Z), { X is Y - Z }.
szorzas(X) --> szamok(Y), [szer], szamok(Z), { X is Y * Z}.

/* Szótár */

d1(1) --> [egy].
d2(2) --> [kettő].
d3(2) --> [két].
d(3) --> [három].
d(4) --> [négy].
d(5) --> [öt].
d(6) --> [hat].
d(7) --> [hét].
d(8) --> [nyolc].
d(9) --> [kilenc].
t1(10) --> [tíz].
t1(20) --> [húsz].
t(30) --> [harminc].
t(40) --> [negyven].
t(50) --> [ötven].
t(60) --> [hatvan].
t(70) --> [hetven].
t(80) --> [nyolcvan].
t(90) --> [kilencven].
t2(10) --> [tizen].
t2(20) --> [huszon].
sz(100) --> [száz].
e(1000) --> [ezer].

/* Példafuttatás:
?- szamok(Érték,Magyarul,[]).
Érték = 1,
Magyarul = [egy];
*/
