
{ unstable, ... }:

{
    programs.thunderbird = {
        enable = true;
        package = unstable.thunderbird;
    };
}
