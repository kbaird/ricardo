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
                fun ricardo_single_case/0,
                fun ricardo_england_portugal_case/0
            ]
    }.

ricardo_empty_case() ->
    ?assertEqual(#{}, ricardo:optimize([])).

ricardo_single_case() ->
    Isolate = nation:make(<<"isolated">>, [{<<"foo">>, 0.3}]),
    % specific efficiency does not matter, they produce everything
    ?assertEqual(#{<<"isolated">> => [<<"foo">>]}, ricardo:optimize([Isolate])).

% https://en.wikipedia.org/wiki/Comparative_advantage#Ricardo's_example
ricardo_england_portugal_case() ->
    Eng = nation:make(<<"England">>, [{<<"cloth">>, 100}, {<<"wine">>, 120}]),
    Por = nation:make(<<"Portugal">>, [{<<"cloth">>, 90}, {<<"wine">>, 80}]),
    Results = ricardo:optimize([Eng, Por]),
    ?assertEqual(#{<<"England">> => [<<"cloth">>], <<"Portugal">> => [<<"wine">>]}, Results).

%%% PRIVATE FUNCTIONS

