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
    Exports = [#export{name = EN, efficiency = EE} || {EN, EE} <- RawExports],
    #nation{name = Name, exports = Exports}.

-spec name(nation()) -> name().
name(#nation{name = Name}) -> Name.

-spec exports(nation()) -> [export(), ...].
exports(#nation{exports = Es}) -> [export_name(E) || E <- Es].

%%====================================================================
%% Internal functions
%%====================================================================
-spec export_name(export()) -> name().
export_name(#export{name = Name}) -> Name.
