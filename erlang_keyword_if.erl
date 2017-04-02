-module(erlang_keyword_if).
-export([test_if/2]).

test_if(A,B) ->
    if
        A == 5 ->
            io:format("A = 5~n",[]), a_equals_5;
        B == 6 ->
        io:format("B = 6~n",[]), b_equals_6;
        A == 2, B == 3 -> %% A == 2 并且 B == 3
            io:format("A == 2,B == 3~n",[]), 
        a_equals_2_and_b_equals_3;
        A == 1;B == 7 -> %% A == 2 或者 B == 7
            io:format("A == 1;B ==7 ~n",[]),
            a_equals_1_or_b_equals_7
    end .