domains
x=string
database
xpositiv(x)
xnegativ(x)
otvety(x,x)
predicates
invest(x)
positiv(x)
negativ(x) 
ask(x,x)
remember(x,x)
write_result(x)
w_r(x)
clauses
invest("Sur.oil"):-		negativ ("P/E"), 
							positiv ("P/S"),
							positiv ("P/BV"), 
							negativ ("EV/EBITDA"), 
							positiv ("Dept/EBITDA").
invest("Tant.oil"):- 		positiv ("P/E"), 
							negativ ("P/S"),
							positiv ("P/BV"), 
							negativ ("EV/EBITDA"), 
							positiv ("Dept/EBITDA").
invest("Bashneft"):-			positiv ("P/E"), 
							negativ ("P/S"),
							negativ ("P/BV"), 
							negativ ("EV/EBITDA"), 
							positiv ("Dept/EBITDA").
invest("Transneft"):-	negativ ("P/E"), 
							positiv ("P/S"),
							positiv ("P/BV"), 
							positiv ("EV/EBITDA"), 
							positiv ("Dept/EBITDA").
invest("Rosneft"):-	positiv ("P/E"), 
							negativ ("P/S"),
							positiv ("P/BV"), 
							negativ ("EV/EBITDA"), 
							negativ ("Dept/EBITDA").
invest("DLukoil"):-		negativ("P/E"), 
							positiv ("P/S"),
							positiv ("P/BV"), 
							positiv ("EV/EBITDA"), 
							positiv ("Dept/EBITDA").
positiv(X):-xpositiv(X),!;
xnegativ(X),!,fail;
ask(X,"YES"),!;
xpositiv(X),!.
negativ(X):-xnegativ(X),!;
xpositiv(X),!,fail;
ask(X,"NO"),!;
xnegativ(X),!.
ask(X,R):-write(X,":"),readln(Reply),remember(X,Reply),R=Reply.
remember(X,"YES"):-assert(xpositiv(X)),assert(otvety(X,"YES")),!.
remember(X,"NO"):-assert(xnegativ(X)),assert(otvety(X,"NO")),!.
write_result(X):-w_r(X).
w_r(X):-nl,nl,write("Buy",X),
nl,write("Because:"),!,otvety(X1,X2),nl,write(X1,"->",X2),fail.
goal
clearwindow,retractall(_),!,invest(X),write_result(X).
