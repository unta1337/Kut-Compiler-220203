var
    A: Integer = 10;
    B: boolean = false;

begin
    if A > 10 then
        DoSomething;
    else
        DoSomethingElse;

    B := A > 10;
    while B do
        DoSomething;
    end;
end;
