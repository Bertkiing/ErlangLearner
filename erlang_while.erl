-module(erlang_while).
-export([start/1,newTest/1]).

while(L) -> while(L,0).

while([],Var) -> Var;
while([_|T],Var) ->
    io:format("~w~n",[Var]),
while(T,Var+1).

start(List) ->
while(List).

%% ------------------------------

newWhile(L) -> newWhile(L,0).

newWhile([],Var) -> Var;
newWhile([First|End],Var) ->
    io:format("~w~n",[First]),
newWhile(End,First).

newTest(List) ->
    newWhile(List).