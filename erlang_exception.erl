-module(erlang_exception).
-export([generate_exception/1,test/0,test_catch/0]).

generate_exception(1) -> a;
generate_exception(2) -> throw(a); % exception throw:
generate_exception(3) -> exit(a);  % exception exit;
generate_exception(4) -> {'EXIT',a};
generate_exception(5) ->error(a).  % exception error;

%% 异常处理
test() -> [catcher(I) || I <- [1,2,3,4,5]] .

%% 用catch捕捉异常错误
test_catch() ->
        [{I,(catch generate_exception(I))}|| I <- [1,2,3,4,5]].


%% try...catch块捕捉异常错误
catcher(N) ->
    try generate_exception(N) of
        Val -> {N,normal,Val}
    catch
         throw:X->{N,caught,thrown,X};
        exit:X ->{N,caught,exited,X};
        error:X -> {N,caught,error,X}     
    end.