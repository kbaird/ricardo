-module('ricardo_test').
-author('Kevin C. Baird').

-include_lib("eunit/include/eunit.hrl").

% ricardo

ricardo_setup()     -> ok.
ricardo_teardown(_) -> ok.

ricardo_test_() ->
    {setup, fun ricardo_setup/0,
            fun ricardo_teardown/1,
            [
                fun ricardo_empty_case/0,
                fun ricardo_single_case/0%,
                %fun ricardo_monocrops_case/0
            ]
    }.

ricardo_empty_case() ->
    ?assertEqual(#{}, ricardo:optimize([])).

ricardo_single_case() ->
    Isolate = nation:make(<<"isolated">>, [{<<"foo">>, 0.3}]),
    % specific efficiency does not matter, they produce everything
    ?assertEqual(#{<<"isolated">> => #{<<"foo">> => 1}}, ricardo:optimize([Isolate])).

ricardo_monocrops_case() ->
    ProducesOnlyFoo = nation:make(<<"foosource">>, [{<<"foo">>, 1}]),
    ProducesOnlyBar = nation:make(<<"barsource">>, [{<<"bar">>, 1}]),
    Results = ricardo:optimize([ProducesOnlyFoo, ProducesOnlyBar]),
    ?assertEqual(true, Results).

%%% PRIVATE FUNCTIONS

