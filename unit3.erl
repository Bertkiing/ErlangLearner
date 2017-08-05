-module(unit3).
-author("Bertking").
-export([greet/2,switch/1]).
-compile([debug_info,export_all]).

greet(male,Name) ->
io:format("Hello,Mr.~s~n",[Name]);
greet(female,Name)->
io:format("Hello,Mrs,~s~n",[Name]);
%% greet(Female,Name)->
%   io:format("Hello,Mrs,~s",[Name]);    

greet(_,Name)->
io:format("Hello,~s~n",[Name]).

switch(1) ->
io:format("~p~n",[1]);
switch(2)->
io:format("~p~n",[2]);
switch(_)->
    io:format("~s~n",[<<"Other Number">>]).