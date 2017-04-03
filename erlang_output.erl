%% io:format/2 :该方法的参数是两个列表.第一个列表通常写在""之间，作为输出的标准，
%%  其中的~w是会被第二个列表中的元素所取代。~n表示另起一行。

-module(erlang_output).
-export([output/0]).

output() ->
    io:format("Erlang outputs ~w ~w~n",[hello,world]).