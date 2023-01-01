%%

%public
%class MyLexer
%type Token
%function nextToken

%line
%column
%unicode
%pack

%{
    enum TokenType {
        IF,
        ID,
        INT,
        FLOAT,
        DOT
    }
    class Token {
        TokenType type;
        Object attribute;
        Token(TokenType tt) {
            type = tt; attribute = null;
        }
        Token(TokenType tt, Object attr) {
            type = tt; attribute = attr;
        }
        public String toString() {
            return "" + type + "(" + attribute + ")";
        }
    }
    public int lineNumber() { return yyline + 1; }
    public int column() { return yycolumn + 1; }
%}

Whitespace = [ \t\f\r\n]
Letter = [a-zA-Z]
Digit = [0-9]
Identifier = {Letter}({Digit}|{Letter}|_)*
Integer = "0"|"-"?[1-9]{Digit}*
Float = {Digit}+ "." {Digit}+
Op = "+" | "-" | "*" | "/"

%state COMMENT

%%

<YYINITIAL> {
    {Whitespace}  { System.out.println("ignoring whitespace"); }
    "if"          { return new Token(TokenType.IF); }
    {Identifier}  { return new Token(TokenType.ID, yytext()); }
    {Integer}     { return new Token(TokenType.INT,
                                    Integer.parseInt(yytext())); }
    {Float}       { return new Token(TokenType.FLOAT,
                                    Float.parseFloat(yytext())); }
    "/*"          { yybegin(COMMENT); System.out.println("Starting comment"); }
}
<COMMENT> {
    "*/"          { yybegin(YYINITIAL); System.out.println("Ended comment"); }
    [^]           { System.out.println("Ignoring comment character: " + yytext()); }
}
"."               { return new Token(TokenType.DOT); }
