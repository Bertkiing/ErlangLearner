### 第一部分

  安装Erlang shell 部分：请[直奔官网](https://www.erlang.org/),下载对应的软件即可。
  ***
### Erlang中的运算符
<strong> 包括(+ ,-,*,/,div,rem)</strong> 
 ``` 
1>  1 + 1.  %加号
2
2>  2 - 1.  %减号
1
3>  2 * 2.  %乘号
4
5>  5 / 2 . %除号
2.5
6>  5 div 2.  %(divider,取整)
2
7>  5 rem 2.  %(remainder,余数)
1
8>  (1 + 1) * 5.
10
 ``` 
### Erlang中的逻辑运算符
(and,or,xor,not,andalso,orelse)
```
    1> true and false . %逻辑 与
    false
    2> true or false .  %逻辑 或
    true
    3> true xor false . %逻辑 异或
    true
    4> not true .   %逻辑 非
    false
    5> true andalso false . %短路逻辑 与
    false
    6> true orelse false .  %短路逻辑   或
    true
```
### Erlang的比较运算符
(==,=:=,/=,=/=,<,>,>=,=<)
<br>注意这个小于等于号(=<)
```
    1>  1  == 1.    %等于
    true
    2>  1 =:= 1.0 .%严格等于(=:=),数值和类型一起判断
    false
    3>  1 /= 2  .
    false
    4>  1 /= 1.0 .  %不等于
    false
    5>  1 =/= 1.0 .%严格不等于(=/=),数值和类型一起判断
    ture
    6>  2 > 1 .   %大于
    true
    7>  2 >= 2 .  %大于等于
    true
    8>  1 < 2 .   %小于
    true
    9>  1 =< 1 .  %小于等于
    true
```

 