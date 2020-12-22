-module(export).

%% API exports
-export([
    make/2,
    format/1,
    name/1
]).

-include("include/common.hrl").

%%====================================================================
%% API functions
%%====================================================================
-spec make(name(), hours()) -> export().
make(Name, Hours) when is_binary(Name) andalso is_number(Hours) ->
    #export{name = Name, hours = Hours}.

-spec format(export()) -> {name(), hours()}.
format(#export{name = Name, hours = Hours}) -> {Name, Hours}.

-spec name(export()) -> name().
name(#export{name = Name}) -> Name.

%%====================================================================
%% Internal functions
%%====================================================================
