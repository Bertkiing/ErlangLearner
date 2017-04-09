-module(erlang_exceptions).
-compile(export_all).
% -export([throws/1]).

throws(F) ->
    try  F() of
         _ -> ok
    catch
    %   Throw -> {throw,caught,Throw}
      throw:Throw -> {throw,caught,Throw}
end.

%  error异常
    errors(F) ->
        try F() of 
            _  -> ok
            catch
                % Error -> {error,caught,Error}
                error:Error -> {error,caught,Errorss}
            end.
            
%  exit异常
exit(F) ->
    try F() of
        _ -> ok
        catch
            % Exit -> {exit,caught,Exit}
           exit: Exit -> {exit,caught,Exit}
            end.