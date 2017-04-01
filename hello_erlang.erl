%%% Erlang的第一步 ----Hello,world
-module(hello_erlang).
-export([sayHello/0,
        sayHello_withNextLine/0,
        say2Body/1,
        say2Body_withNextLine/1,
        say2all/0
    ]).
  
%% io:format() 是Erlang的标准输出函数。其功能类似于:
%% C 中的print()
%% C++ 中的cout<<
%% Java 中的 System.out.print()
%% Python 中的print()

sayHello() ->
    io:format("Welcome to the Erlang world!").
sayHello_withNextLine() ->
io:format("Welcome to the Erlang world!~n").

%% "~n" 在Erlang中就表示换行,类似于其他高级语言的“/n”

say2Body(Name) ->
io:format("Hi ~s, welcome to the Erlang world!",[Name]).

say2Body_withNextLine(Name) ->
    io:format("Hi ~s, welcome to the Erlang world!",[Name]).


%% Erlang之父：Joe ArmStrong 
%% 可以了解一下http://www.erlang-factory.com/conference/ErlangUserConference2012/speakers/joearmstrong
%% 他的博客：http://joearms.github.io/

say2all() ->
io:format("The father of Erlang: ~w,says: Concurrency is easy ~n",[joe_Armstrong]),
io:format("The world is concurrent.~n" ++ 
           "Things in the world don't share data.~n"++
           "Things communicate with message.~n" ++
           "Things fail.~n"
           ).