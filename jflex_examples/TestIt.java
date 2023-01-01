import java.io.InputStreamReader;

class TestIt {
    public static void main(String[] argv) throws java.io.IOException {
        MyLexer lex = new MyLexer(new InputStreamReader(System.in));
        while (true) {
            try {
                MyLexer.Token t = lex.nextToken();
                if (t == null) break;
                System.out.println("token: " + t);
            } catch (Error e) {
                System.out.println("lexical error at line " + lex.lineNumber() +
                    ", column " + lex.column());
                break;
            }
        }
    }
}
