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
                fun ricardo_england_portugal_case/0,
                fun triple_case/0,
                fun quadruple_case/0
            ]
    }.

ricardo_empty_case() ->
    ?assertEqual(#{}, ricardo:optimize([])).

ricardo_single_case() ->
    Isolate = nation:make(<<"isolated">>, [{<<"foo">>, 0.3}]),
    % specific efficiency does not matter, they produce everything
    ?assertEqual(#{<<"isolated">> => <<"foo">>}, ricardo:optimize([Isolate])).

% https://en.wikipedia.org/wiki/Comparative_advantage#Ricardo's_example
ricardo_england_portugal_case() ->
    Eng = nation:make(<<"England">>, [{<<"cloth">>, 100}, {<<"wine">>, 120}]),
    Por = nation:make(<<"Portugal">>, [{<<"cloth">>, 90}, {<<"wine">>, 80}]),
    Results = ricardo:optimize([Eng, Por]),
    ?assertEqual(#{<<"England">>  => <<"cloth">>,
                   <<"Portugal">> => <<"wine">>}, Results).

triple_case() ->
    Eng = nation:make(<<"England">>, [{<<"beer">>, 110}, {<<"cloth">>, 100}, {<<"wine">>, 120}]),
    Ger = nation:make(<<"Germany">>, [{<<"beer">>, 50}, {<<"cloth">>, 80}, {<<"wine">>, 90}]),
    Por = nation:make(<<"Portugal">>, [{<<"beer">>, 100}, {<<"cloth">>, 90}, {<<"wine">>, 80}]),
    Results = ricardo:optimize([Eng, Ger, Por]),
    ?assertEqual(#{<<"England">>  => <<"cloth">>,
                   <<"Germany">>  => <<"beer">>,
                   <<"Portugal">> => <<"wine">>}, Results).

quadruple_case() ->
    Eng = nation:make(<<"England">>, [{<<"beer">>, 110}, {<<"cheese">>, 100}, {<<"cloth">>, 100}, {<<"wine">>, 120}]),
    Fra = nation:make(<<"France">>, [{<<"beer">>, 100}, {<<"cheese">>, 60}, {<<"cloth">>, 90}, {<<"wine">>, 80}]),
    Ger = nation:make(<<"Germany">>, [{<<"beer">>, 50}, {<<"cheese">>, 80}, {<<"cloth">>, 80}, {<<"wine">>, 90}]),
    Por = nation:make(<<"Portugal">>, [{<<"beer">>, 100}, {<<"cheese">>, 90}, {<<"cloth">>, 90}, {<<"wine">>, 80}]),
    Results = ricardo:optimize([Eng, Fra, Ger, Por]),
    ?assertEqual(#{<<"England">>  => <<"cloth">>,
                   <<"France">>   => <<"cheese">>,
                   <<"Germany">>  => <<"beer">>,
                   <<"Portugal">> => <<"wine">>}, Results).

%%% PRIVATE FUNCTIONS

