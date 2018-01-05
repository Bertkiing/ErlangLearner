-module(useless).
-export([add/2,hello/0,area/1]).

-define (PI,3.14).


add(A,B) ->
    A + B.

hello()  ->
    io:format("Hello,world ~n").

%% 在模块中引用自身的宏，必须加？，否则无法使用
%% 函数的参数必须是大写字母开头。
area(R)  ->
?PI * R*R .
