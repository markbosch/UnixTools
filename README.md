# Unix tools

## wc

Simple word count program in Haskell based on the Unix `wc` command from coding challenge [Write Your own wc Tool](https://codingchallenges.fyi/challenges/challenge-wc/).

Options are:

- `-c` count bytes
- `-l` count lines
- `-w` count words
- `-m` count characters

If you have Haskell installed, just run:

```shell
> runghc ws.hs test.txt
```

Count the number of bytes in a file.

```shell
> runghc ws.hs -c test.txt
```

Read from the standard input.

```shell
> cat test.txt | runghc ws.hs -c
```
