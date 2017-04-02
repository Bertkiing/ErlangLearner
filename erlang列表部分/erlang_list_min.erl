-module(erlang_list_min).
-export([list_min/1]).

list_min([Head|Rest]) ->
    list_min(Rest,Head).

%% 分别处理 3种情形
list_min([],Min) ->
    Min;
list_min([First|Rest],Min) when min<First ->
    list_min(Rest,Min);
list_min([Head|Rest],Min) ->
    list_min(Rest,Min).






