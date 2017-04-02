%% 可以使用lists:reverse(List)来反转List


-module(erlang_list_reverse).
-export([reverse/1]).

reverse(List) ->
    reverse(List,[]).

reverse([Head|Rest],Reversed_List) ->
reverse(Rest,[Head|Reversed_List]); %% 将其添加到Reversed_List列表中
reverse([],Reversed_List) ->
Reversed_List.

%%具体思路：
%%  首先从一个空列表[]开始，我们首先获取现有列表的头元素，放入到Reversed_list中。
%% reverse([1,2,3],[]) =>
%% reverse([2,3],[1|[]]) =>
%% reverse([2|3],[1]) =>
%% reverse([3],[2|[1]]) =>
%% reverse([3|[]],[2,1]) =>
%% reverse([],[3|[2,1]]) =>
%% [3,2,1]
