-module('nation_test').
-author('Kevin C. Baird').

-include_lib("eunit/include/eunit.hrl").

nation_setup()     -> ok.
nation_teardown(_) -> ok.

nation_test_() ->
    {setup, fun nation_setup/0,
            fun nation_teardown/1,
            [
                fun make_case/0
            ]
    }.

make_case() ->
    Luna = nation:make(<<"luna">>, [{<<"moonrocks">>, 0.1}]),
    Name = nation:name(Luna),
    Exports = nation:exports(Luna),
    ?assertEqual(<<"luna">>, Name),
    ?assertEqual([<<"moonrocks">>], Exports).

%%% PRIVATE FUNCTIONS

