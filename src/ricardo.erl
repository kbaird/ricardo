-module(ricardo).

%% API exports
-export([
    optimize/1
]).

-include("include/common.hrl").

%%====================================================================
%% API functions
%%====================================================================
-spec optimize([nation()]) -> map().
optimize([]) -> maps:new();
optimize([Nation]) ->
    Name = nation:name(Nation),
    ProducesEverything = [{ExportName,1} || ExportName <- nation:exports(Nation)],
    #{Name => maps:from_list(ProducesEverything)}.

%%====================================================================
%% Internal functions
%%====================================================================
