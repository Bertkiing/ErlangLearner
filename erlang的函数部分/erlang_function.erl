-module(erlang_function).
-compile(export_all). %%
-export([greet/2]).

greet(male,Name) ->
io:format("Hello,Mr.~s~n",[Name]);
greet(female,Name) ->
io:format("Hello,Mrs.~s~n",[Name]);
greet(_,Name) ->
io:format("Hello,~s~n",[Name]).

%%获取列表的头
head([H|_]) -> H.
%%获取列表的第二个元素
second([_|[S]]) -> head([S]).

%%比较是否相等
same(X,X) -> true;
same(_,_) -> false.
%%当你调用same(a,a)时，第一个X被当作未绑定的：它自动绑定值a。
%%然后，当Erlang看到第二个参数的时候，它发现X已经被绑定了。

%%Erlang决定用第二个参数a去进行比较，看它们是否相等。 模式匹配成功，然后函数返回true。
%%如果两个值不相同的时候，这个函数分句将失败，Erlang将尝试第二个函数分句， 
%%而第二个函数分句根本不关心传入的参数（当这是你最后的选择，你就别挑剔了！）直接返回false。