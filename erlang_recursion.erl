-module(erlang_recursion).
-export([
         fac/1,len/1,
         tail_fac/1,
         tail_len/1,
         duplicate/2,tail_duplicate/2,
         reverse/1,tail_reverse/1,
         sublist/2,tail_sublist/2,
         zip/2
        ]).

fac(N) when N =:= 0 -> 1;
fac(N) when N >0 -> N*fac(N-1).

%%--------获取list长度的函数-------
%%---------length/1----------


len([]) -> 0;
len([_|T]) -> 1 +len(T).

%%该方法的执行过程：
%% 1. len([1,2,3,4]) = len([1|[2,3,4]])
%% 2.                = 1 + len([2|[3,4]])
%% 3.                = 1 + 1 + len([3|[4]])
%% 4.                = 1 + 1 + 1 + len(4|[])
%% 5.                = 1 + 1 + 1 + 1 + len([])
%% 6.                = 1 + 1 + 1 + 1 + 0
%% 7.                = 1 + 1 + 1 + 1
%% 8.                = 1 + 1 + 2
%% 9.                = 1 + 3
%% 10.               = 4
%%
%%这样居然让函数展开了10次，效率可想而知。
%%  使用 ----尾递归 ----
%% 尾递归是一种变换上述线性过程(一个随着元素数据增多而增长的过程)到一个迭代过程(没有任何实际增长)
%%
%%要成为尾递归函数，则必须“无副作用”。
%%首先让我们看一下，是什么让我们的以前的函数调用不断增长，是第一次调用的结果依赖于第二次对函数的调用,以此类推。直到只剩下最后一个元素结果才会计算出来。
%% 尾递归函数的目标就是为了消除这种堆栈的堆叠。
%% 为了达到该目的,我们需要在我们的函数中增加一个额外的临时变量(也称为累加器)，它起到了限制我们调用的增长的作用，同时为我们提供了结果存储的地方。
%%



%% ------尾递归 斐波那契数列----------
tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Add) -> Add;
tail_fac(N,Add)  when N >0 -> tail_fac(N-1,N*Add).
%%  执行过程:
%% 1.tail_fac(3) = tail_fac(3,1)
%% 2.tail_fac(3) = tail_fac(2,3*1)
%% 3.tail_fac(2,3) = tail_fac(1,2*3)
%% 4.tail_fac(1,6) = tail_fac(0,1*6)
%% 5.tail_fac(0,6) = 6



%%------尾递归 求长度----
tail_len(L) -> tail_len(L,0).

tail_len([],Acc) -> Acc;
tail_len([_|T],Acc) -> tail_len(T,Acc +1).
%% 该方法的执行过程：
%% 1.tail_len([1,2,3,4]) -> tail_len([1,2,3,4],0) 
%% 2.tail_len([1,2,3,4]) -> tail_len([1|[2,3,4]]) -> tail_len([2,3,4],1)
%% 3.tail_len([[2,3,4]]) -> tail_len([2|[3,4]]) -> tail_len([3,4],2)
%% 4.tail_len([3,4]) -> tail_len(3|[4]) -> tail_len([4],3)
%% 5.tail_len([4]) -> tail_len(4|[]) ->tail_len([],4) -> 4

%% 递归是Erlang中仅有的循环体(除了列表结构),所以它是必须要牢记的原则之一。

%%------------列表复制函数----------
%%----------lists:duplicate/2---------------


duplicate(0,_) ->[];
duplicate(N,Term) when N > 0 -> [Term|duplicate(N-1,Term)].

%%尾递归函数,通过添加一个列表构建作为临时变量很容易将这个函数变成尾递归的：
tail_duplicate(N,Term) ->tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) -> List;
tail_duplicate(N,Term,List) when N > 0 ->
tail_duplicate(N-1,Term,[Term|List]).

%%-------列表反转函数----------
%%--------lists:reverse/1-------------

reverse([]) -> [];
reverse([F|List]) -> reverse(List) ++ [F]. %% ++ 连接两个列表

%% -------尾递归反转函数-------
tail_reverse(List) -> tail_reverse(List,[]).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T,[H|Acc]).
%% 过程分析：
%% 1. tail_reverse([1,2,3]) -> tail_reverse([1,2,3],[])
%% 2. tail_reverse([1|[2,3]]) -> tail_reverse([2,3],[1])
%% 3. tail_reverse([2|[3]]) -> tail_reverse([3],[2,1])
%% 4. tail_reverse([3|[]]) -> tail_reverse([],[3,2,1])
%% 5. tail_reverse([],[3,2,1]) -> [3,2,1]


%%--------列表的subList----------
%%----------lists:sublist/2--------------------

%% 问题描述:subList/2,接收一个列表和一个整形N,然后返回列表中前N个元素。
sublist(_,0) -> [];
sublist([],_) -> [];
sublist([First|Rest],N) when N > 0 ->
[First|sublist(Rest,N-1)].

%% 尾递归 做法
tail_sublist(L,N) -> reverse(tail_sublist(L,N,[])).


tail_sublist(_,0,SubList) -> SubList;
tail_sublist([],_,SubList) -> SubList;
tail_sublist([H|T],N,SubList) when N > 0 ->
tail_sublist(T,N-1, [H|SubList]).
%% 从某种意义上来说，在尾递归后再进行翻转是浪费时间的，但是你只说对了一部分（我们还是节省了很多内存的）。 
%% 在比较短的列表上，因为上面那个原因， 你也许会看到你的普通递归的代码运行的速度比尾递归的代码速度要快，
%% 但是随着数据量的增长， 翻转列表消耗的时间相对分割列表消耗的时间还是少。

%% -----我们应当使用lists:reverse/1代替自己编写的reverse/1函数,因为它经常被用于尾递归中,所以Erlang的开发者和维护者,将这个函数作为BIF实现了-------

%%---------zip/2 -----------
%%-----这个函数将接受两个列表当作参数,并将他们联合起来作为每个元组包含两个元素的列表------
%%------lists:zip/2-------



%% 两个参数的长度是相同的, 最基本的情况是两个参数是两个空列表：
zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

% tail_zip(L1,L2);
