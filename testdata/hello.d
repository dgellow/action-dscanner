import std.stdio;

// Issue: Prefer the new "'alias' identifier '=' type ';'" syntax to the  old "'alias' type identifier ';'" syntax.
alias string myString;

// Issue: Empty declaration
;

void main(string[] args)
{
	try
	{
		writeln("Hello World");
	}
	// Issue: Catching Error or Throwable is almost always a bad idea.
	catch (Throwable)
	{
	}
}
