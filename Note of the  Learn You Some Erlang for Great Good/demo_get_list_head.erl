-module(demo_get_list_head).
-export([get_list_head/1,get_list_second/1]).

get_list_head([Head|_]) ->  Head.

get_list_second([_,Second|_]) ->Second.