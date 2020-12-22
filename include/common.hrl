-type name() :: binary().
-type hours() :: number().

-record(export,
    {
        name :: name(),
        hours :: number()
    }).
-type export() :: #export{}.

-record(nation,
    {
        name :: name(),
        exports :: [export(), ...]
    }).
-type nation() :: #nation{}.

-export_type([
    nation/0
]).

