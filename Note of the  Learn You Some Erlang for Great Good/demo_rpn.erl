
% %% 逆波兰式(RPN)计算器
%%%  操作符跟在操作数后面
-module(demo_rpn).
-export([rpn/1]).

rpn(L)  when is_list(L) ->
[Res] = lists:foldl(fun rpn/2,[],string:tokens(L," ")),Res.



rpn("+",[N1,N2|S]) -> [N1+N2|S];
rpn("-",[N1,N2|S]) -> [N2-N1|S];
rpn("*",[N1,N2|S]) -> [N2*N1|S];
rpn("/",[N1,N2|S]) -> [N2/N1|S];
rpn("^",[N1,N2|S]) -> [math:pow(N2,N1)|S];
rpn("ln",[N|S]) -> [math:log(N)|S];
rpn("log10",[N|S]) -> [math:log10(N)|S];

rpn(X,Stack) ->
[read(X) | Stack].

read(N) ->
    case string:to_float(N) of
    {error,no_float} -> list_to_integer(N);
    {F,_} -> F             
end.