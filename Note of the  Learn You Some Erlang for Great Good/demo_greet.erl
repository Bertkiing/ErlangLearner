%% 根据性别来打招呼
-module(demo_greet).
-export([greet/2]).

greet(male,Name) ->
io:format("Hi,Mr. ~s~n",[Name]);
greet(female,Name) ->
io:format("Hi,Mrs. ~s~n",[Name]);
greet(_,Name) ->
    io:format("Hi, ~s~n",[Name]). 