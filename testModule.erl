-module(testModule).
-export([add/2,hello/0,greet_and_addTwo/1]).
-import(io,[format/1]).
-compile([debug_info,export_all]).

%% 定义Erlang的宏
-define(HOUR,3600).
-define(sub(X,Y),X-Y).

-author("Bertking").

add(A,B)  ->
A + B.

%% 显示欢迎语
hello() ->
format("Hello,Erlang! ~n").

greet_and_addTwo(X) ->
    hello(),
add(X,3).

divFun(X,Y) ->
X / Y.

equal(X,Y) ->
X =:= Y.

unEqual(X,Y) ->
X =/= Y.

output() ->
    ?HOUR,
    ?sub(5,3).