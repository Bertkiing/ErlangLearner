-module(functions_list).
-author("Bertking").
-compile([export_all,debug_info]).

head([H|_]) -> H.

second([_,X|_]) -> X.

third([_,_,X|_]) -> X.

fourth([_,_,_,X|_]) -> X.

% 当列表的元素数量达到了数千个时，这种方法就不太现实啦。
%  要想处理这种情况，更聪明的方法肯定是《递归函数》

same(X,X) ->
true;
same(_,_) ->
false.

%% when X > 16 是 《卫语句》 是附加在函数头中的语句，能够让模式匹配更具表达力
%% 模式匹配存在一定的限制，它不能表达《取值范围》 or 《特定数据类型》 之类的东西。
%%  在卫表达式中，逗号(,)的作用和操作符andalso类似，分号(;)和orelse类似。
old_enough(X)  when X > 16 ->
true;
old_enough(_) -> false.

right_age(X) when X >= 16,X =< 100 ->
true;
right_age(_) -> false.

say_hello(X,Name) when X =:= 0 ;X ==  male;X == "Male"   ->
io:format("Hello,Mrs. ~s!~n",[Name]).