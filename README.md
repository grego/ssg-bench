# Static site generator benchmarks

Benchmarking static site generators can hardly be made accurate.
They come with different feature sets and scopes. Their performance may depend
a lot on disk busyness and other external factors.

Here, just a little attempt is made. [Blades](https://github.com/grego/blades), 
[Zola](https://github.com/getzola/zola) and [Hugo](https://github.com/gohugoio/hugo)
(the self-proclaimed "world’s fastest framework for building websites") are compared.
They use the same theme (based on [BOOTSTRA.386](https://kristopolous.github.io/BOOTSTRA.386)),
tailored for each, with pages that have the same content (as far as possible).
Feel free to browse the code, judge how representative it is and suggest improvements
for more fairness and accuracy.
The internal measurement of time for each program is used and is parsed from the output.

## Results
Intel Core i5-2400S @ 2.66GHz, 4 physical cores, HDD:
```
blades: 2.52743 ms (±.28058)
zola: 33.75000 ms (±.81700)
hugo: 42.43000 ms (±11.75521)
```

Intel Core i5-3230M CPU @ 2.60GHz, 2 physical cores, SSD:
```
blades: 2.86216 ms (±.28282)
zola: 29.13000 ms (±.90172)
hugo: 45.71000 ms (±3.11542)
```

Rockchip 3399, 2+4 physical cores, eMMC:
```
blades: 10.11564 ms (±1.26302)
zola: 242.10000 ms (±18.54804)
hugo: 223.52000 ms (±27.17921)
```

## Running
Run `bench.sh` to run the benchmarks. You need to have [ripgrep](https://github.com/BurntSushi/ripgrep)
and [bc](https://www.gnu.org/software/bc) installed.

The default number of iterations is 100. You can edit it in `bench.sh`.

## Ad Blades
Compared to the other two, Blades is a young hobby project, aiming at possibly different,
simpler feature set. It could be rightfully claimed that this may provide an unfair advantage
in this comparison, since even if the generator _Y_ doesn't use the feature _X_ here
(all features like that were attempted to be disabled),
it makes its architecture inherently more complex.

To counter this, Blades has one feature enabled that the others lack: generating image galleries.
That means it needs to generate nearly twice as many (9 vs 5) regular pages than the others
and the page template is a little more complex. 

Nevertheless, the results should still be taken with a grain of salt and a consideration
of all of this.
