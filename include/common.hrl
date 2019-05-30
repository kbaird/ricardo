-type name() :: binary().

-record(export,
    {
        name :: name(),
        efficiency :: number()
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

