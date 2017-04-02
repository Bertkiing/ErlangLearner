
%% 元组用{}来创建
%% 一旦元组创建之后，元组项的个数就不能再变化了。本质上来讲：元组就是原子

%% case 是另外一种Erlang中的判断结构

-module(tut3).
-export([convert_length/1]).

convert_length(Length) ->
    case Length of
         {centimeter,X} ->
             {inch,X/2.54};
             {inch,Y} ->
                 {centimeter,Y * 2.54}  
    end.

