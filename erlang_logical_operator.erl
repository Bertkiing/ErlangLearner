-module(erlang_logical_operator).
-export([test/0]).

test() when (1+1 /= 2)==false ->
    io:format("Result:~w~n",[false]).



