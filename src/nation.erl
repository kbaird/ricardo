-module(nation).

%% API exports
-export([
    make/2,
    name/1,
    exports/1
]).

-include("include/common.hrl").

%%====================================================================
%% API functions
%%====================================================================
-spec make(name(), [export(), ...]) -> nation().
make(Name, RawExports) when is_binary(Name) ->
    Exports = [export:make(EN, EH) || {EN, EH} <- RawExports],
    #nation{name = Name, exports = Exports}.

-spec name(nation()) -> name().
name(#nation{name = Name}) -> Name.

-spec exports(nation()) -> [{name(), number()}, ...].
exports(#nation{exports = Exports}) ->
    [export:format(E) || E <- Exports].

%%====================================================================
%% Internal functions
%%====================================================================
