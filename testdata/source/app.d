import std.stdio;

// Warning: Prefer the new "'alias' identifier '=' type ';'" syntax to the  old "'alias' type identifier ';'" syntax.
alias string myString;

// Warning: Empty declaration
;

void main(string[] args)
{
	try
	{
		writeln("Hello World");
	}
	// Warning: Catching Error or Throwable is almost always a bad idea.
	catch (Throwable)
	{
	}

	// Error: Expected `)` instead of `;`
	writeln("hmm, you should have close that one";
}
