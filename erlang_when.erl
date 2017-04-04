%% 逗号(",")扮演着and,also的角色;
%% 分号(";")扮演着or,else的角色;

-module(erlang_when).
-export([right_age/1]).

right_age(Age) when Age >= 16, Age =< 104 ->
true;
right_age(_) ->
    false.