-module(testModule1).
-export([divFun/2,equal/2]).


divFun(X,Y) ->
X / Y.

equal(X,Y) ->
    X =:= Y.