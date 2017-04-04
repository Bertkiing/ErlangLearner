%%在Erlang中，我们会发现很容易丢掉 true分支。

%% 丢掉true分支将会把事情搞得一塌糊涂。

-module(erlang_if).
-export([h_fine/0,oh_god/1,test_animal/1]).

h_fine() ->
    if 1=:=1 ->
        works
        end,
    if 1=:=2; 1=:=1 ->
        works
        end,
    if 1=:=2,1 =:=1 ->
        fails
    end.

    oh_god(N) ->
    if N =:= 2 -> might_succeed;
    true -> always_does %% this is Erlang's if's else!
end.

%%---------------
test_animal(Animal) ->
Take = if Animal == cat  -> "meow";
          Animal == beef -> "mooo";
          Animal == dog -> "bark";
        Animal == tree -> "bark";
        true -> "nononon"
        end,
        {Animal,"says "++ Take ++"!"}.