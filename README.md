# Static site generator benchmarks

Benchmarking static site generators can hardly be made accurate.
They come with different feature sets and scopes. Their performance may depend
a lot on disk busyness and other external factors.

Here, just a little attempt is made. [Blades](https://github.com/grego/blades), 
[Zola](https://github.com/getzola/zola) and [Hugo](https://github.com/gohugoio/hugo)
(the self-proclaimed "world’s fastest framework for building websites") are compared.
They use the same theme (based on [BOOTSTRA.386](https://kristopolous.github.io/BOOTSTRA.386)),
taylored for each, with pages that have the same content (as far as possible).
Feel free to browse the code, judge how representative it is and suggest improvements
for more fairness and accuracy.
The internal measurement of time for each program is used and is parsed from the output.

On author's old machine (2011 Intel Core i5-2400S @ 2.66GHz, 4 physical cores),
these results were measured:

```
blades: 3.43311 ms (±1.41216)
zola: 44.90000 ms (±4.08778)
hugo: 53.46000 ms (±8.47516)
```

## Running
Run `bench.sh` to run the benchmarks. You need to have [ripgrep](https://github.com/BurntSushi/ripgrep)
and [bc](https://www.gnu.org/software/bc) installed.

The default number of iterations is 100. You can edit it in `bench.sh`.

## Ad Blades
Compared to the other two, Blades is a young hobby project, aiming at possibly different,
simpler feature set. It could be rightfully claimed that this may provide an unfair advantage
in this comparison, since even if the generator _Y_ doesn't use the feature _X_ here,
(all features like that were attempted to be disabled),
it makes it's architecture inherently more complex.

To counter this, Blades have one feature enabled that the others lack: generating image galleries.
That means it needs to generate nearly twice as many (9 vs 5) regular pages than the others
and the page template is a little more complex. 

Nevertheless, the results should still be taken with a grain of salt and a consideration
of all of this.
