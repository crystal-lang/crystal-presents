[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)

# Crystal Presentations

This is a crystal playground that uses [Reveal.js](//lab.hakim.se/reveal-js) to build awesome presentations capable of running crystal code.

The slides are splitted across multiple files.

## Writing slides

Fork/clone and write your own slides in `./slides`.
Use the normal git branching so you can update the slide engine in the future.
This will also promote sharing the slides (if you wish).

Create `.html` and `.md` files for each slide in `./slides` folder.
Slides will appear in alphabetical order.

Numbering them as:

1. `010-`
2. `020-`

will allow you to easy put slides in between ;-). Use `./bin/add [Slide title]` to create this files automatically.

In a `.md` file you can use ````playground` to include a interactive playground snippet.

## Compile slides

```
$ ./bin/build-slides
```

```
$ crystal play
```

Open [http://localhost:8080/workbook/playground/slides](http://localhost:8080/workbook/playground/slides).

## Live reload

Start a crystal playground in a terminal and run `./bin/watch`. It will look for changes in `./slides` compile them and reload the current chrome tab.

```
$ crystal play
$ ./bin/watch
```

### ./bin/watch Requirements

* [entr](http://entrproject.org/)
* [chrome-cli](https://github.com/prasmussen/chrome-cli)

