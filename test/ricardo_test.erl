-module('ricardo_test').
-author('Kevin C. Baird').

-include_lib("eunit/include/eunit.hrl").

lone_test() ->
    ?assertEqual(true, write_some_real_ones).

% ricardo

ricardo_setup()     -> ok.
ricardo_teardown(_) -> ok.

ricardo_test_() ->
    {setup, fun ricardo_setup/0,
            fun ricardo_teardown/1,
            [
                fun ricardo_initial_case/0
            ]
    }.

ricardo_initial_case() ->
    ?assertEqual(true, write_some_real_ones).

%%% PRIVATE FUNCTIONS

