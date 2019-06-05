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
make(Name, RawExports) ->
    Exports = [#export{name = EN, hours = EH} || {EN, EH} <- RawExports],
    #nation{name = Name, exports = Exports}.

-spec name(nation()) -> name().
name(#nation{name = Name}) -> Name.

-spec exports(nation()) -> [{name(), number()}, ...].
exports(#nation{exports = Exports}) ->
    [format_export(E) || E <- Exports].

%%====================================================================
%% Internal functions
%%====================================================================
-spec format_export(export()) -> {name(), number()}.
format_export(#export{name = Name, hours = Hours}) -> {Name, Hours}.
