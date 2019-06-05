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

optimize(Nations) ->
    NationNameWithBest = [ {nation:name(N), best_export(N)} || N <- Nations ],
    maps:from_list(NationNameWithBest).

%%====================================================================
%% Internal functions
%%====================================================================
best_export(Nation) ->
    SortedExports = lists:sort(fun quicker_work/2, nation:exports(Nation)),
    [ {ExportName, _} | _ ] = SortedExports,
    ExportName.

quicker_work({_, H1}, {_, H2}) -> H1 < H2.
